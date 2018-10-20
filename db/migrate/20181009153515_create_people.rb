class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.integer :height

      t.timestamps
    end
  end
end
