require 'rails_helper'

describe "the add products process" do
  it "adds a new album" do
    visit products_path
    click_link 'Create new product'
    fill_in 'name', :with => 'toy'
    fill_in 'cost', :with => '5'
    click_on 'Create product'
    expect(page).to have_content 'product successfully added!'
    expect(page).to have_content 'toy'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create new product'
    expect(page).to have_content "name can't be blank"
  end
end
