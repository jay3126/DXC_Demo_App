class UserMailer < ApplicationMailer

  def welcome_email
    user = User.last
    email = [user.email, "ssambare11111@gmail.com", "mohammedhussain781997@gmail.com", "ashanmugam3@dxc.com", "shwetapathade4@gmail.com", "pranjali.wagh@dxc.com", "rohan.dange@dxc.com", "goliarchana001@gmail.com"]
    mail(to: email, subject: "Welcome to the world of email")
  end
end