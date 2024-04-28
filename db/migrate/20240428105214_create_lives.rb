class CreateLives < ActiveRecord::Migration[7.1]
  def change
    create_table :lives do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false, default: ""
      t.text :description, null: false, default: ""
      t.datetime :air_date, null: false, default: DateTime.now

      t.timestamps
    end
  end
end
