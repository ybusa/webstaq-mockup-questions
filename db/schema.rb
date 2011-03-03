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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110303191902) do

  create_table "entities", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_options", :force => true do |t|
    t.integer  "question_id"
    t.string   "display_value"
    t.string   "data_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.string   "interrogative"
    t.string   "data_type"
    t.string   "type"
    t.integer  "display_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "allow_na"
  end

  create_table "report_steps", :force => true do |t|
    t.integer  "step_id"
    t.boolean  "submitted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "step_questions", :force => true do |t|
    t.integer  "question_id"
    t.integer  "step_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
