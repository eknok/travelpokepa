class Post < ApplicationRecord
  belongs_to :user
  enum game: { red_green: 0, gold_silver: 1, ruby_sapphire: 2, diamond_pearl: 3, black_white: 4, x_y: 5, sun_moon: 6 }
  validates :title, presence: true
  validates :comment, presence: true
  validates :party1, presence: true
  validates :party2, presence: true
  validates :party3, presence: true
  validate :check_game

  # 世代で判断
  def check_game
  end
end
