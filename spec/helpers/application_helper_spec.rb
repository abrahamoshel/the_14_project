require 'spec_helper'

module FakeDeviseModule
  ANSWER = false
  def user_signed_in?
    ANSWER
  end
end

describe ApplicationHelper do
  include FakeDeviseModule

  before :each do
    FakeDeviseModule::ANSWER = answer
  end

  context "User is NOT signed in" do
    let(:answer) { false }

    it "gives the SIGN IN link" do
      expect(session_link_helper).to eq(link_to "Login", new_user_session_path)
    end
  end

  context "User IS signed in" do
    let(:answer) { true }

    it "gives the SIGN OUT link" do
      expect(session_link_helper).to eq(link_to "Logout", destroy_user_session_path, method: :delete)
    end
  end
end
