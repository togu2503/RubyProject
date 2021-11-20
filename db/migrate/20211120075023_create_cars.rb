class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :title
      t.string :price
      t.string :currency
      t.string :kilometrage
      t.string :link

      t.timestamps
    end
  end
end
