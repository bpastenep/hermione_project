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

ActiveRecord::Schema.define(version: 20180524210920) do

  create_table "evaluation_questions", force: :cascade do |t|
    t.integer "question_id"
    t.integer "evaluation_id"
    t.boolean "logrado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_id"], name: "index_evaluation_questions_on_evaluation_id"
    t.index ["question_id"], name: "index_evaluation_questions_on_question_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.string "objetivo"
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string "nombre"
    t.string "autor"
    t.text "descripcion"
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purpose_questions", force: :cascade do |t|
    t.integer "purpose_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purpose_id"], name: "index_purpose_questions_on_purpose_id"
    t.index ["question_id"], name: "index_purpose_questions_on_question_id"
  end

  create_table "purposes", force: :cascade do |t|
    t.text "descripcion"
    t.integer "rda_especific_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rda_especific_id"], name: "index_purposes_on_rda_especific_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "tipo_pregunta"
    t.text "enunciado"
    t.text "respuesta"
    t.text "respuestas_incor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "respuesta_incorrecta2"
    t.string "respuesta_incorrecta3"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "imagen_file_name"
    t.string "imagen_content_type"
    t.integer "imagen_file_size"
    t.datetime "imagen_updated_at"
  end

  create_table "rda_especifics", force: :cascade do |t|
    t.text "descripcion"
    t.integer "rda_general_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rda_general_id"], name: "index_rda_especifics_on_rda_general_id"
  end

  create_table "rda_generals", force: :cascade do |t|
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "program_id"
    t.index ["program_id"], name: "index_rda_generals_on_program_id"
  end

  create_table "rdae_questions", force: :cascade do |t|
    t.integer "rda_especific_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_rdae_questions_on_question_id"
    t.index ["rda_especific_id"], name: "index_rdae_questions_on_rda_especific_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombreC"
    t.string "rut"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
