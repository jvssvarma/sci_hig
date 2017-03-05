require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "creation and validations" do
    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without profile details" do
      @user.first_name = nil
      @user.last_name = nil
      @user.phone = nil
      expect(@user).to_not be_valid
    end

    it "phone must have only integers and must have 10 characters" do
      @user.phone = '12345678910'
      expect(@user).to_not be_valid
    end
  end

  describe "new methods" do
    it "has fullname combining first & last name" do
      expect(@user.full_name).to eq("#{@user.last_name.upcase}, #{@user.first_name.upcase}")
    end
  end
end
