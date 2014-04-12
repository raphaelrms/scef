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

ActiveRecord::Schema.define(:version => 20140412115708) do

  create_table "arquivos", :force => true do |t|
    t.string   "descricao"
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
    t.integer  "arquivo_file_size"
    t.datetime "arquivo_update_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "anexo_id"
    t.string   "anexo_type"
  end

  create_table "categorias", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "descricao"
    t.string   "observacoes"
  end

  create_table "cursos", :force => true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.string   "ano"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "custos", :force => true do |t|
    t.integer  "valor"
    t.integer  "categoria_id",  :null => false
    t.integer  "fase_id",       :null => false
    t.string   "descricao"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "observacoes"
    t.integer  "quantidade"
    t.date     "dt_referencia"
  end

  create_table "fases", :force => true do |t|
    t.string   "descricao"
    t.integer  "curso_id",       :null => false
    t.integer  "orcamento"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.date     "inicio_periodo"
    t.date     "fim_periodo"
  end

  create_table "noticias", :force => true do |t|
    t.string   "titulo"
    t.string   "subtitulo"
    t.string   "tags"
    t.binary   "corpo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "noticias_permissoes", :force => true do |t|
    t.integer  "noticia_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "role_id"
  end

  create_table "permissions", :force => true do |t|
    t.string   "action"
    t.string   "subject_class"
    t.integer  "subject_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "role_id"
  end

  create_table "permissions_roles", :force => true do |t|
    t.integer "role_id"
    t.integer "permission_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.integer  "role_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  add_foreign_key "noticias", "users", name: "noticias_user_id_fk"

  add_foreign_key "noticias_permissoes", "roles", name: "noticias_permissoes_role_id_fk"

  add_foreign_key "permissions", "roles", name: "permissions_role_id_fk"

  add_foreign_key "users", "roles", name: "users_role_id_fk"

end
