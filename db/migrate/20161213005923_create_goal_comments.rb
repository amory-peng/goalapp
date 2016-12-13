class CreateGoalComments < ActiveRecord::Migration
  def change
    create_table :goal_comments do |t|
      t.integer :author_id
      t.integer :goal_id
      t.string :description

      t.timestamps null: false
    end
  end
end
