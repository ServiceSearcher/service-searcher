class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.string :category
      t.string :website
      t.string :notes
      t.string :phone
      t.string :address
      t.string :contact
      t.string :referral
      t.string :eligibility
      t.string :insurance

      t.timestamps
    end
  end
end
