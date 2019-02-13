class AddColumnsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :content, :text
    add_column :events, :date, :datetime
  end
end
