require "rails_helper"

RSpec.feature "Visitor navigates to home page, and adds item to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg"),
        quantity: 10,
        price: 64.99,
      )
    end
  end

  scenario "A product is added to the cart" do
    visit root_path

    expect(page).to have_css "article.product", count: 10

    # choose the first product
    # click on the add button for that product
    first(".product").click_button("Add")

    # debuggers
    # save_screenshot
    # puts page.html

    # The page should have an updated cart
    expect(page).to have_content("My Cart (1)")
  end
end
