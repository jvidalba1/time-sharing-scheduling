class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def confirmation_email
    # @user = user
    @url  = 'http://example.com/login'
    mail(to: "jvidalba@gmail.com", subject: 'Confirmation email')
  end
end
