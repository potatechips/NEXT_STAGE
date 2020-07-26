class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.date :term_at
      t.string :content
      t.string :task

      t.timestamps
    end
  end
end
