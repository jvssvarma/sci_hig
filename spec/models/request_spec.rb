require 'rails_helper'

RSpec.describe Request, type: :model do
  describe 'Off Request' do
    before do
      @request = FactoryGirl.create(:request)
    end

    it 'can create a request' do
      expect(@request).to be_valid
    end

    it 'cannot be created without date and reason' do
      @request.date = nil
      @request.reason = nil
      expect(@request).to_not be_valid
    end
  end
end
