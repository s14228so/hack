class AddColumnToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :introduction, :text
  end
end
