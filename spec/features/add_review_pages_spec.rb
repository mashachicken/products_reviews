require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    visit reviews_path
    click_link 'Add a new review'
    fill_in 'author', :with => 'Masha'
    fill_in 'rating', :with => '5'
    fill_in 'content_body', :with => 'Great'
    click_on 'Add a review'
    expect(page).to have_content 'Review successfully added!'
    expect(page).to have_content 'Great'
  end

  it "gives an error when no name is entered" do
    visit new_review_path
    click_on 'Add a new review'
    expect(page).to have_content "Fields can't be blank"
  end
end
