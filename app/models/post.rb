class Post < ApplicationRecord
  belongs_to :user
  enum game: { red_green: 0, gold_silver: 1, ruby_sapphire: 2, diamond_pearl: 3, black_white: 4, x_y: 5, sun_moon: 6 }
  validates :title, presence: true
  validates :comment, presence: true
  validate :before_save_party
  validate :check_game

  def before_save_party
    # errors.add(:party, "2対以上は入力してください") if self.party.nil?
    self.party.gsub!(/[\[\]\"]/, "") unless self.party.nil?
  end

  # 世代で判断
  def check_game
  end
end
