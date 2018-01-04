class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :facilities, :location, :address
  end
end
