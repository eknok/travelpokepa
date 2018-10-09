class PostsController < ApplicationController
  # before_action :array
  # before_action :teisgi
  

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @party = @post.party.gsub(" ", "").split(",")
  end

  def new
    @post = Post.new
    # jsonから取ってこなくてもよくね？
    @poke_json = ActiveSupport::JSON.decode(File.read('pokemon_data.json'))
    @poke_names = []
    @poke_json.each do |result|
      @poke_names.push(result["no"])
    end
    @poke_names = [*1..721]
    @party = nil
  end

  def create
    @post = current_user.posts.build(params_post)
    if @post.save
      flash[:success] = 'パーティを作成しました！'
      redirect_to @post
    else
      # jsonから取ってこなくてもよくね？
      @poke_json = ActiveSupport::JSON.decode(File.read('pokemon_data.json'))
      @poke_names = []
      @poke_json.each do |result|
        @poke_names.push(result["no"])
      end
      @party = nil
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  ## QUESTION: jsonから取ってこなくてもよくね？

    @poke_json = ActiveSupport::JSON.decode(File.read('pokemon_data.json'))
    @poke_names = []
    @poke_json.each do |result|
      @poke_names.push(result["no"])
    end
    @party = @post.party.gsub(" ", "").split(",")
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
    params.require(:post).permit(:title, :game, :comment, party:[])
  end

  # befoe_action定義
  def teigi
    @post = Post.find(params[:id])
  end

  def array_party
    @party = @post.party.gsub(" ", "").split(",")
  end

end
