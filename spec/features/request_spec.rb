require 'rails_helper'

describe 'navigation' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  describe "requests index" do
    it "has content" do
      visit requests_path
      expect(page).to have_content(/Requests/)
    end

    it "has a list of all requests" do
      request1 = FactoryGirl.create(:request)
      request2 = FactoryGirl.create(:another_request)
      visit requests_path
      expect(page).to have_content(/excuse/)
    end
  end

  describe "adding requests" do
    before do
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

  describe "editing requests" do
    before do
      @request = FactoryGirl.create(:request)
    end
    it "is accessible from the index page" do
      visit requests_path
      click_link("edit_#{@request.id}")
      expect(page.status_code).to eq(200)
    end

    it "is editable" do
      visit edit_request_path(@request)
      fill_in 'request[date]', with: Date.today
      fill_in 'request[reason]', with: "Reason is Edited"
      click_on "Save"

      expect(page).to have_content("Reason is Edited")
    end

    describe "creating new requests from home path" do
      it "using link to new requests" do
        visit root_path

        click_link("Add Request")
        expect(page.status_code).to eq(200)
      end
    end
  end
end
