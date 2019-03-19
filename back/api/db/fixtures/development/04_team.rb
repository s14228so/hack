
  # create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
  #   t.string "name"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.text "introduction"
  # end

Team.seed do |s|
  s.id = 1
  s.name = "チーム1"
  s.introduction = "チーム内容1"
end


Team.seed do |s|
  s.id = 2
  s.name = "チーム2"
  s.introduction = "チーム内容2"
end



Team.seed do |s|
  s.id = 3
  s.name = "チーム3"
  s.introduction = "チーム内容3"
end

Team.seed do |s|
  s.id = 4
  s.name = "チーム4"
  s.introduction = "チーム内容4"
end


Team.seed do |s|
  s.id = 5
  s.name = "チーム5"
  s.introduction = "チーム内容5"
end