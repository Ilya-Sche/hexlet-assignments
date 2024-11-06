class RemoveComletedFromTasks < ActiveRecord::Migration[7.2]
  def change
    def change
      remove_column :tasks, :comleted, :boolean
    end
  end
end
