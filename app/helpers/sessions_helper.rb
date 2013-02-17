module SessionsHelper
	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user 
	end
	def signed_in?
    	!current_user.nil?
  	end
	def current_user=(user)
    	@current_user = user
  end
  def current_user
   	@current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  def sign_out(user)
  	cookies.delete :remember_token
  	self.current_user = nil
 	end
  def current_user?(user)
    user == current_user
  end
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end




  def sign_in_employer(employer)
    cookies.permanent[:remember_token] = employer.remember_token
    self.current_employer = employer 
  end
  def signed_in_employer?
      !current_employer.nil?
    end
  def current_employer=(employer)
      @current_employer = employer
  end
  def current_employer
    @current_employer ||= Employer.find_by_remember_token(cookies[:remember_token])
  end
  def sign_out_employer(employer)
    cookies.delete :remember_token
    self.current_employer = nil
  end
  def current_employer?(employer)
    employer == current_employer
  end
  def redirect_back_or_employer(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location_employer
    session[:return_to] = request.url
  end
  def signed_in_employer
    unless signed_in_employer?
      store_location_employer
      redirect_to signin_employer_url, notice: "Please sign in."
    end
  end



      
end
