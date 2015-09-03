class PostsController < ApplicationController
	 before_action :set_post, only: [:show, :edit,]

	def index
		@posts = Post.all
	end

	def show

	end

	# GET /posts/1/edit
	def edit
		
	end

    # GET /posts/new
	def new 
		@post = Post.new
	end

	def create
	   @post = Post.new(post_params)

	    respond_to do |format|
	      if @post.save
	        format.html { redirect_to @post, notice: 'Status was successfully created.' }
	        format.json { render :show, post: :created, location: @post }
	      else
	        format.html { render :new }
	        format.json { render json: @post.errors, post: :unprocessable_entity }
	      end
	    end
    end

    private 
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
