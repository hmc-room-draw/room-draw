module DrawPeriodHelper
    def getStatus(draw_period)
        if draw_period == current_draw_period
            @status = "Live"
        elsif draw_period.end < Time.now
            @status = "Complete"
        else
            @status = "Scheduled"
        end
    end

    def getLastUpdater(draw_period)
        @last_updater = User.where(id: draw_period.last_updated_by).first
    end
end
