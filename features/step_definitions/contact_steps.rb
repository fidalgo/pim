# encoding: utf-8

### Utility methods ###
def create_contact
  visit '/contacts/new'
  fill_in "Name", :with => 'Manuel Jose'
  fill_in "Email", :with => "manuel.jose@example.com"
  fill_in "Vat number", :with => rand(9999999).to_s.center(7, rand(9).to_s)
  select('male', :from => 'Gender')
  select_date('31/12/1975', :from => 'Birth date')
  fill_in "Street", :with => "Rua D. Manuel, nº 35"
  fill_in "Postal code", :with => "4200-031"
  fill_in "City", :with => 'Porto'
  select('Portugal', :from => 'Country')
  click_button "Create Contact"
  find_contact
end

def create_contact_list(table)
  Contact.delete_all
  table.hashes.each do |hash|
    FactoryGirl.create(:contact, hash)
  end
end

def find_contact
  @contact ||= Contact.first conditions: {:email => "manuel.jose@example.com"}
end

### GIVEN ###
Given /^Exists the following contacts$/ do |table|
  #  create_contact_list(table)
  table.each do |group|
    address = group[:address]
    address.update_attributes(:contact => group[:contact])
  end
end


### WHEN ###
When /^I create a contact with valid data$/ do
  create_contact
end

When /^I edit a contact with valid data$/ do
  address = FactoryGirl.create(:address)
  contact = FactoryGirl.create(:contact)
  address.update_attributes(:contact => contact)
  visit edit_contact_path(contact)
  fill_in "Street", :with => "Avenida da Républica, nº 1080, 4250-220 Vila Nova de Gaia"
  click_button 'Update Contact'
end

When /^I go to the contacts listing$/ do
  #  contacts = FactoryGirl.create_list(:contact, 100)
  visit contacts_path
end

When /^I add a new address to contact$/ do
  contact =  create_contact
  visit edit_contact_path(contact)
  find_link('Add Address').visible?
  click_link "Add Address"
  last_id =   find(:xpath, "//input[@id='last_id']").value
  page.fill_in "contact_addresses_attributes_#{last_id}_street", :with => 'Rua da Tristeza, nº 23'
  click_button 'Update Contact'
end


### THEN ###
Then /^I should see a sucessfull create message$/ do
  page.should have_content "Contact was successfully created."
end

Then /^I should see a sucessfull edit message$/ do
  page.should have_content "Contact was successfully updated."
end

Then /^I should return to contacts list$/ do
  contacts_path
end

Then /^I should see the contact list ordered by name:$/ do |expected_table|
  rows = find("table").all('tr')
  table = rows.map { |r| r.all('th,td').map { |c| c.text.strip } }
  expected_table.diff!(table)
end

Then /^Show me the page$/ do
  save_and_open_page
end

Then /^I should see both addresses$/ do
  find_contact
  visit edit_contact_path(@contact)
  find(:xpath, "//input[@id='contact_addresses_attributes_1_street']").value == 'Rua da Tristeza, nº 23'
end


Transform /^table:name,street,city,country,email,birth date,gender$/ do |table|
  table.hashes.map do |hash|
    contact = FactoryGirl.create(:contact, :name => hash["name"], :email => hash["email"], :birth_date => hash["birth date"], :gender => hash["gender"])
    address = FactoryGirl.create(:address, :street => hash["street"], :city => hash["city"], :country => hash["country"])
    {:contact => contact, :address => address}
  end
end
