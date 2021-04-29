class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :topic
      t.string :content
      t.boolean :lesson_completed
      t.belongs_to :user

      t.timestamps
    end
  end
end
