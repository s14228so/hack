class AddForeginKeyToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :company_id, :integer
  end
end
