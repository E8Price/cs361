class Student
  MAX_COURSES = 5

  def remove_course_from_schedule(course, schedule, quarter_id)
    course_list_for_quarter(schedule, quarter_id).remove(course)
  end

  def add_course_to_schedule(course, schedule, quarter_id)
    course_list = course_list_for_quarter(schedule, quarter_id)
    
    if course_list.maximum_number_of_courses < MAX_COURSES
      course_list.add(course)
    end
  end

  private

  def course_list_for_quarter(schedule, quarter_id)
    schedule.quarter[quarter_id].course_list
  end
end
