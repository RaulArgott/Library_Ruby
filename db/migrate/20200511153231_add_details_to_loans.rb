class AddDetailsToLoans < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :pay, :boolean
    add_column :loans, :fee, :decimal
    add_column :loans, :days, :integer
  end
end
