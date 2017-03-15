require 'rails_helper'

RSpec.describe Request, type: :model do
  describe 'Request creation' do
    before do
      @user = FactoryGirl.create(:user)
      @request = FactoryGirl.create(:request)
    end

    it 'can create a request' do
      expect(@request).to be_valid
    end

    it 'cannot be created without valid date' do
      @request.date = nil
      expect(@request).to_not be_valid
    end

    it 'cannot be created without valid summary' do
      @request.work_summary = nil
      expect(@request).to_not be_valid
    end

    it 'cannot be created without valid in_time and out_time' do
      @request.in_time = nil
      @request.out_time = nil
      expect(@request).to_not be_valid
    end

    it 'request hours must be set using in and out times' do
      request = Request.create!(date: Date.today, work_summary: "Some excuse for more money", in_time: Time.now-9.hours, out_time: Time.now, user_id: @user.id)
      expect(request.day_hours).to eq(9.0)
    end
  end
end
