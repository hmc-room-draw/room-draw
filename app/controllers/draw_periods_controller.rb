class DrawPeriodsController < ApplicationController
    before_action :set_draw_period, only: [:show, :edit, :update, :destroy]
    helper DrawPeriodHelper
    
    def show
        @draw_period = DrawPeriod.find(params[:id])
    end

    def new
        @draw_period = DrawPeriod.new
    end

    def create
        @draw_period = DrawPeriod.new(draw_period_params)
        
        respond_to do |format|
            if @draw_period.save
                format.html { redirect_to root_path, notice: 'Draw Period was successfully scheduled.' }
                format.json { render :show, status: :created, location: @draw_period }
            else
                format.html { render :new }
                format.json { render json: @draw_period.errors, status: :unprocessable_entity }
            end
        end
    end

    def edit
        @draw_period = DrawPeriod.find(params[:id])
    end

    def update
        respond_to do |format|
            if @draw_period.update(draw_period_params)
                format.html { redirect_to root_path, notice: 'Draw Period was successfully updated.' }
                format.json { render :show, status: :ok, location: @draw_period }
            else
                format.html { render :edit }
                format.json { render json: @draw_period.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @draw_period.destroy
        respond_to do |format|
            format.html { redirect_to draw_periods_url, notice: 'Draw Period was successfully canceled.' }
            format.json { head :no_content }
        end
    end 

    # method for setting up datetime entry on landing page
    def admin_landing_page
        if(DrawPeriod.all == nil)
            @draw_period = DrawPeriod.all[0]
            @start_datetime = drawperiod.start_datetime
            @end_datetime = drawperiod.start_datetime
            puts "first"
        else
            new
            @start_datetime = Time.now
            @end_datetime = Time.now
            @draw_period.start_datetime = @start_datetime
            puts "second"
        end
        puts "start"
        puts @draw_period.inspect
        puts "end"
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
              # Use user_id to trace the first name, last name and email of user_id
              # uncomment and test this block when database code is ready
              #user = User.find_by(user_id: student.user_id)
              #csv << [user.first_name, user.last_name, student.class_rank,user.email]
              csv << [student.user.last_name, student.user.first_name, student.class_rank, student.room_draw_number, student.user.email]
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
            @draw_period = DrawPeriod.find(params[:id])
        end
        
        def draw_period_params
            params.require(:draw_period).permit(:start_datetime, :end_datetime).merge(last_updated_by: current_user.id)
        end
end
