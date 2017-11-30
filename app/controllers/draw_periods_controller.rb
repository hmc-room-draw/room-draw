class DrawPeriodsController < ApplicationController
    before_action :set_draw_period, only: [:update, :destroy]
    helper DrawPeriodHelper

    def create
        @draw_period = DrawPeriod.new(draw_period_params)
        
        if @draw_period.save
            flash[:notice] = 'Draw Period was successfully created.'
            redirect_to admin_home_path
        else
            render :admin_landing_page
        end
    end

    def update
        if @draw_period.update(draw_period_params)
            flash[:notice] = 'Draw Period was successfully updated.'
            redirect_to admin_home_path
        else
            render :admin_landing_page
        end
    end

    def destroy
        @draw_period.destroy
        respond_to do |format|
            format.html { redirect_to admin_home_path, notice: 'Draw Period was successfully canceled.' }
            format.json { head :no_content }
        end
    end 

    def admin_landing_page
        if(DrawPeriod.first == nil)
            @draw_period = DrawPeriod.new
        else
            @draw_period = DrawPeriod.first
        end
    end

    def downloadPlacements
        placements_csv = CSV.generate do |csv|
            headings = ["Last Name", "First Name", "Class", 
                        "Room Draw Number", "Dorm", "Room", "Preplaced"]
            csv << headings

            Student.all.each do |student|
                user = User.find_by(id: student.user_id)
                room_assignment = student.room_assignment

                basic_info = [user.last_name, user.first_name, 
                              student.class_rank, student.room_draw_number]
                
                if room_assignment == nil
                    placement_info = ["", "", false]
                else
                    placement_info = [room_assignment.room.dorm.name, 
                                      room_assignment.room.number, 
                                      room_assignment.assignment_type == "preplaced"]
                end

                csv << basic_info + placement_info
            end
        end
    
        send_data placements_csv, 
            :type => 'text/csv', 
            :filename => 'placements.csv', 
            :disposition => 'attachment'
    end
    

    def downloadNonParticipants
        user_csv = CSV.generate do |csv|
          csv << ["Last Name", "First Name", "Class Rank", "Room Draw Number", "Email"]
          Student.all.each do |student|
            if student.has_participated == false
              user = User.find_by(id: student.user_id)
              csv << [user.first_name, user.last_name, student.class_rank, student.room_draw_number, user.email]
            end
          end
        end
        send_data user_csv,
          :type => 'text/csv',
          :filename => 'non_participants.csv',
          :disposition => 'attachment'
    end

    private
        def set_draw_period
            @draw_period = DrawPeriod.first
        end
        
        def draw_period_params
            params.require(:draw_period).permit(:start_datetime, :end_datetime).merge(id: 1, last_updated_by: current_user.id)
        end
end
