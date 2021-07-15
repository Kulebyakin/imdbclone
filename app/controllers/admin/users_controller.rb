class Admin::UsersController < Admin::BaseController
  def index
    @users = User.order(id: :desc)
  end

  private

  def set_active_main_menu_item
    @main_menu[:users][:active] = true
  end
end
