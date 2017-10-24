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
end
