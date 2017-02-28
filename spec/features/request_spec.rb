require 'rails_helper'

describe 'navigation' do
  let(:user) { FactoryGirl.create(:user) }
  let(:request) do
    Request.create(date: Date.today, reason: "Some reason of excuse", user_id: user.id)
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
      request1 = Request.create(date: Date.yesterday, reason: "excuse 1 test", user_id: user.id)
      request2 = Request.create(date: Date.yesterday, reason: "excuse 2 test", user_id: user.id)

      random_user = User.create(first_name: "Unauthorized", last_name: "User", email: "unauthorized_user@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")
      request_from_random_user = Request.create(date: Date.yesterday, reason: "Unauthorized test", user_id: random_user.id)

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
      fill_in 'request[reason]', with: "Reason for request"
      click_on "Submit"

      expect(page).to have_content("Reason for request")
    end

    it "must have a user associated" do
      fill_in 'request[date]', with: Date.today
      fill_in 'request[reason]', with: "User Association"
      click_on "Submit"

      expect(User.last.requests.last.reason).to eq("User Association")
    end
  end

  describe "editing requests" do
    it "is editable" do
      visit edit_request_path(request)
      fill_in 'request[date]', with: Date.today
      fill_in 'request[reason]', with: "Reason is Edited"
      click_on "Submit"

      expect(page).to have_content("Reason is Edited")
    end

    it "should not be editable by non authorized user" do
      logout(:user)
      unauthorized_user = FactoryGirl.create(:unauthorized_user)
      login_as(unauthorized_user, :scope => :user)

      visit edit_request_path(request)
      expect(current_path).to eq(root_path)
    end
  end

  describe "creating new requests from home path" do
    it "using link to new requests" do
      visit root_path

      click_link("Add Request")
      expect(page.status_code).to eq(200)
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
