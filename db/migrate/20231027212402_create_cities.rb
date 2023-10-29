class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.references :state, null: false, foreign_key: true

      t.timestamps
    end

    add_index :cities, %i[name state_id], unique: true
  end
end
