class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.integer :task_id
      t.timestamps
    end
  end
end
