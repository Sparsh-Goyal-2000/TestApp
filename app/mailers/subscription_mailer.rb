class SubscriptionMailer < ApplicationMailer
  default from: 'subscriptions@netflix.com'

  def expiring(subscription)
    @subscription = subscription
    mail to: subscription.users.pluck(:email), subject: 'Netflix Subscription Expiring Soon'
  end

end
