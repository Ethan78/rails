#coding: utf-8

require 'test_helper'

class UserAuthenticationTest < ActionDispatch::IntegrationTest
	test "login and logout" do
		member=Factory(:member,name:"Taro",
			password:"Happy",password_confirmation:"Happy")

		post "/session",name:"Taro",password:"Happy",from:"/"
		assert_redirected_to "/"
		assert_equal member.id,session[:member_id]

		follow_redirect!
		assert_select "table#login_form",false
		assert_select "div#header p.member",/Taroさん/

		delete "/session"
		assert_redirected_to "/"
		assert_nil session[:member_id]

		follow_redirect!
		assert_select "table#login_form"
		assert_select "div#header p.member",false
	end
end
