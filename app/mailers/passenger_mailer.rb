class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirmation_email(pax)
    @passenger = pax
    @url  = 'http://example.com/login'
    mail(to: @passenger.email, subject: 'Welcome to My Awesome Site')
  end
end
