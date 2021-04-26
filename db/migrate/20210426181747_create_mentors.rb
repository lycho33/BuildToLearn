class CreateMentors < ActiveRecord::Migration[6.1]
  def change
    create_table :mentors do |t|
      t.string :name
      t.integer :num_of_lessons
      t.string :topics
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
