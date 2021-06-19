class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :content
      t.date :time_limit, null: false, default: Time.now.strftime("%Y-%m-%d")

      t.timestamps
    end
  end
end
