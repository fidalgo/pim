Feature: Manage Contacts
    In order to manage contacts
    As a logged user
    I want to create and manage contacts

    Background:
        Given I am logged in

    Scenario: Create a contact with valid data
        When I create a contact with valid data
        Then I should see a sucessfull create message

    Scenario: Edit a contact
        When I edit a contact with valid data
        Then I should see a sucessfull edit message
        And I should return to contacts list

    Scenario: Listing contacts ordered by name
        Given Exists the following contact records
            |id|name|address|country|email|vat_number|birth_date|gender|
            |1|Juan José|Calle del Juan 23, Madrid|Spain|juan@example.com|311900222|1970-02-12|male|
            |2|John Doe|John Doe Street|Australia|john@example.com|111222333|1977-12-20|male|
            |3|Manuela Silva|Rua da Alegria,Porto|Portugal|manuela@example.com|194321897|1986-12-20|female|
        And we paginate after 2 contacts
        When I go to the contacts listing
        Then I should see the contact list ordered by name:
            |id|Name|Address|Country|Email|VAT Number|Birth date|Gender|
            |2|John Doe|John Doe Street|Australia|john@example.com|111222333|1977-12-20|male|
            |1|Juan José|Calle del Juan 23, Madrid|Spain|juan@example.com|311900222|1970-02-12|male|
        And I should see pagination
        And I should see the first page of pagination
        And I should see a link to the next page of pagination
        When I click the next page link
        Then I should see the second page of pagination
