class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.string :interested_topics
      t.string :progress_level
      t.belongs_to :user
      t.belongs_to :lesson

      t.timestamps
    end
  end
end
