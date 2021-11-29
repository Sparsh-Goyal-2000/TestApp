desc "it alerts subscriber whose subscription is ending soon"
task alert_subscribers: :environment do
  Subscription.find_each do |subscription|
    if subscription.remaining_days.in?([30, 7, 1])
      puts "Alerting Subscribers of Subscription Id-#{subscription.id}"
      SubscriptionMailer.expiring(subscription).deliver_later
    end
  end
end
