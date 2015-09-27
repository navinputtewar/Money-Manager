class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :category
      t.string :amount
      t.date :date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
