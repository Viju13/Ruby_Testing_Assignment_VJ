require 'selenium-webdriver'

class TestSteps

	def navigate_to_form
		@driver = Selenium::WebDriver.for :chrome
		@driver.navigate.to "https://docs.google.com/forms/d/181whJlBduFo5qtDbxkBDWHjNQML5RutvHWOCjEFWswY/viewform"
	end

	def fill_up_form
		@driver.find_element(:css, '.ss-q-short').send_keys "Vijay Test"
		set_development_choice("Yes")
		select_framework_option("JUnit")
		@driver.find_element(:id,'entry_649813199').send_keys 'A Test'
	end
	
	
	
	def fill_up_form_without_mandatory_fields
		select_framework_option("JUnit")
		@driver.find_element(:id,'entry_649813199').send_keys 'A Test'
	end

	def submit_form
			@driver.find_element(:id,'ss-submit').click
	end

	def assert_form_submission
		elements = @driver.find_elements(:css, '.ss-resp-message')
		fail "could not find the assertion element" if elements.length == 0
		assertion_message = elements.first.text
		fail "form submission failed" if assertion_message.to_s != "Your response has been recorded."
	end
	
	
	def assert_form_mandatory_message
		elements = @driver.find_elements(:css, '.required-message')
		fail "could not find the assertion element" if elements.length == 0
		p "This is a required question"
	end
	
	
	
	protected
	def set_development_choice(value)
		@driver.find_element(:id,'group_310473641_1').click if value.downcase == "yes"
		@driver.find_element(:id,'group_310473641_2').click if value.downcase == "no"
	end

	def select_framework_option(value)
		dropdown_list = @driver.find_element(:id, 'entry_262759813')
		options = dropdown_list.find_elements(tag_name: 'option')
		options.each { |option| option.click if option.text == value }
	end
	
end
