require 'rake'
Rake::Task.clear
TestApp::Application.load_tasks

class SubscriptionController < ApplicationController

  def alert_subscriber
    Rake::Task[:alert_subscribers].reenable
    redirect_to root_path, notice: 'Subscribers Alerted'
  end

end
