# coding: utf-8

# データを追加したらrake db:seedを実行
# data set
MessageContent.create(:name => "トイ太郎", :sex => "男", :mood => "普通", :person_type => "秘密", :content => "疲れ気味なので3階で寝まてます。", :post_time => Time.current)
MessageContent.create(:name => "田中", :sex => "男", :mood => "お話したい", :person_type => "女装", :content => "来ちゃった！", :post_time => Time.current)
MessageContent.create(:name => "森田", :sex => "男", :mood => "疲れ気味", :person_type => "女装", :content => "21時ごろ行きます。", :post_time => Time.current)
MessageContent.create(:name => "みちょぱ", :sex => "NH", :mood => "普通", :person_type => "秘密", :content => "朝までいるよ〜", :post_time => Time.current)
MessageContent.create(:name => "りさ子", :sex => "男の娘", :mood => "ムラムラ", :person_type => "女装", :content => "今日は泊まりです。", :post_time => Time.current)
MessageContent.create(:name => "ヒゲ男", :sex => "女装", :mood => "お話したい", :person_type => "秘密", :content => "初めて行きます。よろしくお願いします。", :post_time => Time.current)
MessageContent.create(:name => "モン太", :sex => "女装", :mood => "普通", :person_type => "女装", :content => "差し入れ持って行きます。", :post_time => Time.current)
MessageContent.create(:name => "純男", :sex => "男", :mood => "秘密", :person_type => "秘密", :content => "終電逃したので行きます。", :post_time => Time.current)
MessageContent.create(:name => "とっちゃん", :sex => "男", :mood => "普通", :person_type => "秘密", :content => "2階は満員御礼。", :post_time => Time.current)
