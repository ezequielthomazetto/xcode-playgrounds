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

public protocol SUVCar: Car {}
public protocol SedanCar: Car {}
public protocol HatchbackCar: Car {}

public class Tiguan: SUVCar {
    public var brand: String
    public var name: String
    
    init(brand: String, name: String) {
        self.brand = brand
        self.name = name
    }
}

public class HRV: SUVCar {
    public var brand: String
    public var name: String
    
    init(brand: String, name: String) {
        self.brand = brand
        self.name = name
    }
}

public class Rav4: SUVCar {
    public var brand: String
    public var name: String
    
    init(brand: String, name: String) {
        self.brand = brand
        self.name = name
    }
}

public class Jetta: SedanCar {
    public var brand: String
    public var name: String
    
    init(brand: String, name: String) {
        self.brand = brand
        self.name = name
    }
}

public class Civic: SedanCar {
    public var brand: String
    public var name: String
    
    init(brand: String, name: String) {
        self.brand = brand
        self.name = name
    }
}

public class Corolla: SedanCar {
    public var brand: String
    public var name: String
    
    init(brand: String, name: String) {
        self.brand = brand
        self.name = name
    }
}

public class Golf: HatchbackCar {
    public var brand: String
    public var name: String
    
    init(brand: String, name: String) {
        self.brand = brand
        self.name = name
    }
}

public class Fit: HatchbackCar {
    public var brand: String
    public var name: String
    
    init(brand: String, name: String) {
        self.brand = brand
        self.name = name
    }
}

public class Yaris: HatchbackCar {
    public var brand: String
    public var name: String
    
    init(brand: String, name: String) {
        self.brand = brand
        self.name = name
    }
}

public protocol CarFactory {
    
    func createSUV() -> SUVCar
    func createSedan() -> SedanCar
    func createHatchback() -> HatchbackCar
    
}

public class ToyotaCarFactory: CarFactory {
    let brand: String = "Toyota"
    
    public func createSUV() -> SUVCar {
        return Rav4(brand: self.brand, name: "Rav-4")
    }
    
    public func createSedan() -> SedanCar {
        return Corolla(brand: self.brand, name: "Corolla")
    }
    
    public func createHatchback() -> HatchbackCar {
        return Yaris(brand: self.brand, name: "Yaris")
    }
}

public class HondaCarFactory: CarFactory {
    let brand: String = "Honda"
    
    public func createSUV() -> SUVCar {
        return HRV(brand: self.brand, name: "HR-V")
    }
    
    public func createSedan() -> SedanCar {
        return Civic(brand: self.brand, name: "Civic")
    }
    
    public func createHatchback() -> HatchbackCar {
        return Fit(brand: self.brand, name: "Fit")
    }
}

public class VolkswagenCarFactory: CarFactory {
    let brand: String = "Volkswagen"
    
    public func createSUV() -> SUVCar {
        return Tiguan(brand: self.brand, name: "Tiguan")
    }
    
    public func createSedan() -> SedanCar {
        return Jetta(brand: self.brand, name: "Jetta")
    }
    
    public func createHatchback() -> HatchbackCar {
        return Golf(brand: self.brand, name: "Golf")
    }
}

public class Client {
    var abstractCarFactory: CarFactory
    
    var cars: [Car] = []
    
    init(carFactory: CarFactory) {
        self.abstractCarFactory = carFactory
    }
    
    func createGarage()  {
        self.cars.append(self.abstractCarFactory.createSUV())
        self.cars.append(self.abstractCarFactory.createSedan())
        self.cars.append(self.abstractCarFactory.createHatchback())
    }
    
    func showGarage() -> String {
        var returnValue: String = "The client has"
        self.cars.forEach { car in
            returnValue += " \(car.completeName())"
        }
        
        return returnValue
    }
}

var client: Client = Client(carFactory: ToyotaCarFactory())

client.createGarage()
client.showGarage()
