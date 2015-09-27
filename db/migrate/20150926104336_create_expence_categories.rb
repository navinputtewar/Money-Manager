class CreateExpenceCategories < ActiveRecord::Migration
  def change
    create_table :expence_categories do |t|
      t.string :expence_source
      t.string :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
