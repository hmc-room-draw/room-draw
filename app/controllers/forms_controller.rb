class FormsController < ApplicationController

	def new
		@form = Form.new
	end

	def create
		@form = Form.new(form_params)
		if @form.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	private
		def form_params
			params.require(:form).permit(:name, :studentID, :currentDorm, :currentRoom, :wifiStrength)
		end

end
