class Review < ApplicationRecord
  belongs_to :product
  before_save(:titleize_album)

private
  def titleize_album
    self.author = self.author.titleize
  end
end
