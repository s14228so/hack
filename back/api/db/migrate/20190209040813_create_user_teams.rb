class CreateUserTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :student_teams do |t|
      t.integer :student_id
      t.string :team_id
      t.string :integer

      t.timestamps
    end
  end
end
