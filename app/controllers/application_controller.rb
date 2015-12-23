class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to account_tasks_path, flash: { alert: 'Доступ запрещен.' }
    else
      redirect_to new_user_session_path, flash: { alert: 'Необходимо войти в систему.' }
    end
  end

  def after_sign_in_path_for resource
    account_tasks_path
  end
end
