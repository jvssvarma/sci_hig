class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.date :date
      t.text :reason

      t.timestamps
    end
  end
end
