class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :username
      t.text :address
      t.integer :postcode
      t.integer :search_radius
      t.string :sex
      t.text :interests

      t.timestamps null: false
    end
  end
end
