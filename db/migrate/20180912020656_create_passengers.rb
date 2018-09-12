class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :name
      t.integer :age
      t.belongs_to :car, foreign_key: true

      t.timestamps
    end
  end
end
