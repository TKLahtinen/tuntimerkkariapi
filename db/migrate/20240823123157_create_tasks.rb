class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.integer :project_id, null: false
      t.string :name, null: false
      t.date :start_date, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
