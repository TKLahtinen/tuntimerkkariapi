class CreateMarks < ActiveRecord::Migration[7.2]
  def change
    create_table :marks do |t|
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :h_amount, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
