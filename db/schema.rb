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

ActiveRecord::Schema.define(version: 20170309082618) do

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "employer_id"
    t.string   "name",             limit: 30
    t.string   "website"
    t.integer  "industry_type_id"
    t.string   "description"
    t.string   "address"
    t.integer  "city_id"
    t.string   "contact"
    t.string   "email"
    t.string   "google_plus"
    t.string   "facebook"
    t.string   "linkedin"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["city_id"], name: "index_companies_on_city_id", using: :btree
    t.index ["employer_id"], name: "index_companies_on_employer_id", using: :btree
    t.index ["industry_type_id"], name: "index_companies_on_industry_type_id", using: :btree
  end

  create_table "contact_people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "company_id"
    t.string   "first_name", limit: 20
    t.string   "last_name",  limit: 20
    t.string   "contact",    limit: 15
    t.string   "email"
    t.integer  "role_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["company_id"], name: "index_contact_people_on_company_id", using: :btree
    t.index ["role_id"], name: "index_contact_people_on_role_id", using: :btree
  end

  create_table "education_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "qualification"
    t.string   "course"
    t.string   "specialization"
    t.string   "college"
    t.string   "course_type"
    t.string   "passing_year"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
  end

  create_table "educations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "qualification"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "employers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",             limit: 20
    t.string   "last_name",              limit: 20
    t.string   "contact",                limit: 15
    t.string   "company_name"
    t.integer  "role_id"
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["email"], name: "index_employers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_employers_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_employers_on_role_id", using: :btree
  end

  create_table "experiences", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "designation"
    t.string   "company"
    t.string   "working_since_year"
    t.string   "working_since_month"
    t.string   "location"
    t.string   "notice"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "industry_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "company_id"
    t.integer  "job_type_id"
    t.integer  "role_id"
    t.integer  "contact_person_id"
    t.integer  "vacancy"
    t.string   "description"
    t.string   "salary"
    t.string   "address"
    t.string   "experience"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "qualification"
    t.string   "status",            limit: 9
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["company_id"], name: "index_jobs_on_company_id", using: :btree
    t.index ["contact_person_id"], name: "index_jobs_on_contact_person_id", using: :btree
    t.index ["job_type_id"], name: "index_jobs_on_job_type_id", using: :btree
    t.index ["role_id"], name: "index_jobs_on_role_id", using: :btree
  end

  create_table "jobs_skills", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "job_id",   null: false
    t.integer "skill_id", null: false
  end

  create_table "locations", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT" do |t|
    t.integer "id"
    t.string  "name",  limit: 20
    t.integer "COL 3"
    t.string  "COL 4", limit: 25
  end

  create_table "ownskills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "experience_id"
    t.integer  "skill_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["experience_id"], name: "index_ownskills_on_experience_id", using: :btree
    t.index ["skill_id"], name: "index_ownskills_on_skill_id", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "industry_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["industry_type_id"], name: "index_roles_on_industry_type_id", using: :btree
  end

  create_table "seekers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "experience_id"
    t.index ["experience_id"], name: "index_skills_on_experience_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "contactnumber"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.boolean  "hasexp"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "address"
    t.integer  "pincode"
    t.boolean  "marital_status"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "companies", "cities"
  add_foreign_key "companies", "employers"
  add_foreign_key "companies", "industry_types"
  add_foreign_key "contact_people", "companies"
  add_foreign_key "contact_people", "roles"
  add_foreign_key "employers", "roles"
  add_foreign_key "jobs", "companies"
  add_foreign_key "jobs", "contact_people"
  add_foreign_key "jobs", "job_types"
  add_foreign_key "jobs", "roles"
  add_foreign_key "ownskills", "experiences"
  add_foreign_key "ownskills", "skills"
  add_foreign_key "roles", "industry_types"
end
