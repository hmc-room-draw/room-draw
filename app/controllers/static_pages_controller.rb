class StaticPagesController < ApplicationController
	def home
	end

	def dormLookup
		# Get the name of the dorm from the params
		dormName = params[:name]

		# Look up the dorm by the name
		dorm = Dorm.find_by_name(dormName)
		# Redirect to that dorms page
		redirect_to dorm
	end
	
end
