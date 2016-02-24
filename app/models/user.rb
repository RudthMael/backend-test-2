class User < ActiveRecord::Base
  has_many :numbers, class_name: 'UserNumber'

  validates :name, presence: true
end
