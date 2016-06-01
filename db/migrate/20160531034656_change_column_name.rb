class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :profiles, :name, :first_name
  end
end
