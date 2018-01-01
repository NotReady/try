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
end
