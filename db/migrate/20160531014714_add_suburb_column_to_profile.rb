class AddSuburbColumnToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :suburb, :string
  end
end
