A = float(input('Введите А: '))
B = float(input('Введите B: '))
C = float(input('Введите C: '))
D = B ** 2 - 4 * A * C
X1 = (-B - pow(D, .5))/(2 * A)
X2 = (-B + pow(D, .5))/(2 * A)
print('Уравнение имеет корни:' 'X1 = ', X1, ', X2 = ', X2)

