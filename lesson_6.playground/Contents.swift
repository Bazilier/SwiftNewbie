import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов) (например, сортируемый результат Queue)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

extension Queue:CustomStringConvertible {
    
}

struct Queue<T> {
  
  private var elements:[T] = []

  var head: T? {
    return elements.first
  }

  var tail: T? {
    return elements.last
  }
    
    subscript(index: Int) -> T? {
        guard index < elements.count || index > 0 else {
            return nil
        }
        return elements[index]
    }
  
  mutating func enqueue(_ element: T) {
    elements.append(element)
  }
  
  mutating func dequeue() -> T? {
    guard !elements.isEmpty else {
      return nil
    }
    return elements.removeFirst()
  }

  func filtered(predicate:(T) -> Bool) -> [T] {
    var result: [T] = []
    for element in elements {
      if predicate(element) {
          result.append(element)
      }
    }
    return result
  }
  
    var description: String {
        var description = ""
        for element in elements {
        description += "\(element) "
        }
        return description
    }
}

func testQueue() {
    
    var intQueue = Queue<Int>()
    let intsArray = [1,2,3,4,5,6,7,8,9,10]
    intsArray.forEach { intQueue.enqueue($0) }
    
    let result = intQueue.filtered { (value) -> Bool in
        return value%2 == 0
    }
    
    if let value = intQueue[1] {
        print(value)
    } else {
        print("No value")
    }
    
    print(result)
}

testQueue()
