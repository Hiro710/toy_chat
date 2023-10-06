class MessageContent < ApplicationRecord
  # name, sex, mood, person_type, content属性の検証：空文字でない、各指定文字数未満であること
  validates :name,    presence: true, length: { maximum: 20 }
  validates :sex,     presence: true, length: { maximum: 10 }
  validates :mood,    presence: true, length: { maximum: 10 }
  validates :person_type,    presence: true, length: { maximum: 10 }
  validates :content, presence: true, length: { maximum: 100 } # 本文は100文字まで入力可

  # 並べ替え：投稿の新着順(desc)・古い順(asc)
  # 投稿の作成時間を基準にしている
  scope :latest, -> { order(created_at: :desc) }
  scope :old, -> { order(created_at: :asc) }
end
