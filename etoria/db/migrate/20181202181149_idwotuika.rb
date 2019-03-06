class Idwotuika < ActiveRecord::Migration[5.2]
  def change
    change_column :teams, :team_id, :string
    change_column :users, :user_id, :string
  end
end
