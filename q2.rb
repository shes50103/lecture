require 'csv'
require 'bundler/inline'
gemfile true do
 source 'http://rubygems.org'
 gem 'tty-table'
end

csv = CSV.read('data.csv', headers: true)
# Q2: 離開Austin動物中心後，回歸至飼主家(outcome_type)的小狗，以何種品種居多？

# 塞選
data_csv = csv.select{|row| row['outcome_type']=="Return to Owner" }

# 分類
data_hash = data_csv.group_by{|row| row["breed"]}

data_array = data_hash.map{|col| [col[0], col[1].count]}

# 排序
table = TTY::Table.new ['品種','數量'], data_array.sort_by{|key, value| value}.reverse
# 印出
puts table.render(:ascii)
