class SubscriptionMailer < ApplicationMailer
  default from: 'subscriptions@netflix.com'

  def renewal_reminder(subscription)
    @subscription = subscription
    mail to: subscription.enabled_users.pluck(:email), subject: 'Netflix Subscription Expiring Soon'
  end

end
