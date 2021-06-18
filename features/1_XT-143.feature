@REQ_XT-143
Feature: login feature

	
	@TEST_XT-142 @XT-135 @1_XT-143.feature @XT-135 @features/1_XT-143.feature
	Scenario Outline: login feature
		Given I am on the login page
		When I login with <username> and <password>
		Then I should see a flash message saying <message>
		
			Examples: 
				| username | password             | message                        | 
				| tomsmith | SuperSecretPassword! | You logged into a secure area! | 
				| foobar   | barfoo               | Your username is invalid.      |