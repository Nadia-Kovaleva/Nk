N = int(input('Введите N: '))

i = 0     #текущее число  
j = 0     #количество выведенных чисел

while j < N:
    d = 10
    k = 1    #k-количество разрядов текущего числа
    while i // d != 0:
        k += 1
        d *= 10
    if i % k == 0 and i != 0:
        print(i)
        j += 1
    i += 1