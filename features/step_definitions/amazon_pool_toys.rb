require 'watir-webdriver'
require 'pry'

Given /^I am on the homepage for '([^']*?)'$/ do |app|
  @browser = Watir::Browser.new :firefox
  @browser.goto app
end

Given /^I search for '([^']*?)'/ do |item| 
   @browser.text_field(:id, 'twotabsearchtextbox').set item
   @browser.send_keys :return
end

Then /^I will output each item as a title and price grid for page one of the results$/ do 
   @browser.div(:id => 's-result-info-bar').exists?
   
   @browser.ul(:id =>'s-results-list-atf').lis.each do |item|
      product = item.h2
      amazon_price = item.span(:class, 's-price')
      other_price =  item.spans(:class, 'a-color-price').last  
   	  
   	  puts product.text
   	  
   	  if amazon_price.exists?
   	    puts amazon_price.text
   	  else  
   	    puts "Not available from Amazon " + other_price.text
      end 
   end   
   @browser.close
end

