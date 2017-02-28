require 'rails_helper'

RSpec.describe Request, type: :model do
  describe 'Off Request' do
    before do
      @request = FactoryGirl.create(:request)
    end

    it 'can create a request' do
      expect(@request).to be_valid
    end

    it 'cannot be created without all valid entries' do
      @request.date = nil
      @request.reason = nil
      @request.request_hours = nil
      expect(@request).to_not be_valid
    end

    it 'request hours must be greater than 0.0' do
      @request.request_hours = 0.0
      expect(@request).to_not be_valid
    end
  end
end
