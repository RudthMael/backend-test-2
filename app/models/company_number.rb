class CompanyNumber < ActiveRecord::Base
  validates :name, presence: true
  validates :sip_endpoint, presence: true
end
