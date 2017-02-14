require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = User.create(email: 'checking@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf', first_name: 'john', last_name: 'doe')
    end
    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without profile details" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
end
