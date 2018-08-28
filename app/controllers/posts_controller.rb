class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @poke_json = ActiveSupport::JSON.decode(File.read('pokemon_data.json'))
    @poke_name = []
    @poke_json.each do |result|
      @poke_name.push([result["name"], result["no"]])
    end
  end

  def create
    @post = current_user.posts.build(params_post)
    if @post.save
      flash[:success] = 'パーティを作成しました！'
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @poke_json = ActiveSupport::JSON.decode(File.read('pokemon_data.json'))
    @poke_name = []
    @poke_json.each do |result|
      @poke_name.push([result["name"], result["no"]])
    end

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params_post)
      flash[:success] = 'パーティを更新しました！'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @interview.destroy
    flash[:info] = '削除しました'
    redirect_to user_interviews_path
  end

  private

  def params_post
    params.require(:post).permit(:title, :game, :party1, :party2, :party3, :party4, :party5, :party6, :comment)
  end
end
