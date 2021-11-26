require 'rake'
Rake::Task.clear
TestApp::Application.load_tasks # providing your application name is 'sample'

class ApplicationController < ActionController::Base

  def home_page
  end

  def run_task
    Rake::Task['send_coupon_code'].invoke
  end

end
