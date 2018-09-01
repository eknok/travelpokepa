class ToppagesController < ApplicationController
  def index
    @red_green = Post.where(game: "red_green").limit(3)
    @gold_silver = Post.where(game: "gold_silver").limit(3)
    @ruby_sapphire = Post.where(game: "ruby_sapphire").limit(3)
    @diamond_pearl = Post.where(game: "diamond_pearl").limit(3)
    @black_white = Post.where(game: "black_white").limit(3)
    @x_y = Post.where(game: "x_y").limit(3)
    @sun_moon = Post.where(game: "sun_moon").limit(3)
  end

  def show
  end
end
