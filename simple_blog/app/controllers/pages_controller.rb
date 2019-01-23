class PagesController < ApplicationController
  def about
  	@header_text = "About This Blog"
  end

  def contact
  	@header_text = "Get in Touch"

  end
end
