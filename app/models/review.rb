class Review < ApplicationRecord
  belongs_to :product
  before_save(:titleize_author)

  private
  def titleize_author
    self.author = self.author.titleize
  end
end
