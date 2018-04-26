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

ActiveRecord::Schema.define(version: 20180426004938) do

  create_table "programs", force: :cascade do |t|
    t.string "nombre"
    t.string "autor"
    t.text "descripcion"
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

end
