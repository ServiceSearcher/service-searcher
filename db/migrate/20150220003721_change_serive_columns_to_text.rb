class ChangeSeriveColumnsToText < ActiveRecord::Migration

  def up
    change_column :services, :name, :text
    change_column :services, :category, :text
    change_column :services, :website, :text
    change_column :services, :phone, :text
    change_column :services, :address, :text
    change_column :services, :contact, :text
    change_column :services, :referral, :text
    change_column :services, :eligibility, :text
    change_column :services, :insurance, :text
  end

  def down
    change_column :services, :name, :string
    change_column :services, :category, :string
    change_column :services, :website, :string
    change_column :services, :phone, :string
    change_column :services, :address, :string
    change_column :services, :contact, :string
    change_column :services, :referral, :string
    change_column :services, :eligibility, :string
    change_column :services, :insurance, :string
  end
end