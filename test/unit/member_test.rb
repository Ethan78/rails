#coding: utf-8
require 'test_helper'

class MemberTest < ActiveSupport::TestCase
	test "factory girl" do
		member=Factory(:member)
		assert_equal "Yamada Taro",member.full_name
	end

	test "authenticate" do
		member = Factory(:member, name: "Taro",
			password: "happy", password_confirmation: "happy")
		assert_nil Member.authenticate("Taro","lucky")
		assert_equal member, Member.authenticate("Taro","happy")
	end
end
