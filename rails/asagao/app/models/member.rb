class Member < ActiveRecord::Base
  include EmailAddressChecker

  # バリデーションの指定
  # 空文字禁止, 1以上100未満の整数, 重複禁止

  validates :number,			#=> number属性に対して
      presence: true,			#=> 空文字の禁止
      numericality: {			#=> 値のバリデーション
        only_integer: true,		#=> 整数値のみ
        greater_than: 0,		#=> 1以上
        less_than: 100,			#=> 100未満
        allow_blank: true},		#=> 空文字禁止
      uniqueness: true			#=> 重複禁止

  # 空文字禁止、半角英数字のみ、文字列の先頭はアルファベット、2文字以上20文字以下、重複の禁止
  validates :name,  
      presence: true,			#=> 空文字の禁止
    format: {
      with: /\A[A-Za-z]\w*\z/,		#=> 半角英数のみ
      allow_blank: true,                #=> 空文字禁止
      message: :invalid_member_name},	#=> エラーメッセージ 
    length: {
      minimum: 2,			#=> 2文字以上
      maximum: 20,			#=> 20文字以下
      allow_blank: true},		#=> 空文字禁止
    uniqueness: {			#=> 重複禁止
      case_sensitive: false}		#=> 大文字小文字区別無し

  validates :full_name, length: { maximum: 20 }

  # バリデーションメソッドを定義する
  validate :check_email

  private
  def check_email
    if email.present?
      errors.add(:email, :invalid) unless well_formed_as_email_address(email)
    end
  end

  class << self
    def search(query)
      rel = order("number") #=> numberカラムでソートしたリレーションを取得
      if query.present? #=> 入力結果が空ではない
        rel = rel.where("name LIKE ? OR full_name LIKE ?",  #=> プレースホルダ
              "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end
