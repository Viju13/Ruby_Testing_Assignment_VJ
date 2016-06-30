require_relative 'testSteps'

# Positive test for happy path
def positive_test_submit_form
mytest = TestSteps.new
mytest.navigate_to_form
mytest.fill_up_form
mytest.submit_form
mytest.assert_form_submission
end

# Negative test for mandatory field check
def negative_mandatory_field
mytest = TestSteps.new
mytest.navigate_to_form
mytest.fill_up_form_without_mandatory_fields
mytest.submit_form
mytest.assert_form_mandatory_message
end


#Remove "#" from below to execute a test case

#positive_test_submit_form
negative_mandatory_field


