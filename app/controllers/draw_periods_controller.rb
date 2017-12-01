class DrawPeriodsController < ApplicationController
    before_action :set_draw_period, only: [:update, :destroy]

    def create
        @draw_period = DrawPeriod.new(draw_period_params)
        
        if @draw_period.save
            flash[:notice] = 'Draw Period was successfully created.'
            redirect_to root_path
        else
            render "static_pages/home"
        end
    end

    def update
        if @draw_period.update(draw_period_params)
            flash[:notice] = 'Draw Period was successfully updated.'
            redirect_to root_path
        else
            render "static_pages/home"
        end
    end

    def destroy
        @draw_period.destroy
        respond_to do |format|
            format.html { redirect_to root_path, notice: 'Draw Period was successfully canceled.' }
            format.json { head :no_content }
        end
    end 

    private
        def set_draw_period
            @draw_period = DrawPeriod.first
        end
        
        def draw_period_params
            params.require(:draw_period).permit(:start_datetime, :end_datetime).merge(id: 1, last_updated_by: current_user.id)
        end
end
