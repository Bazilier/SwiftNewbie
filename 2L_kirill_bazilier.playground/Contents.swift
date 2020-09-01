import UIKit

// 1. Написать функцию, которая определяет, четное число или нет.

func evenNumber(number: Int) -> Bool {
    
   if (number%2) == 0 {return true}
    
   return false
}

// Просто оставлю здесь строковый вариант
// func evenNumber(number: Int) -> String {
//   if (number%2) == 0 {return "чётное"}
//   return "нечётное"
//}

evenNumber(number: 97)

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func multipleThree (number2: Int) -> Bool {
    
    if (number2%3) == 0 {return true}
    
    return false
}

multipleThree(number2: 100)

// 3. Создать возрастающий массив из 100 чисел.

var hundredArray: Array<Int> = []

    for count in 1...100 {
        
    hundredArray.append(count)
}

print(hundredArray)

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var filterEvenEtc = hundredArray.filter {$0 % 2 != 0 && $0 % 3 == 0}

print(filterEvenEtc)

// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.

    // 1 версия

func fibonacciSequence (_ n: Int) -> [Decimal]  {

    var fibonacciArray = [Decimal]()
    for n in 0 ... n {
        if n == 0 {
            fibonacciArray.append(0)
        }
        else if n == 1 {
            fibonacciArray.append(1)
        }
        else {
            fibonacciArray.append (fibonacciArray[n-1] + fibonacciArray[n-2] )
        }
    }
    return fibonacciArray
}

print(fibonacciSequence(100))

    // 2 версия

func fibArray(_ n: Int) -> [Decimal] {

    var fib: [Decimal] = [0, 1]
    (2...n).forEach{ i in
        fib.append(fib[i - 1] + fib[i - 2])
    }
    return fib
}
print(fibArray(100))

// * 6 Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.

func primeNums(arrayPassed: [Int]) -> [Int] {
    var primes: [Int] = []
    var newArr = arrayPassed
    while let newP = newArr.first {
        primes.append(newP)
        newArr = newArr.filter { $0 % newP != 0 }
    }
    return primes
}
print(primeNums(arrayPassed: Array(2...100)))
