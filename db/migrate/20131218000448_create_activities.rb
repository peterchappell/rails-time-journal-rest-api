class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
