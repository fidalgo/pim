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
        Given Exists the following contacts
            |name|street|city|country|email|birth date|gender|
            |Juan José|Calle del Juan 23|Madrid|Spain|juan@example.com|1970-02-12|male|
            |John Doe|John Doe Street|Sidney|Australia|john@example.com|1977-12-20|male|
            |Manuela Silva|Rua da Alegria|Porto|Portugal|manuela@example.com|1986-12-20|female|
        And we paginate after 2 contacts
        When I go to the contacts listing
        Then I should see the contact list ordered by name:
            |Name|Street|City|Country|Email|Birth date|Gender|
            |John Doe|John Doe Street|Sidney|Australia|john@example.com|1977-12-20|male|
            |Juan José|Calle del Juan 23|Madrid|Spain|juan@example.com|1970-02-12|male|
        And I should see pagination
        And I should see the first page of pagination
        And I should see a link to the next page of pagination
        When I click the next page link
        Then I should see the second page of pagination
