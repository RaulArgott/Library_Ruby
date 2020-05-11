class AddPaidToPenalties < ActiveRecord::Migration[5.1]
  def change
    add_column :penalties, :paid, :boolean
  end
end
