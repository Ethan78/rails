class Member < ActiveRecord::Base
	def change
		create table :members do |t|
			t.string :name
			t.timestamps
		end
	end
	class << self
		def search(query)
			rel=order("number")
			if query.present?
				rel=rel.where("name like ? or full_name like ?",
					"%#{query}%","%#{query}%")
			end
			rel
		end
	end
end
