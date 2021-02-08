class ApplicationController < ActionController::Base
  helper_method :is_admin!

  private
  def is_admin!
    unless current_user and current_user.admin
      redirect_to root_path,  alert: 'Your account does not have access to this page!'
    end
  end
end
