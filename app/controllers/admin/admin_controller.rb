class Admin::AdminController < ApplicationController
  before_filter :authorize
end
