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

ActiveRecord::Schema.define(:version => 20130516083632) do

  create_table "Commit", :force => true do |t|
    t.string   "repository_name", :null => false
    t.string   "repository_user", :null => false
    t.integer  "user_id",         :null => false
    t.integer  "pull_request_id", :null => false
    t.string   "sha",             :null => false
    t.datetime "date",            :null => false
    t.text     "text",            :null => false
    t.integer  "time",            :null => false
  end

  add_index "Commit", ["repository_name"], :name => "repository_name"
  add_index "Commit", ["repository_user"], :name => "repository_user"
  add_index "Commit", ["user_id"], :name => "user_id"

  create_table "CommitOrganizationLink", :force => true do |t|
    t.integer "commit_id",       :null => false
    t.integer "organization_id", :null => false
    t.integer "time",            :null => false
  end

  add_index "CommitOrganizationLink", ["commit_id"], :name => "commit_id"
  add_index "CommitOrganizationLink", ["organization_id"], :name => "organization_id"

  create_table "Organization", :force => true do |t|
    t.string "name",                    :null => false
    t.string "name_short", :limit => 5, :null => false
  end

  create_table "PullRequest", :force => true do |t|
    t.string   "repository_name", :null => false
    t.string   "repository_user", :null => false
    t.integer  "github_id",       :null => false
    t.integer  "number",          :null => false
    t.integer  "user_id",         :null => false
    t.datetime "date",            :null => false
    t.string   "title",           :null => false
    t.text     "text",            :null => false
    t.text     "html",            :null => false
    t.integer  "time",            :null => false
  end

  add_index "PullRequest", ["github_id"], :name => "github_id"
  add_index "PullRequest", ["number"], :name => "number"
  add_index "PullRequest", ["repository_name"], :name => "repository_name"
  add_index "PullRequest", ["repository_user"], :name => "repository_user"
  add_index "PullRequest", ["user_id"], :name => "user_id"

  create_table "PullRequestOrganizationLink", :force => true do |t|
    t.integer "pull_request_id", :null => false
    t.integer "organization_id", :null => false
    t.integer "time",            :null => false
  end

  add_index "PullRequestOrganizationLink", ["organization_id"], :name => "organization_id"
  add_index "PullRequestOrganizationLink", ["pull_request_id"], :name => "pull_request_id"

  create_table "User", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "repositories", :force => true do |t|
    t.string   "name"
    t.string   "user"
    t.string   "login"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
