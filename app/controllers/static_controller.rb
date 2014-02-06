class StaticController < ApplicationController
  def index
    render text: 'Home'
  end

  def about_us
    render text: 'About'
  end

  def contact_us
    render text: 'Contact us'
  end

end
