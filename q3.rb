require 'csv'

csv = CSV.read('data.csv', headers: true)
# # Q3: 年邁的小狗與生病的小狗(intake_condition)相較，何者回歸飼主家居多？比例相差多少？

# # 塞選
p data_aged = csv.select{|row| row['intake_condition']=="Aged" && row['outcome_type']=="Return to Owner" }.count
p data_sick = csv.select{|row| row['intake_condition']=="Sick" && row['outcome_type']=="Return to Owner" }.count
