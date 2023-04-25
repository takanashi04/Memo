require "csv" #CSVファイルを扱うためのライブラリ

# 新しいファイルを作成する
def new_memo
  puts "タイトルを入力してください"
  title = gets.chomp
  puts "本文を入力してください / 終了する場合はctrl + Dを押してください"
  content = STDIN.read.chomp
  CSV.open("#{title}.csv","w") do |csv|
    csv << ["#{content}"]
  end
end

# 既存のメモを編集する
def edit_memo
  puts "編集したいタイトルを入力してください"
  title = gets.chomp
  puts "追記する本文を入力してください / 終了する場合はctrl + Dを押してください"
  content = STDIN.read.chomp
  CSV.open("#{title}.csv","a") do |csv|
    csv << ["#{content}"]
  end
end

# 条件分岐
while true
  puts "1→新規でメモを作成する / ２→既存のメモを編集する / 3→メモを終了する"
  memo_type = gets.to_i 
  if memo_type == 1
    puts "新規メモを作成します"
    new_memo
    puts "保存しました"
  elsif memo_type == 2
    puts "既存メモを編集します"
    edit_memo
  elsif memo_type == 3
    puts "メモを終了します"
    break
  else
    puts "半角数字で入力してください"
  end
end
