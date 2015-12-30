require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
	test "index" do
		5.times{ Factory(:article) }
		get :index
		assert_response :success
		assert_equal 5, assigns[:articles].count
	end

	test "show" do
		article=Factory(:article, expired_at: nil)
		get :show, id:article
		assert_response :success
	end

	test "new" do
		get :new
		assert_response :success
	end

	test "edit" do
		article=Factory(:article)
		get :edit, id: article
		assert_response :success
	end

	test "create" do
		post :create, article: Factory.attributes_for(:article)
		article = assigns[:article]
		assert_redirected_to article
	end

	test "update" do 
		article = Factory(:article)
	 	put :update, id: article, article: Factory.attributes_for(:article)
		assert_redirected_to article
	end
	end
end
