class Member < ActiveRecord::Base
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
