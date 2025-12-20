class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

def index
  @posts = Post.includes(:user, :tags).order(created_at: :desc)

  if params[:tag_id].present?
    @posts = @posts.joins(:tags).where(tags: { id: params[:tag_id] }).distinct
  end
end


  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.turbo_stream
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.turbo_stream
        format.html { redirect_to posts_path, notice: '投稿が更新されました。' }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: "投稿が削除されました。", status: :see_other }
      format.json { head :no_content }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@post) }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :status, tag_ids: [])
  end
end