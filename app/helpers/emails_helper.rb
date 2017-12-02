module EmailsHelper
  def recipients(email)
    @recipients = ""
    if email.send_to_never_logged_in
      @recipients += "Never logged in<br>"
    end
    if email.send_to_never_pulled_room
      @recipients += "Never pulled room<br>"
    end
    if email.send_to_formerly_in_room
      @recipients += "Formerly in room<br>"
    end
    if email.send_to_in_room
      @recipients += "In room<br>"
    end
    if email.send_to_admins
      @recipients += "Admins"
    end
    return @recipients
  end

  def get_person_counts(status_type)
    count = 0
    case status_type
    when "admin"
      count = User.all.select{|user| user.is_admin == true}.length
    else
      count = Student.all.select{|student| student.status == status_type}.length
    end
    if count == 1
      return " (currently 1 person)"
    else
      return " (currently #{count} people)"
    end
  end

  def destroy_action(email)
    if email.sent_status
      return "Delete"
    end
    return "Cancel"
  end
end
