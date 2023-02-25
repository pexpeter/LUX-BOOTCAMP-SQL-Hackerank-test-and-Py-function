def array_sum(list):
    sum = 0
    for number in list:
        sum += number
    return sum

lst = [25,5,56,5,9,6,9]
print(array_sum(lst))