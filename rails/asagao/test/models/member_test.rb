require 'test_helper'
require 'factory_girl_rails'

class MemberTest < ActiveSupport::TestCase
  test 'factory girl' do
    member = FactoryGirl.create(:member)
    assert_equal 'Yamada Taro', member.full_name
  end
end
