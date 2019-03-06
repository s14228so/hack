class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.text :carrier
      t.text :skill
      t.text :license
      t.text :appear
      t.integer :status
      t.text :twitter

      t.timestamps
    end
  end
end
