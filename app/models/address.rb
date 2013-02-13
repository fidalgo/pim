class Address < ActiveRecord::Base
  attr_accessible :city, :country, :postal_code, :street, :contact
  belongs_to :contact
end
