require 'rails_helper'

RSpec.feature "Visitor clicks on 'Add to Cart' button", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    # 10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    # end
  end

  scenario "Cart quantity goes up by one" do
    visit root_path
    click_on 'Add'
    page.has_content?('My Cart (1)')
    save_screenshot
  end
end
