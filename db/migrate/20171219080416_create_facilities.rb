class CreateFacilities < ActiveRecord::Migration[5.1]
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :location
      t.string :types

      t.timestamps
    end
  end
end
