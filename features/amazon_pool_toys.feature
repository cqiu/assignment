Feature: Required test case

Scenario: Looking for pool toys on Amazon
   Given I am on the homepage for 'Amazon.com'
     And I search for 'Pool Toys'
    Then I will output each item as a title and price grid for page one of the results
