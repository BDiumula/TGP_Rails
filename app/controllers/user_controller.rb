class UserController < ApplicationController

	def index 
		@user = User.all
	end

	def show
		@user = User.find(params[:id])
		
		puts @user.first_name
		puts @user.age
		puts @user.email
		puts @user.description
	end

	def edit 
		@user = User.find(params[:id])
	end
 	

end

