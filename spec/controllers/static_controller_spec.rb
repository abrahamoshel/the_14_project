require 'spec_helper'

describe StaticController do

  describe "Home page" do

    it "should have the content 'Home'" do
      visit '/'
      expect(page).to have_content('Home')
    end
  end

  describe "About us page" do

    it "should have the content 'About'" do
      visit '/about_us'
      expect(page).to have_content('About')
    end
  end

  describe "Contact us page" do

    it "should have the content 'Contact us'" do
      visit '/contact_us'
      expect(page).to have_content('Contact us')
    end
  end

end
