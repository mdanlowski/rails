class CitationsController < ApplicationController
	def index
		@citations = Citation.all.paginate(page: params[:page], per_page: 12)
		@last_cit = Citation.last
	end

	def new
		
	end

	def create
		# render plain: params[:citation].inspect
		@cit = Citation.new(post_params)
		@cit.save
		redirect_to root_path
	end

	def show
		@cit = Citation.find(params[:id])
	end


	private def post_params
		params.require(:citation).permit(:citation_text)
	end

end
