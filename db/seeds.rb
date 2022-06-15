# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# puts "Importing Cooperative..."

# Cooperative.import("./db/uploads/coops/coop_list.xlsx")

puts "Importing LPPI Rate..."

# Rate.import("./db/uploads/rates.xlsx")
LppiRate.import("./db/uploads/rate_new.xlsx")

# ActuarialMatrixLppi.import("./db/uploads/rate_new.xlsx")