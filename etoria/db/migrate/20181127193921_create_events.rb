class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.datetime :date
      t.text :address
      t.integer :capacity

      t.timestamps
    end
  end
end
