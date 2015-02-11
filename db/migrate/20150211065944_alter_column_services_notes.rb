class AlterColumnServicesNotes < ActiveRecord::Migration

  def up
    change_column :services, :notes, :text
  end

  def down
    change_column :services, :notes, :string
  end
end
