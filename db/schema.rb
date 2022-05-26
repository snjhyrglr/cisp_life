# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_23_062805) do
  create_table "actuarial_matrix_lppis", charset: "utf8mb4", force: :cascade do |t|
    t.integer "min_age"
    t.integer "max_age"
    t.decimal "min_annual_prem_rate", precision: 10, scale: 2
    t.decimal "max_annual_prem_rate", precision: 10, scale: 2
    t.decimal "max_allowed_comm", precision: 10, scale: 2
    t.bigint "rider_add_tpd_id", null: false
    t.bigint "rider_adb_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rider_adb_id"], name: "index_actuarial_matrix_lppis_on_rider_adb_id"
    t.index ["rider_add_tpd_id"], name: "index_actuarial_matrix_lppis_on_rider_add_tpd_id"
  end

  create_table "batches", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_batches_on_product_id"
  end

  create_table "beneficiaries", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.string "name"
    t.integer "age"
    t.string "relationship"
    t.boolean "I_R"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_beneficiaries_on_member_id"
  end

  create_table "cooperative_branches", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "cooperative_id", null: false
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_id"], name: "index_cooperative_branches_on_cooperative_id"
  end

  create_table "cooperatives", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "division_id", null: false
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["division_id"], name: "index_departments_on_division_id"
  end

  create_table "divisions", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_profiles", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "employee_user_id", null: false
    t.bigint "department_id", null: false
    t.bigint "division_id", null: false
    t.string "employee_no"
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "suffix"
    t.date "birthdate"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employee_profiles_on_department_id"
    t.index ["division_id"], name: "index_employee_profiles_on_division_id"
    t.index ["employee_user_id"], name: "index_employee_profiles_on_employee_user_id"
  end

  create_table "employee_users", charset: "utf8mb4", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lppi_coverage_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "batch_id", null: false
    t.bigint "member_id", null: false
    t.date "effectivity"
    t.date "expiry"
    t.integer "term"
    t.integer "age"
    t.decimal "coverage", precision: 15, scale: 2
    t.bigint "rate_id", null: false
    t.decimal "prem_rate", precision: 10, scale: 2
    t.decimal "gross_prem", precision: 10, scale: 2
    t.decimal "service_fee", precision: 10, scale: 2
    t.decimal "net_prem", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_lppi_coverage_items_on_batch_id"
    t.index ["member_id"], name: "index_lppi_coverage_items_on_member_id"
    t.index ["rate_id"], name: "index_lppi_coverage_items_on_rate_id"
  end

  create_table "lppi_coverages", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "batch_id", null: false
    t.bigint "cooperative_id", null: false
    t.bigint "cooperative_branch_id", null: false
    t.bigint "member_id", null: false
    t.bigint "product_id", null: false
    t.integer "age"
    t.date "effectivity"
    t.date "expiry"
    t.integer "terms"
    t.decimal "coverage", precision: 10, scale: 2
    t.decimal "gross_prem", precision: 8, scale: 2
    t.decimal "service_fee", precision: 8, scale: 2
    t.decimal "net_prem", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_lppi_coverages_on_batch_id"
    t.index ["cooperative_branch_id"], name: "index_lppi_coverages_on_cooperative_branch_id"
    t.index ["cooperative_id"], name: "index_lppi_coverages_on_cooperative_id"
    t.index ["member_id"], name: "index_lppi_coverages_on_member_id"
    t.index ["product_id"], name: "index_lppi_coverages_on_product_id"
  end

  create_table "members", charset: "utf8mb4", force: :cascade do |t|
    t.string "lastName"
    t.string "firstName"
    t.string "middleName"
    t.string "suffix"
    t.date "birthdate"
    t.string "gender"
    t.bigint "cooperative_id", null: false
    t.bigint "cooperative_branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "civil_status"
    t.index ["cooperative_branch_id"], name: "index_members_on_cooperative_branch_id"
    t.index ["cooperative_id"], name: "index_members_on_cooperative_id"
  end

  create_table "posts", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quote_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "quote_id"
    t.bigint "member_id"
    t.integer "age"
    t.date "effectivity"
    t.date "expiry"
    t.integer "term"
    t.bigint "rate_id"
    t.decimal "coverage", precision: 10, scale: 2
    t.decimal "prem_rate", precision: 10, scale: 2
    t.decimal "gross_prem", precision: 10, scale: 2
    t.decimal "service_fee", precision: 10, scale: 2
    t.decimal "net_prem", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_quote_items_on_member_id"
    t.index ["quote_id"], name: "index_quote_items_on_quote_id"
    t.index ["rate_id"], name: "index_quote_items_on_rate_id"
  end

  create_table "quotes", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "quote_year"
    t.string "issuing_office"
    t.string "quote_no"
    t.string "name"
    t.string "description"
    t.bigint "cooperative_id"
    t.bigint "cooperative_branch_id"
    t.decimal "gross_prem", precision: 10, scale: 2
    t.decimal "service_fee", precision: 10, scale: 2
    t.decimal "net_prem", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_branch_id"], name: "index_quotes_on_cooperative_branch_id"
    t.index ["cooperative_id"], name: "index_quotes_on_cooperative_id"
    t.index ["product_id"], name: "index_quotes_on_product_id"
  end

  create_table "rates", charset: "utf8mb4", force: :cascade do |t|
    t.integer "min_age"
    t.integer "max_age"
    t.decimal "min_coverage", precision: 10, scale: 2
    t.decimal "max_coverage", precision: 10, scale: 2
    t.decimal "rate", precision: 10, scale: 2
    t.decimal "coop_comm_rate", precision: 10, scale: 2
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_rates_on_product_id"
  end

  create_table "rider_adbs", charset: "utf8mb4", force: :cascade do |t|
    t.decimal "rate", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rider_add_tpds", charset: "utf8mb4", force: :cascade do |t|
    t.decimal "rate", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tbl_rates", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.integer "min_age", null: false
    t.integer "max_age", null: false
    t.decimal "min_annual_prem_rate", precision: 10, scale: 2, null: false
    t.decimal "max_annual_prem_rate", precision: 10, scale: 2, null: false
    t.decimal "min_monthly_prem_rate", precision: 10, scale: 2, null: false
    t.decimal "max_monthly_prem_rate", precision: 10, scale: 2, null: false
    t.decimal "maximum_allowed_commission", precision: 10, scale: 2, null: false
    t.decimal "annual_prem_rate_add_tpd_rider", precision: 10, scale: 2, null: false
    t.decimal "annual_prem_rate_adb_rider", precision: 10, scale: 2, null: false
  end

  add_foreign_key "actuarial_matrix_lppis", "rider_adbs"
  add_foreign_key "actuarial_matrix_lppis", "rider_add_tpds"
  add_foreign_key "batches", "products"
  add_foreign_key "beneficiaries", "members"
  add_foreign_key "cooperative_branches", "cooperatives"
  add_foreign_key "departments", "divisions"
  add_foreign_key "employee_profiles", "departments"
  add_foreign_key "employee_profiles", "divisions"
  add_foreign_key "employee_profiles", "employee_users"
  add_foreign_key "lppi_coverage_items", "batches"
  add_foreign_key "lppi_coverage_items", "members"
  add_foreign_key "lppi_coverage_items", "rates"
  add_foreign_key "lppi_coverages", "batches"
  add_foreign_key "lppi_coverages", "cooperative_branches"
  add_foreign_key "lppi_coverages", "cooperatives"
  add_foreign_key "lppi_coverages", "members"
  add_foreign_key "lppi_coverages", "products"
  add_foreign_key "members", "cooperative_branches"
  add_foreign_key "members", "cooperatives"
end
