import UIKit


//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.


enum engineState {
    case run, stop
}

enum windowState {
    case open, close
}

enum trunkState {
    case empty, full
}

struct car {
    let carBrand: String
    var color: String
    mutating func changeColor (c: String) {
        switch c {
        case "white":
            self.color = "white"
        case "black":
            self.color = "black"
        case "red":
            self.color = "red"
        case "blue":
            self.color = "blue"
        default:
            print("Ошибка")
        }
    }
    let yearMade: Int
    
    var trunkVolume: Double {
        willSet {
            if (trunkState == .empty) && (trunkVolume > 0) && (trunkVolume != 0) && (newValue < trunkVolume) {
                let freeSpace = trunkVolume - newValue
                print ("\(carBrand): свободного места в багажнике — \(freeSpace)")
            } else {print("\(carBrand): багажник переполнен.")}
        }
    }
    
    var engineState: engineState {
        willSet {
            if newValue == .run {
                print ("\(carBrand): двигатель запущен.")
            } else {print("\(carBrand): двигатель заглушен.")}
        }
    }
    
    var windowState: windowState {
        willSet {
            if newValue == .open {
                print ("\(carBrand) окна открыты.")
            } else {print("\(carBrand) окна закрыты.")}
        }
    }
    
    var trunkState : trunkState
    mutating func emptyTrunk() {
        self.trunkState = .empty
        print ("\(carBrand): багажник пуст.")
    }
}

struct truck {
    let truckBrand : String
    var color : String
    mutating func changeColor(c:String) {
        switch c {
        case "white":
            self.color = "white"
        case "black":
            self.color = "black"
        case "red":
            self.color = "red"
        case "green":
            self.color = "green"
        default:
            print("Ошибка")
        }
    }
    let yearMade : Int
    var trunkVolume : Double {
        willSet {
            if (trunkState == .empty) && (trunkVolume > 0) && (trunkVolume != 0) && (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print ("\(truckBrand): свободного места в багажнике — \(space)")
            } else { print("\(truckBrand): багажник переполнен.")}
        }
    }
    var engineState : engineState {
        willSet {
            if newValue == .run {
                print ("\(truckBrand): двигатель запущен.")
            } else {print("\(truckBrand): двигатель заглушен.")}
        }
    }
    var windowState : windowState {
        willSet {
            if newValue == .open {
                print("\(truckBrand): окна открыты.")
            } else { print("\(truckBrand): окна закрыты.") }
        }
    }
    var trunkState : trunkState
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(truckBrand): багажник пуст")
    }
}

var car1 = car(carBrand: "Audi",  color: "clear", yearMade: 2016, trunkVolume: 580.0 , engineState: .stop, windowState: .open, trunkState: .empty)
var car2 = car(carBrand: "Toyota",  color: "clear", yearMade: 2017, trunkVolume: 480.0, engineState: .stop, windowState: .close, trunkState: .full)

var truck1 = truck(truckBrand: "Volvo",  color: "clear", yearMade: 2012, trunkVolume: 100000.0, engineState: .run, windowState: .open, trunkState: .full)
var truck2 = truck(truckBrand: "MAZ",  color: "clear", yearMade: 2013, trunkVolume: 150000.0, engineState: .run, windowState: .close, trunkState: .empty)


car1.engineState = .run
car1.trunkVolume = 290.0
car1.changeColor(c: "red")
car2.trunkVolume = 390.0
car2.emptyTrunk()
car2.trunkVolume = 80.9
car2.windowState = .open
car2.changeColor(c: "black")

truck1.engineState = .stop
truck1.windowState = .close
truck2.windowState = .open
truck2.engineState = .stop
truck2.trunkVolume = 5678908
truck2.changeColor(c: "white")
truck2.color
