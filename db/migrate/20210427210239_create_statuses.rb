class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.boolean :lesson_completed
      t.string :mentoring
      t.string :attending_student
      t.belongs_to :user
      t.belongs_to :lesson

      t.timestamps
    end
  end
end
