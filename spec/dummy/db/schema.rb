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

ActiveRecord::Schema.define(:version => 20121209031621) do

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "ecm_npo_event_documents", :force => true do |t|
    t.datetime "point_in_time"
    t.string   "type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "ecm_npo_event_documents_membership_begins", :force => true do |t|
    t.integer "member_id"
  end

  create_table "ecm_npo_event_documents_membership_ends", :force => true do |t|
    t.integer "member_id"
    t.integer "membership_begin_id"
  end

  create_table "ecm_npo_ledger_items", :force => true do |t|
    t.string   "identifier"
    t.datetime "issued_at"
    t.text     "description"
    t.string   "type"
    t.integer  "gross_amount_cents"
    t.string   "currency"
    t.integer  "issuer_id"
    t.string   "issuer_type"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "ecm_npo_ledger_items_claims_membership_fees", :force => true do |t|
    t.datetime "begin_date"
    t.datetime "end_date"
    t.integer  "member_id"
  end

  create_table "ecm_npo_ledger_items_payments", :force => true do |t|
    t.integer "claim_id"
  end

  create_table "ecm_npo_members", :force => true do |t|
    t.string   "firstname"
    t.string   "nickname"
    t.string   "lastname"
    t.date     "birthdate"
    t.integer  "user_id"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ecm_npo_members", ["user_id"], :name => "index_ecm_npo_members_on_user_id"

  create_table "ecm_npo_organizations", :force => true do |t|
    t.string   "name"
    t.boolean  "is_self"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_view "view_ecm_npo_event_documents_membership_begins", "SELECT ecm_npo_event_documents.id, point_in_time,type,created_at,updated_at,member_id FROM ecm_npo_event_documents, ecm_npo_event_documents_membership_begins WHERE ecm_npo_event_documents.id = ecm_npo_event_documents_membership_begins.id", :force => true do |v|
    v.column :id
    v.column :point_in_time
    v.column :type
    v.column :created_at
    v.column :updated_at
    v.column :member_id
  end

  create_view "view_ecm_npo_event_documents_membership_ends", "SELECT ecm_npo_event_documents.id, point_in_time,type,created_at,updated_at,member_id,membership_begin_id FROM ecm_npo_event_documents, ecm_npo_event_documents_membership_ends WHERE ecm_npo_event_documents.id = ecm_npo_event_documents_membership_ends.id", :force => true do |v|
    v.column :id
    v.column :point_in_time
    v.column :type
    v.column :created_at
    v.column :updated_at
    v.column :member_id
    v.column :membership_begin_id
  end

  create_view "view_ecm_npo_ledger_items_claims_membership_fees", "SELECT ecm_npo_ledger_items.id, identifier,issued_at,description,type,gross_amount_cents,currency,issuer_id,issuer_type,recipient_id,recipient_type,created_at,updated_at,begin_date,end_date,member_id FROM ecm_npo_ledger_items, ecm_npo_ledger_items_claims_membership_fees WHERE ecm_npo_ledger_items.id = ecm_npo_ledger_items_claims_membership_fees.id", :force => true do |v|
    v.column :id
    v.column :identifier
    v.column :issued_at
    v.column :description
    v.column :type
    v.column :gross_amount_cents
    v.column :currency
    v.column :issuer_id
    v.column :issuer_type
    v.column :recipient_id
    v.column :recipient_type
    v.column :created_at
    v.column :updated_at
    v.column :begin_date
    v.column :end_date
    v.column :member_id
  end

  create_view "view_ecm_npo_ledger_items_payments", "SELECT ecm_npo_ledger_items.id, identifier,issued_at,description,type,gross_amount_cents,currency,issuer_id,issuer_type,recipient_id,recipient_type,created_at,updated_at,claim_id FROM ecm_npo_ledger_items, ecm_npo_ledger_items_payments WHERE ecm_npo_ledger_items.id = ecm_npo_ledger_items_payments.id", :force => true do |v|
    v.column :id
    v.column :identifier
    v.column :issued_at
    v.column :description
    v.column :type
    v.column :gross_amount_cents
    v.column :currency
    v.column :issuer_id
    v.column :issuer_type
    v.column :recipient_id
    v.column :recipient_type
    v.column :created_at
    v.column :updated_at
    v.column :claim_id
  end

end
