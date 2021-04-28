class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :status
      t.string :interested_topics
      t.string :progress_level
      t.string :lessons
      t.belongs_to :user
      t.belongs_to :lesson

      t.timestamps
    end
  end
end
