require "rails_helper"

RSpec.feature "Visitor navigates from home page to a products page", type: :feature, js: true do

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

  scenario "They see a product's detail upon clicking a product" do
    visit root_path

    expect(page).to have_css "article.product", count: 10

    # choose the first product
    # product = Product.first
    # click on the detail button for that product
    # product.click_link("Details")
    first(".product").click_link("Details")

    # debuggers
    # save_screenshot
    # puts page.html

    # the page it redirects to should have css for products-show and there is only 1 product.
    expect(page).to have_css "section.products-show", count: 1
  end
end
