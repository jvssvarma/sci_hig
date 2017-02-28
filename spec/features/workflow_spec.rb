require "rails_helper"

describe 'navigate approval workflow' do
  before do
    @adminuser = FactoryGirl.create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end

  describe 'edit' do
    before do
      @request = FactoryGirl.create(:request)
      visit edit_request_path(@request)
    end

    it "restricts non admin users from editing admin requests" do
      @request.approved!
      logout(:user)
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit edit_request_path(@request)
      expect(page).to_not have_content('Approved')
    end

    it "restrictes non admin users from editing their requests after approval" do
      @request.approved!
      logout(:user)
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      @request.update(user_id: user.id, status: "approved")
      visit edit_request_path(@request)
      expect(current_path).to eq(root_path)
    end
  end

end
