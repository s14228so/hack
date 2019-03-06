class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :integer
    add_column :users, :status, :integer
    add_column :users, :birthday, :datetime
    add_column :users, :team_id, :integer
    add_column :users, :area, :string
  end
end
