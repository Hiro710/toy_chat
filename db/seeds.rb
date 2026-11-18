# coding: utf-8

# シードデータ（バリデーションをスキップして既存データを復元）
[
  { name: "トイ太郎",  sex: "男",    mood: "普通",       person_type: "秘密", content: "疲れ気味なので3階で寝まてます。" },
  { name: "田中",      sex: "男",    mood: "お話したい", person_type: "女装", content: "来ちゃった！" },
  { name: "森田",      sex: "男",    mood: "疲れ気味",   person_type: "女装", content: "21時ごろ行きます。" },
  { name: "みちょぱ",  sex: "NH",   mood: "普通",       person_type: "秘密", content: "朝までいるよ〜" },
  { name: "りさ子",    sex: "男の娘", mood: "ムラムラ",   person_type: "女装", content: "今日は泊まりです。" },
  { name: "ヒゲ男",    sex: "女装",  mood: "お話したい", person_type: "秘密", content: "初めて行きます。よろしくお願いします。" },
  { name: "モン太",    sex: "女装",  mood: "普通",       person_type: "女装", content: "差し入れ持って行きます。" },
  { name: "純男",      sex: "男",    mood: "秘密",       person_type: "秘密", content: "終電逃したので行きます。" },
  { name: "とっちゃん", sex: "男",   mood: "普通",       person_type: "秘密", content: "2階は満員御礼。" },
  { name: "12345",     sex: "秘密",  mood: "秘密",       person_type: "秘密", content: "3日連続でいます。" },
  { name: "純男2",     sex: "男",    mood: "秘密",       person_type: "秘密", content: "23時ごろ向かいます。" },
  { name: "まぐろ",    sex: "男",    mood: "普通",       person_type: "秘密", content: "お刺身持っていきます。" },
  { name: "純男",      sex: "男",    mood: "秘密",       person_type: "秘密", content: "またきたよ。" },
  { name: "とっちゃん", sex: "男",   mood: "普通",       person_type: "秘密", content: "2階でまったり" },
  { name: "12345",     sex: "秘密",  mood: "秘密",       person_type: "秘密", content: "6日連続でいます。" },
  { name: "純男2",     sex: "男",    mood: "秘密",       person_type: "秘密", content: "21時ごろ向かいます。" },
  { name: "まぐろ",    sex: "男",    mood: "普通",       person_type: "秘密", content: "お昼頃から外出します" },
  { name: "純男",      sex: "男",    mood: "秘密",       person_type: "秘密", content: "始発で帰ります。" },
  { name: "とっちゃん", sex: "男",   mood: "普通",       person_type: "秘密", content: "2階は過疎ってます。" },
  { name: "12345",     sex: "秘密",  mood: "秘密",       person_type: "秘密", content: "3階で寝待ち..." },
  { name: "純男2",     sex: "男",    mood: "秘密",       person_type: "秘密", content: "19時に帰ります" },
  { name: "まぐろ",    sex: "男",    mood: "普通",       person_type: "秘密", content: "東京から来ました。仲良くして下さい。" },
].each do |attrs|
  mc = MessageContent.new(attrs)
  mc.save(validate: false)
end

# 管理者アカウント（本番前にパスワードを変更してください）
Admin.find_or_create_by(username: "admin") do |a|
  a.password              = "toybox_admin"
  a.password_confirmation = "toybox_admin"
end
