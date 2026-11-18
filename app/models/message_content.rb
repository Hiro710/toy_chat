class MessageContent < ApplicationRecord
  has_secure_password validations: false

  validates :name,    presence: true, length: { maximum: 20 }
  validates :sex,     presence: true
  validates :mood,    length: { maximum: 10 }
  validates :person_type,   length: { maximum: 10 }
  validates :content, presence: true, length: { maximum: 100 }
  validates :password,              presence: true, length: { minimum: 4, maximum: 72 }, on: :create
  validates :password_confirmation, presence: true, on: :create

  validate :validate_name_not_including_comma

  scope :latest, -> { order(created_at: :desc) }
  scope :old, -> { order(created_at: :asc) }
  scope :search, ->(q) { where("name LIKE :q OR content LIKE :q", q: "%#{q}%") if q.present? }

  private
    def validate_name_not_including_comma
      errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
    end
end
