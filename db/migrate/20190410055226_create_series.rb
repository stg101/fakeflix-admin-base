class CreateSeries < ActiveRecord::Migration[5.2]
  def change
    create_table :series do |t|
      t.string :title
      t.text :description
      t.integer :rating
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
