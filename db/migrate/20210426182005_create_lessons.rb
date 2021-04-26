class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :tdopic
      t.string :content
      t.boolean :lesson_completed
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :student, null: false, foreign_key: true
      t.belongs_to :mentor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
