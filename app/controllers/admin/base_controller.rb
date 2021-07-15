class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :require_admin
  before_action :set_main_menu, except: :destroy
  before_action :set_active_main_menu_item, except: :destroy


  private

  def set_main_menu
    @main_menu = { movies: { name: 'Movies', path: admin_movies_path },
                  categories: { name: 'Categories', path: admin_categories_path },
                  users: { name: 'Users', path: admin_users_path } }
  end

  def require_admin
    unless current_user && current_user.admin?
      flash[:alert] = "You are not authorized for this action"
      redirect_to root_path
    end
  end
end