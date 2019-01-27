class Redir < ApplicationRecord
    self.per_page = 10

    url_regex = /(https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&\/\/=]*)/
    
    validates :from, presence: true, format: { with: url_regex }

end
