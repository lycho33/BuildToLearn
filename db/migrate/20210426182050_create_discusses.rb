class CreateDiscusses < ActiveRecord::Migration[6.1]
  def change
    create_table :discusses do |t|
      t.text :content
      t.datetime :date
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
