begin_sum = float(input('Вклад на какую сумму вы планируете открыть? '))
years = float(input('На сколько лет? '))
percent = float(input('Под какой процент? '))
new_sum = begin_sum + years * begin_sum * percent * 0.01
print ('К моменту окончания вклада на вашем счету будет', new_sum, 'рублей')
