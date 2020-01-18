require 'rails_helper'

describe Review do
  it { should belong_to(:product) }
  it { should validate_presence_of :name }
  it("titleizes the name of the author") do
    review = Review.create({author: "masha", content_body: "good product", rating: 5})
    expect(review.author()).to(eq("Masha"))
  end
end
