require "rails_helper"

RSpec.describe PaperTrail do
  describe 'RSpec test group' do
    it 'by default, PaperTrail will be turned off' do
      expect(PaperTrail).not_to be_enabled
    end

    with_versioning do
      it 'within a `with_versioning` block it will be turned on' do
        expect(PaperTrail).to be_enabled
      end
    end

    it 'can be turned on at the `it` or `describe` level', :versioning do
      expect(PaperTrail).to be_enabled
    end
  end
end
