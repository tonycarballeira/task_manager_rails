class TeamsController < ApplicationController
	def new
		@team = Team.new
	end

	def create

		@team = Team.new(team_params)

		if @team.save			
			redirect_to accounts_path, :notice => "New Team Created!"
		else
			render "new"
		end
	end

	def index
		@teams = Team.all
	end

	def edit
    	@team = Team.find(params[:id])
  	end

  	def update
    	@team = Team.find(params[:id])
 
    	if @team.update(team_params)
      		redirect_to teams_path, :notice => "Account Updated!"
    	else
      		render 'edit'
    	end
  	end

	private
  	
  	## Strong Parameters 
	def team_params
    	params.require(:team).permit(:name)
  	end
end