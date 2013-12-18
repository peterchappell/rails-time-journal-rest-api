class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :activity_id
      t.integer :score
      t.float :hours
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
