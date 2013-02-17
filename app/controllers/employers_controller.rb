class EmployersController < ApplicationController
	def new
  		@employer = Employer.new
  	end
    def create
  	  @employer = Employer.new(params[:employer])
      if @employer.save
      	flash[:success] = "Welcome to the Sample App!"
      	redirect_to @employer
      	#sign_in @employer
       else
         render 'new'
    	end
  	end
  	def show
  		@employer = Employer.find(params[:id])
  	end

  	def edit
  		@employer = Employer.find(params[:id])
  	end

  	def index
  		@employers = Employer.find(:all)
  	end

end
