class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :from
      t.string :to
      t.string :amount
      t.string :description
      t.references :transable, polymorphic: true, index: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
