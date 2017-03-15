class CreateStaffMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :staff_members do |t|
      t.integer :user_id
      t.integer :staff_member_id

      t.timestamps
    end
  end
end
