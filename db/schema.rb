# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20121209234646) do

  create_table "agendas", :force => true do |t|
    t.string   "nombre"
    t.boolean  "publica"
    t.integer  "idUsuario"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "asientos", :force => true do |t|
    t.integer  "idViaje"
    t.integer  "idUsuario"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ciudads", :force => true do |t|
    t.string   "nombre"
    t.integer  "coordX"
    t.integer  "coordY"
    t.integer  "popular"
    t.integer  "poblacion"
    t.integer  "usuarios"
    t.integer  "idDepartamento"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "departamentos", :force => true do |t|
    t.string   "nombre"
    t.integer  "habitantes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "programas", :force => true do |t|
    t.string   "nombre"
    t.integer  "idAgenda"
    t.date     "fInicio"
    t.date     "fFin"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reviews", :force => true do |t|
    t.integer  "idUsuario"
    t.integer  "idViaje"
    t.integer  "idAsiento"
    t.string   "asunto"
    t.text     "desc"
    t.integer  "puntaje"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "password"
    t.string   "salt"
    t.date     "dob"
    t.integer  "rep"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "verified",   :default => false
  end

  create_table "viajes", :force => true do |t|
    t.integer  "idUsuario"
    t.integer  "idCiudadOrigen"
    t.integer  "idCiudadDestino"
    t.integer  "idEstado"
    t.boolean  "equipaje"
    t.boolean  "animales"
    t.integer  "kms"
    t.integer  "pasaje"
    t.integer  "peajes"
    t.datetime "fSalida"
    t.datetime "fLlegada"
    t.integer  "paradas"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
