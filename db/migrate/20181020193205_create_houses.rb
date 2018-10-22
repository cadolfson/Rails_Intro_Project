class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :address
      t.string :postal_code
      t.string :city
      t.string :provence
      t.text :description

      t.timestamps
    end
  end
end
