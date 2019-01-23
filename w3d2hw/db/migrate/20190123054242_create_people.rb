class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name, null: false 
      t.timestamps
      t.integer :house_id, null: false 
    end
  end
end
