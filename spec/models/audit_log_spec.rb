require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  before do
    @auditlog = FactoryGirl.create(:audit_log)
  end

  describe "creating AuditLog" do
    it "should be able to create auditlog properly" do
      expect(@auditlog).to be_valid
    end

    it "must have a user associated" do
      @auditlog.user_id = nil
      expect(@auditlog).to_not be_valid
    end

    it "must have a status" do
      @auditlog.status = nil
      expect(@auditlog).to_not be_valid
    end

    it "must have a valid start_date" do
      @auditlog.start_date = nil
      expect(@auditlog).to_not be_valid
    end

    it "must have start_date as yesterday by default" do
      audit_log1 = AuditLog.create(user_id: User.last.id)
      expect(audit_log1.start_date).to eq(Date.yesterday)
    end
  end
end
