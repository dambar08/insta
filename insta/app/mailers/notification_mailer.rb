class NotificationMailer < ApplicationMailer
  def new_follower_email
    follow = params[:follow]

    @user = follow.followable

    @follower = follow.follower
    @unsubscribe = generate_unsubscribe_token(@user.id, :email_follower_notifications)

    mail(to: @user.email, subject: "#{@follower.name} #{subjects[__method__]}")
  end
end
