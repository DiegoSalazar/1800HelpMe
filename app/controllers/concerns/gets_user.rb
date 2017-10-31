module GetsUser
  extend ActiveSupport::Concern

  def get_user
    @user = User.find params[:user_id] if params[:user_id]
  end
end
