Rails.application.routes.draw do

  # ルートのルーティング
  # root('Controller#Action')
  root "top#index"  

  # GETメソッドによる/aboutのルーティング
  # get(パス => "Controller#Action", as: "ルーティング名")
  # /aboutのアクセス⇒ TopController.aboutの関連と、abount_pathメソッド⇒/aboutパスの取得
  get "about" => "top#about", as: "about" 

end
