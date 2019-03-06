class ChangePhoneNumber < ActiveRecord::Migration[5.2]
  def change
    change_column :students, :phone_number, :string
  end
end
