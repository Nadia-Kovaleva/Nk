import math

type_of_figure = input('Choose type of the figure from list:\n1. Rectangle \n2. Square \n3. Triangle \n4. Right triangle \n5. Circle \n6. Rhombus \nAnd enter the number:')
if type_of_figure == '1':
    a = float(input('Enter the length of the rectangle: '))
    b = float(input('Enter the width of the rectangle: '))
    S = a * b
    print ('The area of ​​your figure is equal: ', S)
elif type_of_figure == '2':
    a = int(input('Enter the length of the square: '))
    S = a * a
    print ('The area of ​​your figure is equal: ', S)
elif type_of_figure == '3':
    a = float(input('Enter the length of the triangle: '))
    h = float(input('Enter the height of the triangle: '))
    S = 0.5 * a * h
    print ('The area of ​​your figure is equal: ', S)
elif type_of_figure == '4':
    a = float(input('Enter the length of the right triangle: '))
    b = float(input('Enter the height of the right triangle: '))
    S = 0.5 * a * b
    print ('The area of ​​your figure is equal: ', S)
elif type_of_figure == '5':
    r = float(input('Enter the radius of the circle: '))
    S =  math.pi * r ** 2
    print ('The area of ​​your figure is equal: ', S)
elif type_of_figure == '6':
    a = float(input('Enter the length of the rhombus: '))
    h = float(input('Enter the height of the rhombus: '))
    S = a * h
    print ('The area of ​​your figure is equal: ', S)

else:
    print('Stupid man, you definitely didn’t enter a number from 1 to 6! Just do it and I will calculate the area of ​​your figure.')

