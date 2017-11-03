class StaticPagesController < ApplicationController
	def home
	end

	def south
		render html: "South dorm"
	end

	def north
		render html: "North dorm"
	end

	def east
		render html: "East dorm"
	end

	def west
		render html: "West dorm"
	end

	def case
		render html: "Case"
	end

	def atwood
		render html: "Atwood"
	end

	def drinkward
		render html: "drinkward"
	end

	def sontag
		render html: "sontag"
	end

	def linde
		render html: "linde"
	end
end
