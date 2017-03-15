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

    it "cannot be created without ssn and company details" do
      @user.ssn = nil
      @user.property = nil
      expect(@user).to_not be_valid
    end

    it "phone must have only integers and must have 10 characters" do
      @user.phone = '12345678910'
      expect(@user).to_not be_valid
    end

    it "ssn must have only integers and must have 4 characters" do
      @user.ssn = '12345'
      expect(@user).to_not be_valid
    end
  end

  describe "new methods" do
    it "has fullname combining first & last name" do
      expect(@user.full_name).to eq("#{@user.last_name.upcase}, #{@user.first_name.upcase}")
    end
  end

  describe "must have relation between managers and employees" do
    it "with admins associated to multiple employees" do
      employee1 = FactoryGirl.create(:user)
      employee2 = FactoryGirl.create(:user)
      admin = FactoryGirl.create(:admin_user)
      StaffMember.create!(user_id: admin.id, staff_member_id: employee1.id)
      StaffMember.create!(user_id: admin.id, staff_member_id: employee2.id)
      expect(admin.staff_members.count).to eq(2)
    end
  end
end
