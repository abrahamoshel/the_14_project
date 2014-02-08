require 'spec_helper'

describe Event do
  context 'validity' do

    context 'nope' do
      let(:event) { build_stubbed :event }

      it { expect(event).to have(1).error_on(:title) }
      it { expect(event).to have(1).error_on(:description) }
      it { expect(event).to have(1).error_on(:created_by) }
      it { expect(event).to have(1).error_on(:contact) }
    end

    it { expect(build_stubbed :valid_event).to be_valid }
  end

  context 'users' do
    let(:created_by_user) { build_stubbed :valid_user }
    let(:contact_user) { build_stubbed :valid_user }
    let(:event) { 
      build_stubbed(:valid_event, 
        created_by: created_by_user,
        contact: contact_user
      )
    }

    it 'has a created_by user' do
      expect(event).to respond_to :created_by
      expect(event.created_by.first_name).to eql(created_by_user.first_name)
    end 

    it 'has a contact user' do
      expect(event).to respond_to :contact
      expect(event.contact.first_name).to eql(contact_user.first_name)
    end
  end
end
