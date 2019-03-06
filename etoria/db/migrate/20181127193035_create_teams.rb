class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :body
      t.string :area

      t.timestamps
    end
  end
end
