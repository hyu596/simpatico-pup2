class SessionsController < Devise::SessionsController

  def new
    super
  end

  def create
    user = User.find_by(email: params[:user][:email].downcase)
    p "*"*80
    p "#{user.email}"
    p "*"*80
    
    if !user.activated?
      p "*" * 80
      p "activated? method say it is not activated yet"
      p "*"*80
    end  
    if user
      p "*"*80
      p "user?"
      p "#{user.activated?}"
      if user.activated
        p "*"*80
        p "activated?"
        super
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # def destroy
  #   log_out if logged_in?
  #   redirect_to root_url
  # end
end