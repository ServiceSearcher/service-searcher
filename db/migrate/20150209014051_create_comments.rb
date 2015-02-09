class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :rating
      t.text :text
      t.string :display_name
      t.references :service

      t.timestamps
    end
  end
end
