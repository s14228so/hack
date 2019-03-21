class ApplicationController < ActionController::Base
  include AbstractController::Translation
     protect_from_forgery with: :null_session 
  before_action :authenticate_student_from_token!
  before_action :authenticate_company_from_token!

  respond_to :json

  ##
  # User Authentication
  # Authenticates the user with OAuth2 Resource Owner Password Credentials
  def authenticate_student_from_token!
    auth_token = request.headers['Authorization']

    if auth_token
      authenticate_with_auth_token auth_token
    else
      authenticate_error
    end
  end

  def authenticate_compnay_from_token!
     auth_token = request.headers['Authorization']

    if auth_token
      authenticate_company_with_auth_token auth_token
    else
      authenticate_error
    end
  end

  private

  def authenticate_with_auth_token auth_token
    unless auth_token.include?(':')
      authenticate_error
      return
    end

    student_id = auth_token.split(':').first
    student = Student.where(id: student_id).first

    if student && Devise.secure_compare(student.access_token, auth_token)
      # User can access
      sign_in student, store: false
    else
      authenticate_error
    end
  end


  def authenticate_company_with_auth_token auth_token
    unless auth_token.include?(':')
      authenticate_error
      return
    end

    company_id = auth_token.split(':').first
    company = Company.where(id: company_id).first

    if company && Devise.secure_compare(company.access_token, auth_token)
      # User can access
      sign_in company, store: false
    else
      authenticate_error
    end
  end

  ##
  # Authentication Failure
  # Renders a 401 error
  def authenticate_error
    render json: { error: t('devise.failure.unauthenticated') }, status: 401
  end
end