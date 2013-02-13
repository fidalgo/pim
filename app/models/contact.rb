class Contact < ActiveRecord::Base
  attr_accessible :address_attributes, :birth_date, :email, :gender, :name, :vat_number
  has_one :address
  accepts_nested_attributes_for :address
  validates_uniqueness_of :vat_number
  paginates_per 50
end
