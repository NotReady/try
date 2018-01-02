# リソースベースのコントローラ
class MembersController < ApplicationController
  def index
    @members = Member.order("number") #=> 昇順でレコードを取り出す
  end

  def show
    @member = Member.find(params[:id])
  end
 
  def new
    @member = Member.new(birthday: Date.new(1080, 1, 1))
  end

  def edit
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to @member, notice: "会員を登録しました。";
    else    
      render "new"
    end
  end

  def update
  end

  def destroy
  end

  def search
    @members = Member.search(params[:q])
    render "index"
  end
end
