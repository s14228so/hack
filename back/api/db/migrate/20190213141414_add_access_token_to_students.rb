class AddAccessTokenToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :access_token, :string
  end
end
