class SessionEmployersController < ApplicationController
	def new
	end
	def create
	    employer = Employer.find_by_email(params[:session_employer][:email].downcase)
	    if employer && employer.authenticate(params[:session_employer][:password])
	      sign_in employer
	      redirect_back_or employer
	    else
	      flash.now[:error] = 'Invalid email/password combination'
	      render 'new'
	    end
  	end
	def destroy
		employer = Employer.find_by_remember_token(cookies[:remember_token])
		sign_out_employer employer
		redirect_to root_path

	end

end
