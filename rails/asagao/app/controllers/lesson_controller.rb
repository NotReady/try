class LessonController < ApplicationController
  # アクションコールバックの基礎
  before_action :set_message, only: :step7

  # 基礎
  def step1
    render text: "こんにちは、#{params[:name]}さん"
  end

  # パラメタの取り出し
  def step2
    render text: "#{params[:controller]}##{params[:action]}"
  end

  # リダイレクトの基礎 step3=>step4
  def step3
    redirect_to action: "step4"
  end

  def step4
    render text: "step4に遷移しました。"
  end

  # フラッシュの基礎
  def step5
    flash[:notice] = "step6に移動します。"
    redirect_to action: "step6"
  end

  def step6
    render text: flash[:notice]
  end

  # アクションコールバッグと連携
  def step7
     render text: @message
  end

  # アクションコールバック
  private
  def set_message
    @message = "こんにちは"
  end

  # テンプレートの基礎
  public 
  def step8
    @price = (2_000*1.05).floor
  end
  
  # 異なるアクションのテンプレートでレンダリング
  def step9
    @price = 1_000
    render "step8"
  end

  # クロスサイトスクリプティングの基礎
  def step10
    @comment = "<script>alert('危険')</script>こんにちは。"
  end

  # クロスサイトスクリプティングの基礎
  def step11
    @comment = "<strong>安全なHTML</strong>"
  end

  # 書式の基礎
  def step12
    @population = 19999
    @surface = 111.22
  end

  # 時間の書式化
  def step13
    @time = Time.now
  end

  # 数値をカンマ区切りで
  def step14
    @population = 123_456_789
  end

  # ヘルパーモジュール使う
  def step15
    @message = "一行目改行コード\n２行目"
  end

  # 条件分岐
  def step18
    @zaiko = 10
  end

  # 繰り返し
  def step19
    @items = {"フライパン" => 100, "ワイングラス" => 200,
              "スプーン" => 300, "フォーク" => 400}
  end
end
