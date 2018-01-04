require 'test_helper'
require 'factory_girl_rails'

class ArticleTest < ActiveSupport::TestCase
  # 空の値のチェック
  test 'presence' do
    article = Article.new
    puts 'test'
    p article
    assert article.invalid?
    assert article.errors.include?(:title)
    assert article.errors.include?(:body)
    assert article.errors.include?(:released_at)
  end

  # 長さのチェック
  test 'length' do
    article = FactoryGirl.build(:article)
    article.title = "A" * 201
    assert article.invalid?
    assert article.errors.include?(:title)
  end

  # 掲載終了日時は掲載開始日時よりあと
  test 'expired_at' do
    article = FactoryGirl.build(:article)
    article.released_at = Time.current
    article.expired_at = 1.days.ago
    assert article.invalid?
    assert article.errors.include?(:expired_at)
  end

  # no_expirationがオンならexpired_atを使わない
  test 'no_expiration' do
    article = FactoryGirl.build(:article)
    article.no_expiration = true
    assert article.valid?
    assert_nil article.expired_at
  end
end
