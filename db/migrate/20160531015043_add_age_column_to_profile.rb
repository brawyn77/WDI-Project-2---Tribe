class AddAgeColumnToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :age, :integer
  end
end
