class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :postcode
      t.string :country

      t.timestamps
    end
  end
end
