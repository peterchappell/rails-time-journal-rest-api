class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :date
      t.integer :score
      t.text :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
