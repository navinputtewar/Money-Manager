class CreateIncomeCategories < ActiveRecord::Migration
  def change
    create_table :income_categories do |t|
      t.string :income_source
      t.string :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
