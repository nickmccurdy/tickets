require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test 'should render a navbar link (smoke test)' do
    assert_not_nil navbar_link 'Example', 'http://example.com'
    assert_not_nil navbar_link 'Example', 'http://example.com', 'home'
  end

  test 'should render an attribute (smoke test)' do
    assert_not_nil show_attribute 'Name', 'Value'
  end

end
