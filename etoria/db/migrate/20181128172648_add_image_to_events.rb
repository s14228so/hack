class AddImageToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :image, :string
  end
end
