# filepath: test/mailers/order_mailer_test.rb
require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "shipped" do
    order = orders(:one) 

    mail = OrderMailer.shipped(order)

    assert_equal 'Pragmatic Store Order Shipped', mail.subject
    assert_equal [order.email], mail.to
    assert_equal ['depot@example.org'], mail.from
    assert_match %r(
      <td[^>]*>1<\/td>\s*
      <td>&times;<\/td>\s*
      <td[^>]*>\s*Programming\sRuby\s1.9\s*<\/td>
    )x, mail.html_part.body.to_s
  end
end