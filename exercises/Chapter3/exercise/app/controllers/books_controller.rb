class BooksController < ApplicationController
  def index
    @books = Book.order(id: :asc)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
