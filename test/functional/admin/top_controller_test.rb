require 'test_helper'

class Admin::TopControllerTest < ActionController::TestCase
	test "index for a common user" do
		login_as("Jiro")
		assert_raise(ApplicationController::Forbidden){get :index}
	end

	test "index for an admin" do
		login_as("Taro",true)
		get :index
		assert_response :success
	end
end
