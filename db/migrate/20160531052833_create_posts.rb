class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :user_from
      t.string :user_to
      t.text :message

      t.timestamps null: false
    end
  end
end
