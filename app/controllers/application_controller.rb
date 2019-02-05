class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    student_path(current_student)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end
