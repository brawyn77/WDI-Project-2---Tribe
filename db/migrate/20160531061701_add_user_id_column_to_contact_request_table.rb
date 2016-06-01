class AddUserIdColumnToContactRequestTable < ActiveRecord::Migration
  def change
    add_column :contact_requests, :user_id, :integer
  end
end
