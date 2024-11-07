class AddPerformerToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :performer, :string
  end
end
