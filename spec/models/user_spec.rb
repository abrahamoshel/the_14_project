require 'spec_helper'

describe User do
  context 'validity' do

    context 'nope' do
      let(:user) { build_stubbed :user}

      it { expect(user).to have(1).error_on(:email) }
      it { expect(user).to have(1).error_on(:first_name) }
      it { expect(user).to have(1).error_on(:last_name) }

      it 'should not allow dupicate emails' do
        create :valid_user, email: 'too_many@hey.com'
        dup = build_stubbed :valid_user, email: 'too_many@hey.com'
        expect(dup).to have(1).error_on(:email)
        expect(dup.errors_on(:email)).to include('has already been taken')
      end
    end

    it { expect(build_stubbed :valid_user).to be_valid }
  end

  context 'user events' do
    let(:created_by_user) { build_stubbed :valid_user }
    let(:contact_user) { build_stubbed :valid_user }
    let(:event) { 
      create(:valid_event, 
        created_by: created_by_user, 
        contact: contact_user
      )
    }

    it 'should have created events' do
      expect(created_by_user).to respond_to(:created_events)
      expect(created_by_user.created_events).to include(event)
    end

    it 'should have events it is the contact for' do
      expect(contact_user).to respond_to(:event_responsibilities)
      expect(contact_user.event_responsibilities).to include(event)
    end
  end
end
