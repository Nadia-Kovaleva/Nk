num = float(input('Введите натуральное число: '))
d = 2
while num % d != 0:
    d += 1
if d == num:
    print ('Введенное число - простое.')
else:
    print ('Введенное число - составное.')

