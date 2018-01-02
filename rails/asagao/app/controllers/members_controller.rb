# リソースベースのコントローラ
class MembersController < ApplicationController
  def index
    @members = Member.order("number") #=> 昇順でレコードを取り出す
  end

  def show
  end
 
  def new
  end

  def edit
  end

  def create
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
