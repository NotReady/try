class Book
  attr_reader :title, :author, :price

  def initialize(title, author, price)
    @title = title
    @author = author
    @price = price
  end

end

book = Book.new("タイトル", "大橋正明", 1000)
puts "#{book.title}, #{book.author}, #{book.price}円"
