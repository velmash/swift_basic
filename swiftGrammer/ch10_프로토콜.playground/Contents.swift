// 프로토콜: 특정 기능이나 속성에 대한 설계도

// 프로퍼티의 명세에는 초기값을 할당하는 대신 읽기 전용/읽고 쓰기에 대한 여부를 get과 set 키워드로 표시해야한다.
// 연산 프로퍼티일 때는 get키워드만으로 읽기 전용 속성으로 설정하거나 get set을 모두 사용하여 읽고 쓸 수 있는 프로퍼티로 설정할 수 있다
// 저장 프로퍼티로 사용하려면 반드시 get과 set키워드를 모두 추가해야 한다.

protocol SomePropertyProtocol {
    var name: String { get set }
    var description: String { get }
}

struct RubyMember: SomePropertyProtocol {
    var name = "홍길동"
    var description: String {
        return "Name : \(self.name)"
    }
}

//MARK: 프로토콜 메소드
protocol SomeMethodProtocol {
    func execute(cmd: String)
    func showPort(p: Int) -> String
}

struct RubyService: SomeMethodProtocol {
    func execute(cmd: String) {
        if cmd == "Start" {
            print("실행합니다.")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p)"
    }
}



protocol NewMethodProtocol {
    mutating func execute(cmd command: String, desc: String)
    func showPort(p: Int, memo desc: String) -> String
}

struct RubyNewService: NewMethodProtocol {
    func execute(cmd command: String, desc: String) {
        if command == "Start" {
            print("\(desc)를 실행합니다.")
        }
    }
    
    func showPort(p: Int, memo desc: String) -> String {
        return "Port : \(p), Memo : \(desc)"
    }
}

// 외부 매개변수명은 프로토콜을 그대로 따라야 하지만 내부 매개변수 명은 임의로 변경가능
struct RubyNewService2: NewMethodProtocol {
    func execute(cmd comm: String, desc d: String) {
        if comm == "Start" {
            print("\(d)를 실행합니다.")
        }
    }
    
    func showPort(p: Int, memo description: String) -> String {
        return "Port : \(p), Memo : \(description)"
    }
}

// 프로토콜에서의 mutating, static 사용
// 일반적으로 프로토콜에서 메소드 선언에 mutating 키워드가 붙지 않는 것은
// 1. 구조체나 열거형 등 값 타입의 객체에서 내부 프로퍼티 값을 변경하기를 원치 않을 때
// 2. 주로 클래스를 대상으로 간주하고 작성된 프로토콜 일때
// 로 해석할 수 있다

protocol MService {
    mutating func execut(cmd: String)
    func showPort(p: Int) -> String
}

struct RubyMService: MService {
    var paramCommand: String?
    
    mutating func execut(cmd: String) {
        self.paramCommand = cmd
        if cmd == "Start" {
            print("실행합니다")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p), now command : \(self.paramCommand!)"
    }
}


// 클래스는 참조 타입의 객체이므로 메소드 내부에서 프로퍼티를 수정하더라고 mutating 키워드를 붙일 필요가 없다.
class RubyThread: MService {
    var paramCommand: String?
    
    func execut(cmd: String) {
        self.paramCommand = cmd
        
        if cmd == "Start" {
            print("실행합니다.")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p), now command : \(self.paramCommand!)"
    }
}

// 프로토콜에서 static 키워드로 선언되었더라도 실제로 클래스에서 구현할 때는 필요에 따라 static이나 class키워드를 선택하여 사용할 수 있다.
// 물론 구조체나 열거형에서 구현할 때는 선택의 여지 없이 static 키워드를 붙여햐 한다
protocol SomeTypeProperty {
    static var defaultValue: String { get set }
    static func getDefaultValue() -> String
}

struct TypeStruct: SomeTypeProperty {
    static var defaultValue = "default"
    
    static func getDefaultValue() -> String {
        return defaultValue
    }
}

class ValueObject: SomeTypeProperty {
    static var defaultValue = "default"
    class func getDefaultValue() -> String {
        return defaultValue
    }
}

//MARK: 프로토콜과 초기화 메소드
// 구현 시 외부 매개변수명까지 완전히 일치해야한다.
// 프로토콜 명세에 선언된 초기화 메소드는 그것이 기본 제공되는 초기화 메소드일지라도 직접 구현해야함
// 클래스에서 초기화 메소드를 구현할 때에는 반드시 required 키워드를 붙여야 한다.

protocol SomeInitProtocol {
    init()
    init(cmd: String)
}

struct SInit: SomeInitProtocol {
    var cmd: String
    
    init() {
        self.cmd = "Start"
    }
    
    init(cmd: String) {
        self.cmd = cmd
    }
}

class CInit: SomeInitProtocol {
    var cmd: String
    
    required init() {
        self.cmd = "start"
    }
    
    required init(cmd: String) {
        self.cmd = cmd
    }
}

// 클래스는 상속과 프로토콜 구현이 동시에 가능하다
// 상속을 통해 초기화 메소드를 물려받았다 할지라도 구현해야 할 프로토콜 명세에 동일한 초기화 메소드가 선언되어 있다면 이를 다시 구현해야 한다.
// 이때에는 초기화 메소드에 required 키워드와 override 키워드를 모두 붙여주어야 한다

// init() 메소드를 가지는 프로토콜
protocol Init {
    init()
}

// init() 메소드를 가지는 부모 클래스
class Parent {
    init() {
    }
}

// 부모클래스의 init() + 프로토콜의 init()
class Child: Parent, Init {
    override required init() {
    }
}

// 프로토콜 구현에는 갯수 제한이 없다. 선언 순서는 상관 없지만 구현해야하는 내용들은 모두 빠짐없이 구현되어야 한다
struct MultiImplement: NewMethodProtocol, SomeInitProtocol {
    var cmd: String
    
    init() {
        self.cmd = "default"
    }
    
    init(cmd: String) {
        self.cmd = cmd
    }
    
    mutating func execute(cmd: String, desc: String) {
        self.cmd = cmd
        if cmd == "start" {
            print("시작합니다.")
        }
    }
    
    func showPort(p: Int, memo desc: String) -> String {
        return "Port : \(p), Memo : \(desc)}"
    }
}

//MARK: 타입으로서의 프로토콜
// 상수나 변수, 그리고 프로퍼티 타입으로 사용할 수 있음
// 함수, 메소드 또는 초기화 구문에서 매개변수 타입이나 반환 타입으로 프로토콜을 사용할 수 있음
// 배열이나 사전, 혹은 다른 컨테이너의 타입으로 사용할 수 있음

protocol Wheel {
    func spin()
    func hold()
}

class Bicycle: Wheel {
    var moveState = false
    
    func spin() {
        self.pedal()
    }
    
    func hold() {
        self.pullBreak()
    }
    
    func pedal() {
        self.moveState = true
    }
    
    func pullBreak() {
        self.moveState = false
    }
}

/*
let trans = Bicycle()
trans.moveState
trans.pedal()
trans.pullBreak()
trans.spin()
trans.hold()
*/

// Wheel 프로토콜을 수현하고 있으므로 상수 trans의 타입 어노테이션에 프로토콜을 사용하여 다음과 같이 Whell 타입 상수에 할당하는거도 가능하다.
let trans: Wheel = Bicycle()
trans.spin()
trans.hold()

// 객체 본래 타입이 아니라 프로토콜 타입으로 선언한 변수나 상수에 할당받아 사용하는 것은 특정 프로토콜을 구현한 모든 클래스나 구조체를 변수나 상수에 할당할 수 있다는 장점이 있다.


protocol A {
    func doA()
}

protocol B {
    func doB()
}

class Impl: A, B {
    func doA() {
        <#code#>
    }
    
    func doB() {
        <#code#>
    }
    func desc() -> String {
        return "Class instance method"
    }
}

var ipl: A & B = Impl()
// ipl.doA()
// ipl.doB()


//MARK:- 델리게이션
// 네가 누군지 난 알 필요 없다. 다만 너는 내가 호출할 메소드를 구현하고 있기만 하면 된다.
// 특정 기능을 다른 객체에 위임하고, 그에 따라 필요한 시점에서 메소드의 호출만 받는 패턴

protocol FuelPumpDelegate {
    func lackFuel()
    func fullFuel()
}

class FuelPump {
    var maxGage: Double = 100.0
    var delegate: FuelPumpDelegate? = nil
    
    var fuelGage: Double {
        didSet {
            if oldValue < 10 {
                // 연료가 부족해지면 델리게이트의 lackFuel 메소드를 호출한다.
                self.delegate?.lackFuel()
            } else if oldValue == self.maxGage {
                // 연료가 가득차면 델리게이트의 fullFuel 메소드를 호출한다.
                self.delegate?.fullFuel()
            }
        }
    }
    
    init(fuelGage: Double = 0) {
        self.fuelGage = fuelGage
    }
    
    // 연료펌프를 가동한다.
    func startPump() {
        while(true) {
            if(self.fuelGage > 0) {
                self.jetFuel()
            } else {
                break
            }
        }
    }
    
    // 연료를 엔진에 분사한다. 분사할 때마다 연료 게이지의 눈금은 내려간다
    func jetFuel() {
        self.fuelGage -= 1
    }
}

class Car: FuelPumpDelegate {
    var fuelPump = FuelPump(fuelGage: 100)
    
    init() {
        self.fuelPump.delegate = self
    }
    
    // fuelPump가 호출하는 메소드 입니다.
    func lackFuel() {
        // 연료를 보충한다.
    }
    
    func fullFuel() {
        // 연료 보충을 중단한다.
    }
    
    func start() {
        fuelPump.startPump()
    }
}

//MARK:- 프로토콜의 활용
//MAKR: 확장 구문과 프로토콜
// 익스텐션에서 프로토콜을 구현한다면 이후로 해당 객체는 프로토콜을 구현한 것으로 처리된다

class Man {
    var name: String?
    
    init(name: String = "홍길동") {
        self.name = name
    }
}

protocol Job {
    func doWork()
}

extension Man: Job {
    func doWork() {
        print("\(self.name!)님이 일을 합니다.")
    }
}

let man = Man(name: "개발자")
man.doWork()

//MARK: 프로토콜의 상속
// 프로토콜은 클래스처럼 상속을 통해 정의된 프로퍼티나 메소드, 그리고 초기화 블록의 선언을 다른 프로토콜에게 물려줄 수 있다.
// 다중 상속이 가능하다

// 앞에 작성한 프로토콜 A, B
protocol C: A, B {
    func doC()
}

// 프로토콜 A,B,C의 명세를 모두 구현해야함
class ABC: C {
    func doA() {
    }
    func doB() {
    }
    func doC() {
    }
}

// 다음과 같은 타입의 변수/상수에 할당될 수 있다
let abc: C = ABC() // abc.doA(), abc.doB(), abc.doC()
let a: A = ABC() // a.doA()
let ab: A & B = ABC() // ab.doA(), ab.doB()
let abc2: A & B & C = ABC() // abc2.doA(), abc2.doB(), abc2.doC()

// 클래스 ABC는 이와 마찬가지로 다음 타입으로 선언된 함수나 메소드의 인자값으로 할당될 수도 있다.
func foo(abc: C) { }
foo(abc: ABC())

func boo(abc: A & B) { }
boo(abc: ABC())


// 다운 캐스팅
protocol Machine {
    func join()
}

protocol Wheel2: Machine {
    func lotate()
    
    init(name: String, currentSpeed: Double)
}

class Vehicle {
    var currentSpeed = 0.0
    var name = ""
    
    init(name: String, currentSpeed: Double) {
        self.name = name
        self.currentSpeed = currentSpeed
    }
}

class Car2: Vehicle, Wheel2 {
    required override init(name: String, currentSpeed: Double = 0.0) {
        super.init(name: name, currentSpeed: currentSpeed)
    }
    
    func join() {
        // join parts
    }
    
    func lotate() {
        print("\(self.name)의 바퀴가 회전합니다.")
    }
}

class Carpet: Vehicle, Machine {
    func join() {
        // join parts
    }
}

var translist = [Vehicle]()
translist.append(Car2(name: "자동차", currentSpeed: 10.0))
translist.append(Carpet(name: "양탄자", currentSpeed: 15.0))

for trans in translist {
    if let obj = trans as? Wheel2 {
        obj.lotate()
    } else {
        print("\(trans.name)의 하위 타입 변환이 실패했습니다.")
    }
}

//MARK: 클래스 전용 프로토콜
// 클래스만 구현할 수 있도록 제한된 프로토콜을 정의해야 할 때가 있다.
// 프로토콜 정의 시 class zldnjemfmf tkdydgksek

protocol SomeClassOnlyProtocol: class {
    // 클래스에서 구현할 내용 작성
}

// 클래스 전용 프로토콜에서는 메소드를 정의할 때 mutating 키워드를 붙일 수 없다.
// 만약 프로토콜이 다른 프로토콜을 상속받는다면, 상속된 프로토콜 이름을 나열하기 전에 맨 먼저 클래스 전용임을 표시해야한다

protocol SomeClassOnlyProtocol2: class, Wheel2, Machine {
    // 클래스에서 구현할 내용 작성
}

//MARK: optional
// 프로토콜을 구현할 때는 기본적으로 프로토콜의 명세에 포함된 모든 프로퍼티와 메소드, 그리고 초기화 구문을 구현해야 한다.
// 하지만 객체에 따라 특별히 필요하지 않은 프로퍼티나 메소드, 초기화 구문이 있을 수 있다
// 모두 구현해야한다면 상당히 번거로워지고 무의미한 코드도 늘어난다. 이런 상황을 방지하기 위한 해법이 바로 선택적 요청(optioanl requirement)이라고 불리는 문법이다
// 프로토콜 앞에 @objc를 표시해야한다, 오로지 클래스만 이 프로토콜을 구현할 수 있다
import Foundation

@objc
protocol MsgDelegate {
    @objc optional func onRecive(new: Int)
}

class MsgCenter {
    var delegate: MsgDelegate?
    var newMsg: Int = 0
    
    func msgCheck() {
        if newMsg > 0 { // 새로운 메시지가 도착했다면
            self.delegate?.onRecive?(new: self.newMsg)
            self.newMsg = 0
        }
    }
}

class Watch: MsgDelegate {
    var msgCenter: MsgCenter?
    
    init(msgCenter: MsgCenter) {
        self.msgCenter = msgCenter
    }
    
    func onRecive(new: Int) {
        print("\(new) 건의 메시지가 도착했습니다.")
    }
}
