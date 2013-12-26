require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test 'should render an attribute (smoke test)' do
    assert_not_nil show_attribute 'Name', 'Value'
  end

end
