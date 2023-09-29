class MessageContent < ApplicationRecord
  # name, sex, mood, type, content属性の検証：空文字でない、各指定文字数未満であること
  validates :name,    presence: true, length: { maximum: 20 }
  validates :sex,     presence: true, length: { maximum: 20 }
  validates :mood,    presence: true, length: { maximum: 20 }
  validates :type,    presence: true, length: { maximum: 10 }
  validates :content, presence: true, length: { maximum: 100 } # 本文は100文字まで入力可
end
