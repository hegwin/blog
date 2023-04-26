class StaticPageController < ApplicationController
  def about
  end

  def offline
    render 'offline', layout: false

  end
end
