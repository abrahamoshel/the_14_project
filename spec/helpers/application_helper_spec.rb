require 'spec_helper'

describe ApplicationHelper do
  include Devise::TestHelpers

  it "gives the SIGN IN link if a user is NOT signed in" do
    helper.stub(:current_user) { nil }
    helper.stub(:user_signed_in?) { false }
    expect(session_link_helper).to eq(link_to "Login", new_user_session_path)
  end

  it "gives the SIGN OUT link if a user is signed in" do
    helper.stub(:current_user) { User.new }
    helper.stub(:user_signed_in?) { true }
    expect(session_link_helper).to eq(link_to "Logout", destroy_user_session_path, method: :delete)
  end
end
