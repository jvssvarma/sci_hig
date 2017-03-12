require 'rails_helper'

describe 'navigate' do
  describe 'welcome index' do
    it 'is accessible' do
      visit root_path
      expect(page.status_code).to eq(200)
    end

    it 'allows the admin to approve requests' do
      request = FactoryGirl.create(:request)
      admin_user = FactoryGirl.create(:admin_user)
      login_as(admin_user, :scope => :user)
      visit root_path
      click_on("#{request.id}_approve")
      expect(request.reload.status).to eq('approved')
    end
  end
end
