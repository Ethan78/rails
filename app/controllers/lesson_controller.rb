#coding: utf-8

class LessonController < ApplicationController
before_filter :do_before, only: :step7

	def step1
		render text: "こんにちは, #{params[:name]}さん"
	end

	def step2
		render text: params[:controller]+"#"+params[:action]
	end

	def step3
		redirect_to action: "step4"
	end

	def step4
		render text: "ようこそ！ステップ４やで"
	end

	def step5
		flash[:notice]="こんちゃ！ステップ５から"
		redirect_to action: "step6"
	end

	def step6
		render text: flash[:notice]
	end

	def step7
		render text: @message
	end

	def step8
		@price=(2000*1.05).floor
	end

	def step9
		@price=1000
		render "step8"
	end

	def step10
		@comment="<script>alert('Help')</script>こんちゃ"
	end

	def step11
		@comment="<script>alert('Help')</script>こんちゃ"
	end

	def step12
		@population=99992323
		@surface=111.22
	end

	def step13
		@time=Time.now
	end

	def step15
		@message="元気っすか？\nRailsの勉強は楽しいね"
	end

	private
	def do_before
		@message="ハロー"
	end
end
