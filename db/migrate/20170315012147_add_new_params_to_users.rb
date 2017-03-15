class AddNewParamsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :property, :string
    add_column :users, :ssn, :integer
  end
end
