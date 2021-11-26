require 'rake'
Rake::Task.clear
TestApp::Application.load_tasks # providing your application name is 'sample'

class ApplicationController < ActionController::Base

  def home_page
  end

  def expire_coupons
    Rake::Task['expire_coupons'].invoke
    redirect_to root_path, notice: 'Coupons Expired'
  end

  def create_coupons
    Rake::Task['create_coupons'].invoke
    redirect_to root_path, notice: 'Coupons Created'
  end

  def send_coupons
    Rake::Task['send_coupons'].invoke
    redirect_to root_path, notice: 'Coupon Sent'
  end

end
