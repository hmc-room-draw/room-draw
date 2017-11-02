class AdminLandingPagesController < ApplicationController
  

  def dashboard
  end
	
	#TODO
	def uploadRoster
  	render html: "<script>alert('Upload Roster Called')</script>".html_safe
	end
	
	#TODO
	def downloadStudents
  	render html: "<script>alert('Download Students Called')</script>".html_safe
	end
	
	#TODO
	def downloadPulls
  	render html: "<script>alert('Download Pulls Called')</script>".html_safe
	end
	
	#TODO
	def setStartEndDates

		puts "transmission start"
		puts Time.now.strftime("%d/%m/%Y %H:%M");
		puts params.inspect;
		puts "transmission end";
  	render html: "<script>alert('Download Students Called')</script>".html_safe
	end
end
