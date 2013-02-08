class Contact < ActiveRecord::Base
  attr_accessible :address, :birth_date, :country, :email, :gender, :name, :vat_number
  paginates_per 50
end
