class CreateContactRequests < ActiveRecord::Migration
  def change
    create_table :contact_requests do |t|
      t.string :request
      t.string :from
      t.string :to
      t.boolean :permission
      t.timestamps null: false
    end
  end
end
