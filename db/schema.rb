# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160928155132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name",                     null: false
    t.string   "subdomain",                null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["name"], name: "index_accounts_on_name", unique: true, using: :btree
    t.index ["subdomain"], name: "index_accounts_on_subdomain", unique: true, using: :btree
  end

  create_table "advisers", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "lastname",                        null: false
    t.string   "identification_type",             null: false
    t.string   "identification",                  null: false
    t.string   "phone",                           null: false
    t.integer  "lock_version",        default: 0, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["identification"], name: "index_advisers_on_identification", unique: true, using: :btree
  end

  create_table "body_templates", force: :cascade do |t|
    t.string   "name",                     null: false
    t.text     "content",                  null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["name"], name: "index_body_templates_on_name", unique: true, using: :btree
  end

  create_table "cards", force: :cascade do |t|
    t.string   "name",                                               null: false
    t.decimal  "admission_fee", precision: 10, scale: 2,             null: false
    t.decimal  "monthly_fee",   precision: 10, scale: 2,             null: false
    t.integer  "lock_version",                           default: 0, null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.index ["name"], name: "index_cards_on_name", unique: true, using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",                     null: false
    t.integer  "state_id",                 null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "credit_lines", force: :cascade do |t|
    t.string   "name",                                                             null: false
    t.decimal  "commission",                  precision: 10, scale: 2,             null: false
    t.decimal  "commission_max",              precision: 10, scale: 2,             null: false
    t.decimal  "interest",                    precision: 10, scale: 2,             null: false
    t.decimal  "tax",                         precision: 10, scale: 2,             null: false
    t.decimal  "tax_perception",              precision: 10, scale: 2,             null: false
    t.decimal  "gross_income_perception",     precision: 10, scale: 2,             null: false
    t.decimal  "gross_income_perception_min", precision: 10, scale: 2,             null: false
    t.decimal  "insurance",                   precision: 10, scale: 2,             null: false
    t.decimal  "stamped",                     precision: 10, scale: 2,             null: false
    t.integer  "lock_version",                                         default: 0, null: false
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.index ["name"], name: "index_credit_lines_on_name", unique: true, using: :btree
  end

  create_table "custom_body_templates", force: :cascade do |t|
    t.integer  "custom_template_id", null: false
    t.integer  "body_template_id",   null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["body_template_id"], name: "index_custom_body_templates_on_body_template_id", using: :btree
    t.index ["custom_template_id"], name: "index_custom_body_templates_on_custom_template_id", using: :btree
  end

  create_table "custom_templates", force: :cascade do |t|
    t.string   "name",                           null: false
    t.integer  "header_template_id"
    t.integer  "footer_template_id"
    t.integer  "lock_version",       default: 0, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["footer_template_id"], name: "index_custom_templates_on_footer_template_id", using: :btree
    t.index ["header_template_id"], name: "index_custom_templates_on_header_template_id", using: :btree
    t.index ["name"], name: "index_custom_templates_on_name", unique: true, using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "code"
    t.string   "name",                                                         null: false
    t.string   "lastname",                                                     null: false
    t.string   "identification_type",                                          null: false
    t.string   "identification",                                               null: false
    t.string   "phone",                                                        null: false
    t.string   "cellphone",                                                    null: false
    t.string   "address",                                                      null: false
    t.string   "email"
    t.date     "birthdate",                                                    null: false
    t.boolean  "member",                                       default: false, null: false
    t.string   "work_address",                                                 null: false
    t.decimal  "monthly_income",      precision: 10, scale: 2
    t.string   "place_birth",                                                  null: false
    t.integer  "occupation_id",                                                null: false
    t.integer  "card_id",                                                      null: false
    t.integer  "neighborhood_id"
    t.integer  "city_id",                                                      null: false
    t.integer  "state_id",                                                     null: false
    t.integer  "nacionality_id",                                               null: false
    t.integer  "marital_status_id",                                            null: false
    t.integer  "education_level_id",                                           null: false
    t.integer  "adviser_id",                                                   null: false
    t.integer  "workgroup_id",                                                 null: false
    t.integer  "lock_version",                                 default: 0,     null: false
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.index ["adviser_id"], name: "index_customers_on_adviser_id", using: :btree
    t.index ["card_id"], name: "index_customers_on_card_id", using: :btree
    t.index ["city_id"], name: "index_customers_on_city_id", using: :btree
    t.index ["code"], name: "index_customers_on_code", using: :btree
    t.index ["education_level_id"], name: "index_customers_on_education_level_id", using: :btree
    t.index ["identification"], name: "index_customers_on_identification", unique: true, using: :btree
    t.index ["lastname"], name: "index_customers_on_lastname", using: :btree
    t.index ["marital_status_id"], name: "index_customers_on_marital_status_id", using: :btree
    t.index ["member"], name: "index_customers_on_member", using: :btree
    t.index ["nacionality_id"], name: "index_customers_on_nacionality_id", using: :btree
    t.index ["name"], name: "index_customers_on_name", using: :btree
    t.index ["neighborhood_id"], name: "index_customers_on_neighborhood_id", using: :btree
    t.index ["occupation_id"], name: "index_customers_on_occupation_id", using: :btree
    t.index ["state_id"], name: "index_customers_on_state_id", using: :btree
    t.index ["workgroup_id"], name: "index_customers_on_workgroup_id", using: :btree
  end

  create_table "education_levels", force: :cascade do |t|
    t.string   "name",                     null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["name"], name: "index_education_levels_on_name", unique: true, using: :btree
  end

  create_table "footer_templates", force: :cascade do |t|
    t.string   "name",                     null: false
    t.text     "content",                  null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["name"], name: "index_footer_templates_on_name", unique: true, using: :btree
  end

  create_table "header_templates", force: :cascade do |t|
    t.string   "name",                     null: false
    t.string   "image"
    t.integer  "account_id",               null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["account_id"], name: "index_header_templates_on_account_id", using: :btree
    t.index ["name"], name: "index_header_templates_on_name", unique: true, using: :btree
  end

  create_table "loans", force: :cascade do |t|
    t.string   "status",                                                                   null: false
    t.string   "type",                                                                     null: false
    t.decimal  "commission_amount",              precision: 12, scale: 4,  default: "0.0", null: false
    t.decimal  "interest_amount",                precision: 15, scale: 10, default: "0.0", null: false
    t.decimal  "tax_amount",                     precision: 12, scale: 4,  default: "0.0", null: false
    t.decimal  "tax_perception_amount",          precision: 12, scale: 4,  default: "0.0", null: false
    t.decimal  "gross_income_perception_amount", precision: 12, scale: 4,  default: "0.0", null: false
    t.decimal  "insurance_amount",               precision: 12, scale: 4,  default: "0.0", null: false
    t.decimal  "stamped_amount",                 precision: 12, scale: 4,  default: "0.0", null: false
    t.decimal  "amount",                         precision: 12, scale: 4,                  null: false
    t.decimal  "amount_total",                   precision: 12, scale: 4,                  null: false
    t.integer  "payment_frequency",                                                        null: false
    t.integer  "payments_count",                                                           null: false
    t.integer  "first_payment_days",                                                       null: false
    t.decimal  "payment",                        precision: 12, scale: 4,                  null: false
    t.decimal  "progress",                       precision: 5,  scale: 2,  default: "0.0", null: false
    t.date     "expire_at",                                                                null: false
    t.datetime "canceled_at"
    t.jsonb    "data",                                                                     null: false
    t.integer  "credit_line_id",                                                           null: false
    t.integer  "customer_id",                                                              null: false
    t.integer  "lock_version",                                             default: 0,     null: false
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.index ["credit_line_id"], name: "index_loans_on_credit_line_id", using: :btree
    t.index ["customer_id"], name: "index_loans_on_customer_id", using: :btree
    t.index ["data"], name: "index_loans_on_data", using: :gin
    t.index ["status"], name: "index_loans_on_status", using: :btree
  end

  create_table "marital_statuses", force: :cascade do |t|
    t.string   "name",                     null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["name"], name: "index_marital_statuses_on_name", unique: true, using: :btree
  end

  create_table "nacionalities", force: :cascade do |t|
    t.string   "name",                     null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["name"], name: "index_nacionalities_on_name", unique: true, using: :btree
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "name",                     null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["name"], name: "index_neighborhoods_on_name", unique: true, using: :btree
  end

  create_table "occupations", force: :cascade do |t|
    t.string   "name",                     null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["name"], name: "index_occupations_on_name", unique: true, using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "number",                                                           null: false
    t.decimal  "capital",                 precision: 12, scale: 4,                 null: false
    t.decimal  "interest",                precision: 12, scale: 4,                 null: false
    t.decimal  "extra_interest",          precision: 12, scale: 4, default: "0.0", null: false
    t.decimal  "tax",                     precision: 12, scale: 4,                 null: false
    t.decimal  "tax_interest",            precision: 12, scale: 4, default: "0.0", null: false
    t.decimal  "tax_perception",          precision: 12, scale: 4,                 null: false
    t.decimal  "gross_income_perception", precision: 12, scale: 4,                 null: false
    t.decimal  "insurance",               precision: 12, scale: 4,                 null: false
    t.decimal  "balance",                 precision: 12, scale: 4,                 null: false
    t.decimal  "amount",                  precision: 12, scale: 4,                 null: false
    t.date     "expire_at",                                                        null: false
    t.datetime "paid_at"
    t.integer  "loan_id",                                                          null: false
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.index ["loan_id"], name: "index_payments_on_loan_id", using: :btree
  end

  create_table "references", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "lastname",                        null: false
    t.string   "identification_type",             null: false
    t.string   "identification",                  null: false
    t.string   "phone",                           null: false
    t.integer  "relationship_id",                 null: false
    t.integer  "customer_id",                     null: false
    t.integer  "lock_version",        default: 0, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["customer_id"], name: "index_references_on_customer_id", using: :btree
    t.index ["identification"], name: "index_references_on_identification", unique: true, using: :btree
    t.index ["relationship_id"], name: "index_references_on_relationship_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.string   "name",                     null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["name"], name: "index_relationships_on_name", unique: true, using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",                     null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["name"], name: "index_states_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                               null: false
    t.string   "lastname",                           null: false
    t.integer  "roles_mask",                         null: false
    t.string   "email",                              null: false
    t.string   "encrypted_password",                 null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "account_id",                         null: false
    t.integer  "lock_version",           default: 0, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["account_id"], name: "index_users_on_account_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.jsonb    "object"
    t.jsonb    "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "workgroups", force: :cascade do |t|
    t.string   "name",                     null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["name"], name: "index_workgroups_on_name", unique: true, using: :btree
  end

end
