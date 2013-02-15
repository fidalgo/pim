class Contact < ActiveRecord::Base
  attr_accessible :addresses_attributes, :birth_date, :email, :gender, :name, :vat_number
  has_many :addresses
  accepts_nested_attributes_for :addresses
  validates_uniqueness_of :vat_number
  paginates_per 50
end
