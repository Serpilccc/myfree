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

ActiveRecord::Schema.define(version: 20171215213855) do

  create_table "authors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_authors_on_user_id"
  end

  create_table "commenters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_commenters_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "commenter_id"
    t.integer "course_id"
    t.index ["commenter_id"], name: "index_comments_on_commenter_id"
    t.index ["course_id"], name: "index_comments_on_course_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_conversations_on_recipient_id"
    t.index ["sender_id"], name: "index_conversations_on_sender_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "titre"
    t.string "matiere"
    t.string "fac"
    t.string "annee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "author_id"
    t.string "pdf"
    t.integer "cached_scoped_subscribe_votes_total", default: 0
    t.integer "cached_scoped_subscribe_votes_score", default: 0
    t.integer "cached_scoped_subscribe_votes_up", default: 0
    t.integer "cached_scoped_subscribe_votes_down", default: 0
    t.integer "cached_weighted_subscribe_score", default: 0
    t.integer "cached_weighted_subscribe_total", default: 0
    t.float "cached_weighted_subscribe_average", default: 0.0
    t.index ["author_id"], name: "index_courses_on_author_id"
    t.index ["cached_scoped_subscribe_votes_down"], name: "index_courses_on_cached_scoped_subscribe_votes_down"
    t.index ["cached_scoped_subscribe_votes_score"], name: "index_courses_on_cached_scoped_subscribe_votes_score"
    t.index ["cached_scoped_subscribe_votes_total"], name: "index_courses_on_cached_scoped_subscribe_votes_total"
    t.index ["cached_scoped_subscribe_votes_up"], name: "index_courses_on_cached_scoped_subscribe_votes_up"
    t.index ["cached_weighted_subscribe_average"], name: "index_courses_on_cached_weighted_subscribe_average"
    t.index ["cached_weighted_subscribe_score"], name: "index_courses_on_cached_weighted_subscribe_score"
    t.index ["cached_weighted_subscribe_total"], name: "index_courses_on_cached_weighted_subscribe_total"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.integer "conversation_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "typedoc"
    t.string "categorie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "fac", default: "", null: false
    t.string "formation", default: "", null: false
    t.string "niveau", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "facebook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["fac"], name: "index_users_on_fac", unique: true
    t.index ["formation"], name: "index_users_on_formation", unique: true
    t.index ["niveau"], name: "index_users_on_niveau", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
