require 'rails_helper'

describe 'navigation' do
  let(:user) { FactoryGirl.create(:user) }
  let(:request) do
    Request.create(date: Date.today, work_summary: "Some summary of excuse", user_id: user.id, in_time: Time.now-8.hours, out_time: Time.now)
  end

  before do
    login_as(user, :scope => :user)
  end

  describe "requests index" do
    it "has content" do
      visit requests_path
      expect(page).to have_content(/Requests/)
    end

    it "has a list of all requests" do
      request1 = FactoryGirl.create(:request)
      request2 = FactoryGirl.create(:another_request)
      request1.update(user_id: user.id)
      request2.update(user_id: user.id)
      visit requests_path
      expect(page).to have_content(/excuse/)
    end

    it "should show only the request of the corresponding user" do
      request1 = Request.create(date: Date.yesterday, work_summary: "excuse 1 test", user_id: user.id, in_time: Time.now-9.hours, out_time: Time.now)
      request2 = Request.create(date: Date.yesterday, work_summary: "excuse 2 test", user_id: user.id, in_time: Time.now-9.hours, out_time: Time.now)

      random_user = User.create(first_name: "Unauthorized", last_name: "User", email: "unauthorized_user@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", phone: "5555555555")
      request_from_random_user = Request.create(date: Date.yesterday, work_summary: "Unauthorized test", user_id: random_user.id, in_time: Time.now-9.hours, out_time: Time.now)

      visit requests_path
      expect(page).to_not have_content(/Unauthorized test/)
    end
  end

  describe "adding requests" do
    before do
      visit new_request_path
    end

    it "should be able to fill form for request" do
      fill_in 'request[date]', with: Date.today
      fill_in 'request[work_summary]', with: "Summary for request"
      fill_in 'request[in_time]', with: Time.now-9.hours
      fill_in 'request[out_time]', with: Time.now

      expect { click_on "Submit" }.to change(Request, :count).by(1)
    end

    it "must have a user associated" do
      fill_in 'request[date]', with: Date.today
      fill_in 'request[work_summary]', with: "User Association"
      fill_in 'request[in_time]', with: Time.now-9.hours
      fill_in 'request[out_time]', with: Time.now
      click_on "Submit"

      expect(User.last.requests.last.work_summary).to eq("User Association")
    end
  end

  describe "editing requests" do
    it "is editable" do
      visit edit_request_path(request)
      fill_in 'request[date]', with: Date.today
      fill_in 'request[work_summary]', with: "Summary is Edited"
      click_on "Submit"

      expect(page).to have_content("Summary is Edited")
    end

    it "should not be editable by non authorized user" do
      logout(:user)
      unauthorized_user = FactoryGirl.create(:unauthorized_user)
      login_as(unauthorized_user, :scope => :user)

      visit edit_request_path(request)
      expect(current_path).to eq(root_path)
    end
  end

  describe "deleting requests" do
    it "can delete requests" do
      delete_test_request = FactoryGirl.create(:request)
      delete_test_request.update(user_id: user.id)
      visit requests_path

      click_link("delete_request_#{delete_test_request.id}")
      expect(page.status_code).to eq(200)
    end
  end
end
