require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  test "check routing number" do
    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'

    click_on 'Checkout'

    fill_in 'order_name', with: 'Dave Thomas'
    fill_in 'order_address', with: 'MyText'
    fill_in 'order_email', with: 'dave@exemple.org'

    assert_no_selector "#order_routing_number"

    select 'Check', from: 'pay_type'

    assert_selector "#order_routing_number"
  end

  test "check if button Add to Cart reveal the cart" do
    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'

    page.execute_script("window.confirm = function(msg) { return true; }")

    click_on 'Empty cart'


    assert_selector '#notice', exact_text: 'Your cart is currently empty.'

  end
end
