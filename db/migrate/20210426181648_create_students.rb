class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :progress_level
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
