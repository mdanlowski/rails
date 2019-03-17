require "open-uri"

class Redir < ApplicationRecord
    url_regex = /(https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&\/\/=]*)/
    
    validates :source, presence: true, format: { with: url_regex }


    # a micorservice to return a databasewise unique 8-character ID
    def self.get_unique_hash(input)   
      # if the provided link IS NOT already in db, generate new 8char ID
      already_in = Redir.find_by(source: input)

      if already_in.nil?
        # see if the link makes sense
        content = self.inspect_link(input)
        if content.class == Hash
          return content
        end

        attempt = Digest::SHA2.hexdigest(input)
        attempt =  attempt[0..3] + attempt[-4..-1]
        
        # making sure that the new link (that does not exist in DB)
        # wont be given the same random id; chances are low tho
        while Redir.find_by(hashed: attempt)
          gnarl = SecureRandom.hex
          attempt = Digest::SHA2.hexdigest(input + gnarl)
          attempt =  attempt[0..3] + attempt[-4..-1]
        end    

        return {
          result: "new", # duplicate | new
          already_in_database: false,
          hashed: attempt,
          msg: false
        }

      # if it is though, simply return existing redirect
      else
        {
          result: "duplicate",
          already_in_database: true,
          hashed: already_in.hashed,
          msg: false
        }
      end

    end

    # does link return anything?
    def self.inspect_link(input)
      begin
        %r/^http/.match(input).nil? ? input = "https://" + input : true
        content = Nokogiri::HTML(open(input,{ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}))
        content.pretty_inspect.length
      rescue Exception
        {
          result: "error/exception",
          already_in_database: false,
          hashed: nil,
          msg: "We're sorry, but something went wrong. Please make sure your URL leads anywhere and try again."
        }
      end

    end
end
