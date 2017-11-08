# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin!

    def authenticate_admin!
      return if current_user.try :admin?
      redirect_to new_user_session_path, alert: I18n.t('devise.failure.unauthenticated')
    end
  end
end
