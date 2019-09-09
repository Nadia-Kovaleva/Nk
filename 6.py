num = int(input('Введите натуральное число: '))
sum_ = 0
product = 1
while num > 0:
    if num % 10 != 0:
        sum_ = sum_ + num % 10
        product = product * (num % 10)
        num = num // 10
    
print(' Сумма цифр равна',sum_,'\n','Произведение цифр равно',product)
