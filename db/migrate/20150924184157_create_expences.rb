class CreateExpences < ActiveRecord::Migration
  def change
    create_table :expences do |t|
      t.string :category
      t.string :amount
      t.date :date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
