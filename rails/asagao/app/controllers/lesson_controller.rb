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
end
