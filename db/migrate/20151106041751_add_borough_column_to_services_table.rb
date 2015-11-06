class AddBoroughColumnToServicesTable < ActiveRecord::Migration
  def change
    add_column :services, :borough, :string
  end
end
