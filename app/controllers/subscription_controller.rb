require 'rake'
Rake::Task.clear
TestApp::Application.load_tasks

class SubscriptionController < ApplicationController

  def alert_subscriber
    # Rake::Task[:alert_subscribers].reenable
    Subscription.find_each do |subscription|
      if subscription.remaining_days.in?(REMINDING_DAYS)
        puts "Alerting Subscribers of Subscription Id-#{subscription.id}"
        SubscriptionMailer.renewal_reminder(subscription).deliver_later
      end
    end


    redirect_to root_path, notice: 'Subscribers Alerted'
  end

end
