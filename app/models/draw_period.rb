class DrawPeriod < ApplicationRecord
    validates_presence_of :start_datetime, :end_datetime, :last_updated_by
    validates_uniqueness_of :start_datetime, :end_datetime
    
    validate :startBeforeEnd
    validate :noTimeConflicts
    
    def time_range
        start_datetime...end_datetime
    end

    private

    def startBeforeEnd
        if :start_datetime <= :end_datetime
            errors.add(:end_datetime, " must occur after start.")
        end
    end

    def noTimeConflicts
        @draw_periods = DrawPeriod.all
        if @draw_periods.any? { |draw_period| 
                draw_period.time_range.overlaps? time_range }
            errors.add(:base, "This time range conflicts with another draw period.")
        end
    end


end
