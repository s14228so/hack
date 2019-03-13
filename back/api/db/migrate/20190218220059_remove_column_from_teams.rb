class RemoveColumnFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :student_team_id, :integer
  end
end
