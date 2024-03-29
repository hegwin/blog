class Admin::AdminController < ApplicationController
  before_action :authorize

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: 'Please login'
    end
  end

  def set_locale
    I18n.locale = :en
  end

  def default_url_options
    {}
  end
end
