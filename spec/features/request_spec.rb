require 'rails_helper'

describe 'navigation' do
  describe 'requests index' do
    it "has content" do
      visit requests_path
      expect(page).to have_content(/Requests/)
    end
  end

  describe "adding requests" do
    before do
      user = User.create(id: 1, email: 'checking@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf', first_name: 'john', last_name: 'doe')
      login_as(user, :scope => :user)
      visit new_request_path
    end

    it "should be able to fill form for request" do
      fill_in 'request[date]', with: Date.today
      fill_in 'request[reason]', with: "Reason for request"
      click_on "Save"

      expect(page).to have_content("Reason for request")
    end

    it "must have a user associated" do
      fill_in 'request[date]', with: Date.today
      fill_in 'request[reason]', with: "User Association"
      click_on "Save"

      expect(User.last.requests.last.reason).to eq("User Association")
    end
  end
end
