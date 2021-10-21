import UIKit

public protocol Car {
    var brand: String { get set }
    var name: String { get set }
}

extension Car {

    func completeName() -> String {
        return "\(brand) \(name)"
    }

    func accelerate() -> String {
        return "The \(self.completeName()) is accelerating"
    }

    func breakk() -> String {
        return "The \(self.completeName()) is braking"
    }

    func turnLeft() -> String {
        return "The \(self.completeName()) is turning to the left"
    }

    func turnRight() -> String {
        return "The \(self.completeName()) is turning to the right"
    }
}

public class Tiguan: Car {
    public var brand: String
    public var name: String
    
    init(brand: String, name: String) {
        self.brand = brand
        self.name = name
    }
}

public class Jetta: Car {
    public var brand: String
    public var name: String
    
    init(brand: String, name: String) {
        self.brand = brand
        self.name = name
    }
}

public class Golf: Car {
    public var brand: String
    public var name: String
    
    init(brand: String, name: String) {
        self.brand = brand
        self.name = name
    }
}

public class CarFactory {
    
    enum ECar {
        case tiguan
        case jetta
        case golf
    }
    
    func createCar(type: ECar) -> Car {
        switch type {
        case .tiguan:
            return Tiguan(brand: "Volkswagen", name: "Tiguan")
        case .jetta:
            return Jetta(brand: "Volkswagen", name: "Jetta")
        case .golf:
            return Golf(brand: "Volkswagen", name: "Golf")
        }
    }
}

public class Client {
    var carFactory: CarFactory
    
    var cars: [Car] = []
    
    init(carFactory: CarFactory) {
        self.carFactory = carFactory
    }
    
    func createGarage()  {
        self.cars.append(self.carFactory.createCar(type: .tiguan))
        self.cars.append(self.carFactory.createCar(type: .jetta))
        self.cars.append(self.carFactory.createCar(type: .golf))
    }
    
    func showGarage() -> String {
        var returnValue: String = "The client has"
        self.cars.forEach { car in
            returnValue += " \(car.completeName())"
        }
        
        return returnValue
    }
}

var client: Client = Client(carFactory: CarFactory())

client.createGarage()
client.showGarage()
