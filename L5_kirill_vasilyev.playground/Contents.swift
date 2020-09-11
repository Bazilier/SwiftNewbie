import UIKit

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.



protocol CarProtocol:CustomStringConvertible {
    
    var brand: String { get set }
    var model: String { get set }
    var color: UIColor { get set }
    var media: Bool { get set }
    
    func engineStart ()
    func engineStop ()
    func openWindows ()
    func closeWindows ()
}

extension CarProtocol {
    
    func engineStart () {
        print("Двигатель запущен.")
    }
    func engineStop () {
        print("Двигатель остановлен.")
    }
    
    func openWindows () {
        print("Окна открыты.")
    }
    
    func closeWindows () {
        print ("Окна закрыты.")
    }
    
}

extension CarProtocol {
    var description: String {
    return "Автомобиль: \(brand) \(model), наличие мультимедиа – \(media)"
    }
}

class SportCar: CarProtocol {
    
    var brand: String
    var model: String
    var color: UIColor
    var media: Bool
    
    var isSportMode: Bool
    
    init (brand: String, model: String, color: UIColor, media: Bool, isSportMode: Bool) {
        self.brand = brand
        self.model = model
        self.color = color
        self.media = media
        self.isSportMode = isSportMode
    }
    func closeWindows() {
        print("Окна спорткара закрыты.")
    }
    func engineStart() {
        print("Двигатель спорткара запущен.")
    }
}

class TrunkCar: CarProtocol {
    
    var brand: String
    var model: String
    var color: UIColor
    var media: Bool
    
    var trunkVolume = Double()
    
    init (brand: String, model: String, color: UIColor, media: Bool, trunkVolume: Double) {
        self.brand = brand
        self.model = model
        self.color = color
        self.media = media
        self.trunkVolume = trunkVolume
    }
    func closeWindows() {
        print("Окна автоцистерны закрыты.")
    }
    func engineStart() {
        print("Двигатель автоцистерны запущен.")
    }
}

let car1 = SportCar(brand: "Porsche", model: "Panamera", color: .brown, media: true, isSportMode: true)
let car2 = TrunkCar(brand: "Dodge", model: "RAM", color: .black, media: false, trunkVolume: 345)
let car3 = SportCar(brand: "Toyota", model: "Supra", color: .red, media: true, isSportMode: true)

car1.closeWindows()
car2.engineStart()

print(car1)
print(car2)
print(car3)

