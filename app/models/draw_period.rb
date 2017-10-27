class DrawPeriod < ApplicationRecord
    validates_presence_of :start, :end, :last_updated_by
    validates_uniqueness_of :start, :end
    
    validate :startBeforeEnd
    validate :noTimeConflicts
    
    def time_range
        :start..:end
    end

    private
    def startBeforeEnd
        if :start <= :end
            errors.add(:end, " must occur after start.")
        end
    end

    def noTimeConflicts
        @draw_periods = DrawPeriod.all
        if @draw_periods.any? {|draw_period| draw_period.time_range.overlaps?(time_range)}
            errors.add_to_base("This time range conflicts with another draw period.")
        end
    end
end
