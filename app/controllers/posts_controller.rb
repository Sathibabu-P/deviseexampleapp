class PostsController < ApplicationController

	before_action :get_author, only: [:new,:edit,:destroy,:show]
	before_action :set_author, only: [:create,:update]
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new

  end

  def show
  	@post = Post.find(params[:id])  	
  end

  def create
  	@post = Post.new(post_params)
  	@post.author = @author
  	 respond_to do |format|
      if @post.save
        format.html { redirect_to @author, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	@pagedirect = @post   
  	@pagedirect = @author if @author
  	 respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @pagedirect, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @pagedirect }
      else
        format.html { render :new }
        format.json { render json: @pagedirect.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy  		
  	@post = Post.find(params[:id])
  	@pagedirect = @post   
  	@pagedirect = @student if @student
  	@pagedirect = @teacher if @teacher    
    @post.destroy
    respond_to do |format|
      format.html { redirect_to @pagedirect, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
    
  end
  #around_filter :catch_not_found
  private

  def catch_not_found
  yield
  rescue ActiveRecord::RecordNotFound
  redirect_to root_url, :flash => { :error => "Record not found." }
  end

  def get_author
  	@redirect_to = posts_path
  	@redirect_to=@student = Student.find_by_id(params[:sid]) if params[:sid]
  	@redirect_to=@teacher = Teacher.find_by_id(params[:tid]) if params[:tid]

  end
  def set_author
    @author = Student.find_by_id(params[:post][:hidden_sid]) if params[:post][:hidden_sid].present? 
    @author = Teacher.find_by_id(params[:post][:hidden_tid]) if params[:post][:hidden_tid].present?  
  end

  def post_params
  	params.require(:post).permit(:title,:body)
  end
end
