require 'spec_helper'

describe Post do

  context 'validity' do

    context 'nope' do
      let(:post) { build_stubbed :post }

      it { expect(post).to have(1).error_on(:title) }
      it { expect(post).to have(1).error_on(:body) }
      it { expect(post).to have(1).error_on(:user) }
    end

    it { expect(build_stubbed :valid_post).to be_valid }
  end
end
