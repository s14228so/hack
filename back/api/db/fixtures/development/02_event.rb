    # t.string "title"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false
    # t.text "content"
    # t.string "date"
  

Event.seed do |s|
  s.id = 1
  s.title = "イベント1(仮)"
  s.content = "イベント内容1"
  s.date = "2019-03-01"
end

Event.seed do |s|
  s.id = 2
  s.title = "イベント2(仮)"
  s.content = "イベント内容2"
  s.date = "2019-03-02"
end

Event.seed do |s|
  s.id = 3
  s.title = "イベント3(仮)"
  s.content = "イベント内容3"
  s.date = "2019-03-03"
end

Event.seed do |s|
  s.id = 4
  s.title = "イベント4(仮)"
  s.content = "イベント内容4"
  s.date = "2019-03-04"
end

Event.seed do |s|
  s.id = 5
  s.title = "イベント5(仮)"
  s.content = "イベント内容5"
  s.date = "2019-03-05"
end


Event.seed do |s|
  s.id = 6
  s.title = "イベント6(仮)"
  s.content = "イベント内容6"
  s.date = "2019-03-06"
end