class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.integer :author_id
      t.integer :user_id
      t.string :description

      t.timestamps null: false
    end
  end
end
