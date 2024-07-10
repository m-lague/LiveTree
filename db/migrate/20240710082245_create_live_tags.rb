class CreateLiveTags < ActiveRecord::Migration[7.1]
  def change
    create_table :live_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :live, null: false, foreign_key: true

      t.timestamps
    end
  end
end
