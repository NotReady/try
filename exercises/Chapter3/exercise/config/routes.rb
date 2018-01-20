Rails.application.routes.draw do
  get 'books/index'

  get "Chapter3" => "chapter3controller#index" 
  get "top" => "chapter3controller#top", as: "top"
end
