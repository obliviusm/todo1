class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.string :name
    	t.boolean :status
    	t.datetime :deadline
      t.timestamps
    end
  end
end
