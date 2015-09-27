# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    puts "########################"
    puts "Creating Default IncomeCategories"
    puts "########################"
	IncomeCategory.create(income_source: "salary", description: "monthly creadited to account")
	IncomeCategory.create(income_source: "cash", description: "hard cash")
	IncomeCategory.create(income_source: "other", description: "sample")

    puts "########################"
    puts "Creating Default ExpenceCategories"
    puts "########################"
	ExpenceCategory.create(expence_source: "food", description: "daily meal")
	ExpenceCategory.create(expence_source: "health", description: "about health")
	ExpenceCategory.create(expence_source: "transport", description: "about daily transport")
	ExpenceCategory.create(expence_source: "other", description: "sample")