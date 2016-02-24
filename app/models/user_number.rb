class UserNumber < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :sip_endpoint, presence: true, uniqueness: true
end
