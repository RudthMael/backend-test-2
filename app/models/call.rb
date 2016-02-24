class Call < ActiveRecord::Base
  belongs_to :answering_number, class_name: 'UserNumber', foreign_key: :answering_number_id
  has_one :user, through: :answering_number

  validates :uuid, presence: true, uniqueness: true
  validates :direction, presence: true
  validates :from, presence: true
  validates :caller_name, presence: true
  validates :to, presence: true
  validates :status, presence: true
end
