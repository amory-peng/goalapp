class AddColumnToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :status, :string
  end
end
