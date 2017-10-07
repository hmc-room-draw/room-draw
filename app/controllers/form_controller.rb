class FormController < ApplicationController

	def new
		@form = Form.new
	end
end
