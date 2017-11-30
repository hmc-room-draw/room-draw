class DrawPeriod < ApplicationRecord
    validates_presence_of :start_datetime, :end_datetime, :last_updated_by    
    validate :startBeforeEnd

    private
    def startBeforeEnd
        if self.start_datetime > self.end_datetime
            errors.add(:end_datetime, " must occur after start.")
        end
    end
end
