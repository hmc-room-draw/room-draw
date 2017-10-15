class DrawPeriodController < ApplicationController
    def index
        
    end

    def show
        @draw_period = DrawPeriod.find(params[:id])
    end

    def new
        @draw_period = DrawPeriod.new
    end

    def edit
        @draw_period = DrawPeriod.find(params[:id])
    end

    def update
        @draw_period = DrawPeriod.find(params[:id])

        if @draw_period.update_attributes(draw_period_param)
            redirect_to :action => 'show', :id => @draw_period
    end

    def destroy
        DrawPeriod.find(params[:id]).destroy
        redirect_to :action => 'list'
    end

    def draw_period_params
        params.require(:draw_periods).permit(:start, :end)
    end
end
