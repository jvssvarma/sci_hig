require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(email: 'checking@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf', first_name: 'john', last_name: 'doe')
  end
  
  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without profile details" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe "new methods" do
    it "has fullname combining first & last name" do
      expect(@user.full_name).to eq("DOE, JOHN")
    end
  end
end
