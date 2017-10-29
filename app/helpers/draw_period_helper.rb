module DrawPeriodHelper
    def getStatus(draw_period)
        if draw_period == current_draw_period
            @status = "Live"
        elsif draw_period.end_datetime < Time.now
            @status = "Complete"
        else
            @status = "Scheduled"
        end
    end

    def getLastUpdater(draw_period)
        @last_updater = User.find_by(id: draw_period.last_updated_by).first_name
        @last_updater += " " + User.find_by(id: draw_period.last_updated_by).last_name
    end
end
