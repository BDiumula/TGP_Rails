class GossipsController < ApplicationController
	before_action :authenticate_user, only: [:create, :edit, :destroy]
	def index 
		@gossips = Gossip.all
	end

	def show
		@gossip = Gossip.find(params[:id])
		@auteur = User.find("#{@gossip.user_id}") 
		puts @gossip.title
		puts @gossip.content
		puts @gossip.user_id 
	end

	def edit 
		@gossip = Gossip.find(params[:id])
	end

	def update
		@gossip = Gossip.find(params[:id])
		gossip_params = params.require(:gossip).permit(:title,:content)
		@gossip.update(gossip_params)
		flash[:notice]= "Le potin est bien modifié!"
		redirect_to gossips_path
	end

	def new
		@gossip= Gossip.new
	end

	def create
		puts params
		@gossip = Gossip.create(title:params[:gossip][:title], content: params[:gossip][:content], user_id: User.all.ids.sample)
		@gossip.user = User.find_by(id: session[:user_id])
		flash[:notice]= "Bravo, vous avez créer un nouveau potin!"
		redirect_to gossips_path
	end 

	def destroy
		@gossip = Gossip.find(params[:id])
		@gossip.destroy
		redirect_to gossips_path
	end 

	private

	def gossip_params
		gossip_params = params.require(:gossip).permit(:title,:content)

	end

end

