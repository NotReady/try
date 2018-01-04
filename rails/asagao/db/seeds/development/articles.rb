body = 
"本文1行目本文1行目本文1行目本文1行目本文1行目\n" + 
"本文2行目本文2行目本文2行目本文2行目本文2行目\n" + 
"本文3行目本文3行目本文3行目本文3行目本文3行目\n" +
"本文4行目本文4行目本文4行目本文4行目本文4行目\n"

0.upto(9) do |idx|
  Article.create(
     title: "練習試合の結果${idx}",
     body: body,
     released_at: 8.days.ago.advance(days: idx),
     expired_at: 2.days.ago.advance(days: idx),
     member_only: (idx % 3 == 0)
  )
end
