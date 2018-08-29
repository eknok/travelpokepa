class ToppagesController < ApplicationController
  def index
    @red_green = Post.where(game: "red_green").limit(5)
    @gold_silver = Post.where(game: "gold_silver").limit(5)
    @ruby_sapphire = Post.where(game: "ruby_sapphire").limit(5)
    @diamond_pearl = Post.where(game: "diamond_pearl").limit(5)
    @black_white = Post.where(game: "black_white").limit(5)
    @x_y = Post.where(game: "x_y").limit(5)
    @sun_moon = Post.where(game: "sun_moon").limit(5)
  end

  def show
  end
end
