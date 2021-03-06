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

ActiveRecord::Schema.define(version: 20180504054648) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.integer "category_type"
    t.integer "parent_id"
    t.integer "priority"
    t.datetime "deleted_at"
    t.boolean "open_mark"
    t.string "cover_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "combine_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.text "tour"
    t.text "traffic"
    t.text "hotel"
    t.integer "category_id"
    t.boolean "price1_mark", default: false
    t.integer "price1"
    t.boolean "price2_mark", default: false
    t.integer "price2"
    t.boolean "price3_mark", default: false
    t.integer "price3"
    t.boolean "price4_mark", default: false
    t.integer "price4"
    t.string "cover"
    t.string "image1"
    t.string "image2"
    t.string "image3"
    t.integer "day"
    t.string "name"
    t.text "content"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "the_group"
    t.integer "cost"
    t.string "addon"
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "email"
    t.string "name"
    t.text "content"
    t.datetime "deleted_at"
    t.integer "status"
    t.boolean "reply_mark"
    t.text "reply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "cover"
    t.string "name"
    t.date "show_date"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
  end

  create_table "group_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "remark"
    t.string "width"
    t.string "height"
    t.datetime "deleted_at"
    t.integer "group_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "id_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "cover"
    t.text "content"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "make_day"
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "item_type"
    t.integer "item_id"
    t.string "file"
    t.integer "priority", default: 0
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "use_way", default: 0
    t.string "name"
    t.string "url"
    t.string "image_alt"
    t.index ["item_id"], name: "index_images_on_item_id"
    t.index ["item_type"], name: "index_images_on_item_type"
  end

  create_table "impressions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index", length: { params: 255 }
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", length: { message: 255 }
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "my_ads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "file"
    t.integer "priority"
    t.datetime "deleted_at"
    t.string "name"
    t.string "url"
    t.string "image_alt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "use_type", default: 0
  end

  create_table "pages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.text "content"
    t.datetime "deleted_at"
    t.text "intro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "cover"
    t.string "image1"
    t.string "image2"
    t.string "image4"
    t.string "name"
    t.integer "price"
    t.text "intro"
    t.text "content"
    t.datetime "deleted_at"
    t.integer "category_id"
    t.string "the_group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "cover"
    t.string "image1"
    t.string "image2"
    t.string "image3"
    t.string "name"
    t.integer "price"
    t.text "intro"
    t.text "content"
    t.datetime "deleted_at"
    t.integer "category_id"
    t.string "the_group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cost"
    t.string "addon"
  end

  create_table "systems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "title"
    t.string "description"
    t.string "keywords"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.text "socials"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "youtube"
  end

  create_table "taggings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name", collation: "utf8_bin"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tickets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "cover"
    t.string "image1"
    t.string "image2"
    t.string "image3"
    t.string "image4"
    t.datetime "deleted_at"
    t.text "intro"
    t.text "content"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "article1"
    t.text "article2"
    t.text "article3"
    t.text "article4"
    t.text "article5"
    t.text "article6"
    t.string "the_group"
  end

  create_table "versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 4294967295
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
