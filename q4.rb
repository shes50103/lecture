require 'csv'
require 'bundler/inline'
gemfile true do
 source 'http://rubygems.org'
 gem 'tty-table'
end

csv = CSV.read('data.csv', headers: true)
# Q4: 在Austin動物中心收留時已達5歲(含)以上的小狗，留置在動物中心超過2天者，數量合計為多少？哪一種品種最多？

# 塞選
data_csv = csv.select{|row| row['age_upon_intake_(years)'].to_i >= 5 && row['time_in_shelter_days'].to_i>2 }
puts '總數', data_csv.count

# 分類
data_hash = data_csv.group_by{|row| row["breed"]}

data_array = data_hash.map{|col| [col[0], col[1].count]}

# 排序
table = TTY::Table.new ['品種','數量'], data_array.sort_by{|key, value| value}.reverse

# 印出
puts table.render(:ascii)
