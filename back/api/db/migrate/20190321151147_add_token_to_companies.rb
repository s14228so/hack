class AddTokenToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :access_token, :string
  end
end
