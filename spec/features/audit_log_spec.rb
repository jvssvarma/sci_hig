require "rails_helper"

describe "AuditLog Feature test" do
  describe 'index' do
    before do
      admin_user = FactoryGirl.create(:admin_user)
      login_as(admin_user, :scope => :user)
      FactoryGirl.create(:audit_log)
    end

    it "must have an index that can be reached" do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it "must render audit log" do
      visit audit_logs_path
      expect(page).to have_content(/DEPP, JOHNNY/)
    end

    it "must not give access to non admin users" do
      logout(:user)
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit audit_logs_path
      expect(current_path).to eq(root_path)
    end
  end
end
