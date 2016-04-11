Feature: User can add a book reference to the system if book information is proprerly inserted

	Scenario: Reference creation is successful when author, title, publisher and year are correctly inserted
		Given User is on add book page
		And Necessary book information is inserted
		When Add book is pressed
		Then Book reference should be added to the system

	Scenario: Reference creation fails if author, title, publisher or year is not specified
		Given User is on add book page
		And One of the fields is left blank
		When Add book is pressed
		Then User should be told what is missing

	Scenario: Reference creation fails if year, volume, month or series has a non-numeric value
		Given User is on add book page
		And A numeric value is not given when necessary
		When Add book is pressed
		Then User should be told where the false value is