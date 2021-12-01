require 'rake'
Rake::Task.clear
TestApp::Application.load_tasks

class DashboardsController < ApplicationController

  def show
  end

  def send_coupons
    Rake::Task['coupons:send'].execute
    redirect_to root_path, notice: 'Coupon Sent'
  end

end
