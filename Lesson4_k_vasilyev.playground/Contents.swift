import UIKit

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum EngineState {
    case run, stop
}

enum WindowsState {
    case open, close
}

enum SportMode {
    case on, off
}

enum FoldSeats {
    case fold, unfold
}


class Car {
    let brand:String
    let model:String
    let yearMade:Int
    var mileage:Int
    let color:UIColor
    var engineState:EngineState
    var windowsState:WindowsState
    
    init(brand: String, model: String, yearMade: Int, mileage:Int, color:UIColor, engine: EngineState, windows:WindowsState) {
        self.brand = brand
        self.model = model
        self.yearMade = yearMade
        self.mileage = mileage
        self.color = color
        self.engineState = engine
        self.windowsState = windows
    }
    
    func engineRun() {
        engineState = .run
        print("Двигатель запущен.")
    }
    func engineStop(){
        engineState = .stop
        print("Двигатель заглушен.")
    }
    
    func openWindows() {
        windowsState = .open
        print("Окна открыты.")
    }
    func closedWindows(){
        windowsState = .close
        print("Окна закрыты.")
    }
    
}

class Trunkcar:Car {
    var foldSeats:FoldSeats
    
    init(brand: String, model: String, yearMade: Int, mileage:Int, color:UIColor, engine: EngineState, windows:WindowsState, foldSeats: FoldSeats) {
        self.foldSeats = foldSeats
        super.init(brand: brand, model: model, yearMade: yearMade, mileage: mileage, color: color, engine: engine, windows: windows)
    }
    
    func seatsDown() {
        foldSeats = .fold
        print("Кресла сложены.")
    }
    
    func seatsUp() {
        foldSeats = .unfold
        print("Кресла разложены.")
    }
}

class Sportcar:Car {
    var sportMode:SportMode
    init(brand: String, model: String, yearMade: Int, mileage: Int, color: UIColor, engine: EngineState, windows: WindowsState, sportMode: SportMode) {
        self.sportMode = sportMode
        super.init(brand: brand, model: model, yearMade: yearMade, mileage: mileage, color: color, engine: engine, windows: windows)
    }
    
    func sportOn() {
        sportMode = .on
        print ("Спортивный режим включен.")
    }
    
    func sportOff() {
        sportMode = .off
        print("Спортивный режим выключен.")
    }
    
}

let car1 = Sportcar(brand: "Porsche", model: "911", yearMade: 2018, mileage: 3456, color: .red, engine: .run, windows: .close, sportMode: .on)

let car2 = Sportcar(brand: "Audi", model: "R8", yearMade: 2016, mileage: 6543, color: .black, engine: .stop, windows: .open, sportMode: .off)

let car3 = Trunkcar(brand:  "Volkswagen", model: "Transporter", yearMade: 2010, mileage: 67485, color: .green, engine: .run, windows: .close, foldSeats: .fold)

let car4 = Trunkcar(brand: "GAZ", model: "Gazelle", yearMade: 2012, mileage: 43782, color: .yellow, engine: .run, windows: .open, foldSeats: .unfold)

print(car1.model)
print(car2.sportMode)
print(car3.brand)
print(car4.mileage)



