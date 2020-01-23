require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Book Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match /Ruby 2.5/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Book Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match /Ruby 2.5/, mail.body.encoded
  end

end
