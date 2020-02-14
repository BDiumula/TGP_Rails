class UsersController < ApplicationController

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

	def new
		@user = User.new
	end

	def edit 
		@user = User.find(params[:id])
	end

	def create
		user = User.create(user_params)
		flash[:notice]= "Bravo vous avez bien créer votre compte"
		if user.save
			log_in(@user)
			redirect_to users_path(@user.id)
		end
	end 

		private

	def user_params
			user_params = params.require(:user).permit(:first_name,:last_name,:age,:email,:password,:description)

		end

	end

