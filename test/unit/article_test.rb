#coding: utf-8
require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
	#長さのてすと
	test "length" do
		article=Factory.build(:article)
		article.title = "A" * 201
		assert article.invalid?
		assert article.errors.include?(:title)
	end

	#掲載終了日は掲載開始日より後
	test "expired_at" do
		article=Factory.build(:article)
		article.released_at=Time.current
		article.expired_at=1.days.ago
		assert article.invalid?
		assert article.errors.include?(:expired_at)
	end

	#no_expirationがONならexpired_atを使わない
	test "no_expiration" do
		article=Factory.build(:article)
		article.no_expiration=true
		assert article.valid?
		assert_nil article.expired_at
	end

	#readableスコープのチェック
	test "readable_for" do
		article1=Factory(:article,
			released_at: 1.day.ago, expired_at: 1.day.from_now)
		article2=Factory(:article,
			released_at: 2.days.ago, expired_at: 1.day.ago)
		article3=Factory(:article,
			released_at: 1.day.from_now, expired_at: 2.days.from_now)
		article4=Factory(:article,
			released_at: 1.day.ago, expired_at: nil)
		article5=Factory(:article, title: "会員のみ",
			released_at: 1.days.ago, expired_at: nil, member_only: true)
		
		articles=Article.readable_for(nil)
		assert_includes articles,article1,"現在の記事が含まれる"
		assert_not_includes articles,article2, "過去の記事は含まれない"
		assert_not_includes articles,article3, "未来の記事は含まれない"
		assert_includes articles,article4, "expiredがnilの場合"
		assert_not_includes articles,article5, "会員のみ"
	end
end
