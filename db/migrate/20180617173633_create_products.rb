class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :rate
      t.references :user, index: true, foreign_key: true
    end
  end
end
