require 'test_helper'
require 'factory_girl_rails'

class ArticlesControllerTest < ActionController::TestCase
  test 'index' do
    5.times { FactoryGirl.create(:article) }
    get :index
    assert_response :success
    assert_equal 5, assigns(:articles).count 
  end
end
