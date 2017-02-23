require "rails_helper"

describe 'navigate approval workflow' do
  before do
    @adminuser = FactoryGirl.create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end

end
