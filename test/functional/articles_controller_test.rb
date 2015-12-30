require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
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

	test "fail to create" do
		attrs = Factory.attributes_for(:article, title: "")
		post :create, article: attrs
		assert_response :success
		assert_template "new"
	end

	test "fail to update" do
		attrs = Factory.attributes_for(:article, body: "")
		article = Factory(:article)
		put :update, id: article, article: attrs
		assert_response :success
		assert_template "edit"
	end

	test "destroy" do
		article = Factory(:article)
		delete :destroy, id: article
		assert_redirected_to :articles
		assert_raise(ActiveRecord::RecordNotFound){
			Article.find(article.id)}
	end

#	test "index" do
#		2.times { Factory(:article) }
#		Factory(:article, released_at: 1.hours.from_now)
#		get :index
#		assert_response :success
#		assert_select "div#content h2", 2
#	end
end
