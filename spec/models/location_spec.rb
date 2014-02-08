require 'spec_helper'

describe Location do

  context 'event' do
    let(:location)  { build_stubbed :valid_location }
    let(:event1)    { create :valid_event, location: location }
    let(:event2)    { create :valid_event, location: location }

    it 'should know the events it is a part of' do
      expect(location).to respond_to(:events)
      expect(location.events).to match_array([event1, event2])
    end
  end

  context 'validity' do

    context 'nope' do
      let(:location) { build_stubbed :location }

      it { expect(location).to have(1).error_on(:name) }
      it { expect(location).to have(1).error_on(:addr1) }
      it { expect(location).to have(1).error_on(:city) }
      it { expect(location).to have(1).error_on(:state) }
      it { expect(location).to have(1).error_on(:zip) }
    end

    it { expect(build_stubbed :valid_location).to be_valid } 
  end
end
