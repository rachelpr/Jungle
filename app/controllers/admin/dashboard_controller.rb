class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['admin_username'], password: ENV['admin_pwd']


  def show
    
  end
end
