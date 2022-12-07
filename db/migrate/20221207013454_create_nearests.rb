class CreateNearests < ActiveRecord::Migration[6.0]
  def change
    create_table :nearests do |t|
      t.string :route
      t.string :station
      t.string :walk
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
