// 구조체 정의 예시
struct ex_Resolution {
    // 여기에 구조체의 내용이 작성됩니다.
}

// 클래스 정의 예시
class ex_VideoMode {
    // 여기에 클래스의 내용이 작성됩니다.
}

//MARK: 메소드와 프로퍼티
// 프로퍼티(속성) : 구조체와 클래스 내부에서 정의된 변수나 상수
// 메소드 : 구조체와 클래스 내부에서 정의된 함수

// 프로퍼티와 메소드가 정의된 구조체와 클래스
struct Resolution {
    var width = 0
    var height = 0
    
    func desc() -> String {
        return "Resolution 구조체"
    }
}

class VideoMode {
    var interlaced = false
    var frameRate = 0.0
    var name : String?
    
    var res = Resolution()
    
    func desc() -> String {
        return "VideoMode 클래스"
    }
}

//MARK: 인스턴스
// 인스턴스 : 타입의 설계도를 사용하여 메모리 공간을 할당받은 것 (실질적인 값을 담을 수 있는 것)

// Resolution 구조체에 대한 인스턴스를 생성하고 상수 insRes에 할당
let insRes = Resolution()

// VideoMode 구조체에 대한 인스턴스를 생성하고 상수 insVMode에 할당
let insVMode = VideoMode()

let width = insRes.width
print("insRes 인스턴스의 width 값은 \(width)입니다.")

print("vMode 인스턴스의 width값은 \(insVMode.res.width)입니다.")

// 점 구문을 이용하여 인스턴스의 프로퍼티에 값을 할당
insVMode.name = "Sample"
insVMode.res.width = 1280
print("\(insVMode.name!) 인스턴스의 width 값은 \(insVMode.res.width)입니다")

//MARK: 초기화
// 구조체는 모든 프로퍼티의 값을 인자값으로 입력받아 초기화하는 기본 초기화 구문을 자동으로 제공한다 (멤버와이즈 초기화 구문)
let defaultRes = Resolution(width: 1024, height: 768)
print("width:\(defaultRes.width), height:\(defaultRes.height)")


//MARK:- 프로퍼티
// 인스턴스를 생성한 다음 이 인스턴스를 통해서 프로퍼티를 참조하거나 값을 할당한다. 이렇게 인스턴스에 소속되는 프로퍼티를 인스턴스 프로퍼티라고한다
// 예외적으로 일부 프로퍼티는 클래스와 구조체 자체에 소속되어 값을 가지기도 한다. 이런 프로퍼티를 타입 프로퍼티라고 한다. (인스턴스를 생성하지 않아도 사용 가능)

//MARK: 저장 프로퍼티
// 클래스 내에서 선언된 변수나 상수를 부르는 이름

// 1.
class User {
    var name: String
    
    init() {
        self.name = ""
    }
}

// 2.
/*
class User {
    var name: String?
}
(또는)
class User {
    var name: String!
}
 
// 3.
class User {
    var name: String = ""
}
*/

// 구조체에서 저장 프로퍼티
// 고정 길이 범위 구조체
struct FixedLengthRange {
    var startValue: Int // 시작값
    let length: Int // 값의 범위
}

// 가변 길이 범위 구조체
struct FlexibleLengthRange {
    let startValue: Int // 시작값
    var length: Int // 값의 범위
}

// 아래 구조체 인스턴스는 정수값 0, 1, 2를 의미한다.
var rangeOfFiexedIntegers = FixedLengthRange(startValue: 0, length: 3)

// 아래처럼 시작값을 변경하면 객체 인스턴스는 정수값 4, 5, 6을 의미하게 된다.
rangeOfFiexedIntegers.startValue = 4

// 아래 구조체 인스턴스는 정수값 0, 1, 2를 의미한다.
var rangeOfFelxibleIntegers = FlexibleLengthRange(startValue: 0, length: 3)

// 아래처럼 범위값을 변경하면 객체 인스턴스는 정수값 0, 1, 2, 3, 4를 의미하게 된다.
rangeOfFelxibleIntegers.length = 5

// 클래스 인스턴스를 상수에 할당하더라도 클래스 내에서 변수로 선언한 저장 프로퍼티는 얼마든지 값 수정 가능

//MARK: 지연 저장 프로퍼티
// lazy 키워드가 붙은 프로퍼티는 선언만 될 뿐 초기화되지 않고 ㅖ속 대기하고 있다가 프로퍼티가 호출되는 순간에 초기화 된다.
class OnCreate {
    init() {
        print("OnCreate!")
    }
}

class LazyTest {
    var base = 0
    lazy var late = OnCreate()
    
    init() {
        print("Lazy Test!")
    }
}

var lz = LazyTest()
lz.late // 이때 late가 초기화된다. 두 번째 호출부터는 처음 초기화된 값을 그대로 사용할 뿐 다시 초기화되지는 않는다.

//MARK: 클로저를 이용한 저장 프로퍼티 초기화
// 클래스나 구조체의 인스턴스가 생성될 때 함께 실행되어 초기값을 반환하고, 이후로는 해당 인스턴스 내에서 재실행되지 않는다. (연산 프로퍼티와 다른점)
class PropertyInit {
    // 저장 프로퍼티 - 인스턴스 생성 시 최초 한 번만 실행
    var value01: String! = {
        print("value01 execute")
        return "value01"
    }()
    
    // 저장 프로퍼티 - 인스턴스 생성 시 최초 한 번만 실행
    let value02: String! = {
        print("value02 execute")
        return "value02"
    }()
    
    // 저장 프로퍼티는 클래스 인스턴스가 생성될 때 자동으로 값을 평가하기 때문에 자칫 클로저를 잘못 구현하면 메모리 자원의 낭비로 이어질 수 있다
    // 호출시에만 초기화하여 메모리 낭비를 해결할 수 있다
    lazy var value03: String! = {
        print("value03 execute")
        return "value03"
    }()
}

let s = PropertyInit()
s.value03

//MARK: 연산 프로퍼티
// 연산 프로퍼티는 다른 프로퍼티에 의존적이거나, 특정 연산을 통해 얻을 수 있는 값을 정의할 때 사용된다.

// 예1) 나이 계산
import Foundation

struct UserInfo {
    // 저장 프로퍼티 : 태어난 연도
    var birth: Int!
    
    // 연산 프로퍼티 : 올해가 몇년도인지 계산
    var thisYear: Int! {
        get {
            let df = DateFormatter()
            df.dateFormat = "yyyy"
            return Int(df.string(from: Date()))
        }
    }
    // 연산 프로퍼티 : 올해 - 태어난 연도 + 1
    var age: Int  {
        get {
            return (self.thisYear - self.birth) + 1
        }
    }
}

let info = UserInfo(birth: 1980)
print(info.age)

// 예2) 사각형의 중심 좌표 계산
/*
struct Rect {
    // 사각형이 위치한 기준 좌표(좌측 상단 기준)
    var originX: Double = 0.0, originY: Double = 0.0
    
    // 가로 세로 길이
    var sizeWidth: Double = 0.0, sizeHeight: Double = 0.0
    
    // 사각형의 X 좌표 중심
    var centerX: Double {
        get {
            return self.originX + (sizeWidth / 2)
        }
        set(newCenterX) {
            originX = newCenterX - (sizeWidth / 2)
        }
    }
    
    // 사각형의 Y 좌표 중심
    var centerY: Double {
        get {
            return self.originY + (sizeHeight / 2)
        }
        set(newCenterY) {
            self.originY = newCenterY - (sizeHeight / 2)
        }
    }
}

var square = Rect(originX: 0.0, originY: 0.0, sizeWidth: 10.0, sizeHeight: 10.0)
print("square.centerX = \(square.centerX), square.centerY = \(square.centerY)")
*/

struct Position {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

struct Rect {
    // 사각형이 위치한 기준 좌표 (좌측 상단 기준)
    var origin = Position()
    //가로 세로 길이
    var size = Size()
    // 사각형의 X 좌표 중심
    var center: Position {
        get {
            let centerX = self.origin.x + (self.size.width / 2)
            let centerY = self.origin.y + (self.size.height / 2)
            return Position(x: centerX, y: centerY)
        }
        set(newCenter) {
            self.origin.x = newCenter.x - (size.width / 2)
            self.origin.y = newCenter.y - (size.height / 2)
        }
    }
}

let p = Position(x: 0.0, y: 0.0)
let s_ = Size(width: 10.0, height: 10.0)

var square = Rect(origin: p, size: s_)
print("square.centerX = \(square.center.x), square.centerY = \(square.center.y)")

// set 구문 활용
square.center = Position(x: 20.0, y: 20.0)
print("square.x = \(square.origin.x), square.y = \(square.origin.y)")


//MARK: 프로퍼티 옵저버
// willSet : 프로퍼티의 값이 변경되기 직전에 호출되는 옵저버 (새로할당되는 값이 매개상수 형태로 전달됨) newValue라는 이름으로 전달
// didSet: 프로퍼티의 값이 변경된 직후에 호출되는 옵저버 (새로할당되는 값이 아닌 기존에 저장되어 있던 값이 전달됨) oldeValue라는 이름으로 전달

struct Job {
    var income: Int = 0 {
        willSet(newIncome) {
            print("이번 달 월급은 \(newIncome) 원입니다.")
        }
        didSet {
            if income > oldValue {
                print("월급이 \(income - oldValue) 원 증가하셨네요. 소득세가 상향조절될 예정입니다.")
            } else {
                print("저런, 월급이 삭감되었군요. 그래도 소득세는 깍아드리지 않아요. 알죠?")
            }
        }
    }
}


//MARK: 타입 프로퍼티
// 클래스나 구조체의 인스턴스에 속하는 값이 아니라 클래스나 구조체 자체에 속하는 값
// 인스턴스가 아무리 많더라도 모든 인스턴스가 하나의 값을 공용으로 사용한다.
// 별도의 인스턴스 생성 없이도 사용 가능

struct Foo {
    // 타입 저장 프로퍼티
    static var sFoo = "구조체 타입 프로퍼티값"
    
    // 타입 연산 프로퍼티
    static var cFoo: Int {
        return 1
    }
}

class Boo {
    // 타입 저장 프로퍼티
    static var sFoo = "클래스 타입 프로퍼티값"
    
    // 타입 연산 프로퍼티
    static var cFoo: Int {
        return 10
    }
    
    // 재정의가 가능한 타입 연산 프로퍼티
    // Boo클래스를 상속받는 하위 클래스에서 재정의할 수 있는 타입 프로퍼티다
    class var oFoo: Int {
        return 100
    }
}

print(Foo.sFoo)
Foo.sFoo = "새로운 값"
print(Foo.sFoo)
print(Boo.sFoo)
print(Boo.cFoo)

//MARK:- 메소드

//MARK: 인스턴스 메소드
// 클래스, 구조체, 또는 열거형과 같은 객체 타입이 만들어내는 인스턴스에 소속된 함수
// 같은 객체 내에서 정의된 다른 인스턴스 메소드나 인스턴스 프로퍼티에 접근할 수 있도록 권한이 부여되고, 해당 메소드가 속한 인스턴스를 통해서만 호출될 수 있다.

struct Resolution2 {
    var width = 0
    var height = 0
    
    // 구조체의 요약된 설명을 리턴해주는 인스턴스 메소드
    func desc() -> String {
        let desc = "이 해상도는 가로 \(self.width) X \(self.height) 로 구성됩니다."
        return desc
    }
}

class VideoMode2 {
    var resolution = Resolution2()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    //클래스의 요약된 설명을 리턴해주는 인스턴스 메소드
    func desc() -> String {
        if self.name != nil {
            let desc = "이\(self.name!)비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
            return desc
        } else {
            let desc = "이 비디오 모드는 \(self.frameRate)의 비율로 표시됩니다."
            return desc
        }
    }
}


class Counter {
    // 카운트를 저장할 프로퍼티
    var count = 0
    
    // 카운트를 1 증가
    func increment() {
        self.count += 1
    }
    // 입력된 값만큼 카운트를 증가
    func incrementBy(amount: Int) {
        self.count += amount
    }
    // 카운트를 0으로 초기화
    func reset() {
        self.count = 0
    }
}

let counter = Counter()
counter.increment()
counter.incrementBy(amount: 5)
counter.reset()

// 구조체나 열거형의 인스턴스 메소드 내부에서 프로퍼티 값을 수정할 때는 반드시 메소드 앞에 'mutating'키워드를 추가해야한다.
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(x deltaX: Double, y deltaY: Double) {
        self.x += deltaX
        self.y += deltaY
    }
}

var point = Point(x: 10.5, y: 12.0)
point.moveByX(x: 3.0, y: 4.5)
print("이제 새로운 좌표는 (\(point.x), \(point.y))입니다.")

//MARK:- 타입 메소드
// 인스턴스를 생성하지 않고도 객체 타입 자체에서 호출할 수 있는 메소드
// 타입 메소드를 사용하여 객체의 값을 변경하면 해당 객체 타입을 사용하는 모든 곳에서 변경된 값이 적용된다

class Foo2 {
    // 타입 메소드 선언
    class func fooTypeMethod() {
        // 타입 메소드의 구현 내용이 여기 들어간다.
    }
}
let f = Foo2()
// 오류 f.fooTypeMethoe()
Foo2.fooTypeMethod()

//MARK:- 상속
// 한 클래스가 다른 클래스에서 정의된 프로퍼티나 메소드를 물려받아 사용하는 것

// 프로퍼티와 메소드를 물려준 클래스는 부모 클래스 = 상위 클래스 = 슈퍼 클래스 = 기본 클래스
// 프로퍼니와 메소드를 물려받은 클래스는 자식 클래스 = 하위 클래스 = 서브 클래스 = 파생 클래스

// 어떤 클래스도 상속받지 않는 클래스 정의 (기본 클래스)
class A {
    var name = "Class A"
    
    var description: String {
        return "This class name is \(self.name)"
    }
    
    func foo() {
        print("\(self.name)'s method foo is called")
    }
}

let a = A()

a.name
a.description
a.foo()

//MARK: 서브 클래싱
// 기존에 있는 클래스를 기반으로 새로운 클래스를 작성하는 과정
// 스위프트에서는 단일 상속만 지원한다
class B: A {
    var prop = "Class B"
    
    func boo() -> String {
        return "Class B prop = \(self.prop)"
    }
}

let b = B()
b.prop
b.boo()
b.name
b.foo()
b.name = "Class C"
b.foo()

// 예제
class Vehicle {
    var currentSpeed = 0.0
    
    var description: String {
        return "시간당 \(self.currentSpeed)의 속도로 이동하고 있습니다."
    }
    
    func makeNoise() {
        // 임의의 교통수단 자체는 경적을 울리는 기능이 필요없습니다.
    }
}

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 20.0
print("자전거: \(bicycle.description)")

class Tandem: Bicycle {
    var passengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.passengers = 2
tandem.currentSpeed = 14.0


//MARK: 오버라이딩
// 자식클래스에서 재정의된 메소드나 프로퍼티는 부모 클래스로부터 물려받은 내용을 덮어쓰게 되는데, 이 과정을 오버라이딩이라고 한다.

class Car: Vehicle {
    var gear = 0
    var engineLevel = 0
    
    override var currentSpeed: Double {
        get {
            return Double(self.engineLevel * 50)
        }
        set {
            // 아무것도 하지 않음
            // currentSpeed가 원래 저장 프로퍼티였으므로 오버라이딩할 때도 읽고 쓰기가 모두 가능하게 해주어야 하므로 set구문은 아무 일을 하지 않아도 반드시 있어야함
        }
    }
    
    override var description: String {
        get {
            return "Car: engineLevel=\(self.engineLevel), so curruntSpeed=\(self.currentSpeed)"
        }
        set {
            print("New value is \(newValue)")
        }
    }
}

let c = Car()

c.engineLevel = 5
c.currentSpeed
c.description = "New Class Car"

print(c.description)

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            self.gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

class Bike: Vehicle {
    override func makeNoise() {
        print("빠라빠라빠라밤")
    }
}

let bk = Bike()
bk.makeNoise()


// 상속받은 부모 클래스의 인스턴스를 참조할때는 super 키워드를 사용한다
// 상위 클래스에서 정의한 메소드나 프로퍼티가 하위 클래스에서 오버라이딩되는 것을 차단할 수 있도록 final 키워드를 제공한다.

//MARK:- 타입 캐스팅
// 자식 클래스는 본래의 타입 대신 부모 클래스 타입으로 선언하여 사용할 수 있다.
class Vehicle2 {
    var currentSpeed = 0.0
    
    func accelerate() {
        self.currentSpeed += 1
    }
}

class Car2: Vehicle2 {
    var gear: Int {
        return Int(self.currentSpeed / 20) + 1
    }
    
    func wiper() {
        // 창을 닦습니다.
    }
}

let trans: Vehicle2 = Car2()

class SUV: Car2 {
    var fourWhell = false
}

let jeep: Vehicle2 = SUV()

// 클래스의 인스턴스를 할당하기 위해서는 해당 변수나 상수가 적어도 인스턴스의 타입과 같거나 또는 그보다 상위 클래스 타입이어야만 한다.

// 하위 클래스 타입 대신 상위 클래스를 타입으로 선언하여 사용하면 주어진 조건을 만족하면서도 훨씬 다양한 객체를 활용할 수 있다.
var list = [SUV]()
list.append(SUV())

var list2 = [Vehicle2]()
list2.append(Vehicle2())
list2.append(Car2())
list2.append(SUV())


//MARK: 타입 비교 연산
// 타입 비교 연산자 "is", 타입이 일치하는지 여부를 비교하고 그 결과를 Bool 형태로 돌려줌
SUV() is SUV
SUV() is Car2
SUV() is Vehicle2

Car2() is Vehicle2
Car2() is SUV

let myCar: Vehicle2 = SUV()

if myCar is SUV {
    print("myCar는 SUV타입입니다.")
} else {
    print("myCar는 SUV타입이 아닙니다.")
}

let newCar: Vehicle2 = Car2()

if newCar is SUV {
    print("newCarsms SUV 타입입니다.")
} else {
    print("newCar는 SUV 타입이 아닙니다.")
}


//MARK: 타입 캐스팅 연산
// let someCar: Vehicle = SUV()
// someCar는 실제로는 SUV 클래스의 인스턴스가 할당되어 있지만, Vehicle타입으로 간주하기 때문에 Vehicle클래스에 선언되지 않은 프로퍼티나 메소드를 사용할 수 없다
// someCar에서 상수를 이용하여 SUV()클래스에 선언된 프로퍼티를 사용하거나 SUV타입을 인자값으로 받는 함수에 사용하려면 "타입 캐스팅(형변환)" 을 사용한다.
// 업 캐스팅 : 하위 클래스 타입을 상위 클래스 타입으로 변환할 때
// 다운 캐스팅 : 상위 클래스 타입을 하위 클래스 타입으로 캐스팅할 때
// 다운 캐스팅 과정에서 오류가 발생하면 nil이 반환된다. 이 같은 결과값을 고려하여 다운캐스팅은 옵셔널 타입을 반환하는 옵셔널 캐스팅과, 반드시 캐스팅에 성공한다는 전제하에 일반 타입으로 반환하는 강제 캐스팅으로 나누어진다. 연산자는 "as"

// 업캐스팅 사용
let anyCar: Car2 = SUV()
let anyVehicle = anyCar as Vehicle2 // 추상화됨, car2에서 사용할수있던 gear프로퍼티와 wiper메소드는 사용할 수 없다

// 다운캐스팅 사용
/*
let anySUV = anyCar as? SUV
if anySUV != nil {
    print("\(anySUV!) 캐스팅이 성공하였습니다.")
}
*/
if let anySUV = anyCar as? SUV {
    print("\(anySUV) 캐스팅이 성공하였습니다.")
}

/*
// 다운 캐스팅이 반드시 성공할 것이라는 확신 -> 강제 캐스팅 구문
let anySUV = anyCar as! SUV
print("\(anySUV) 캐스팅이 성공하였습니다.")
*/

//MARK: Any, AnyObject
// 타입 캐스팅을 수행할 때 일반적으로 상속 관계에 있는 클래스들끼리만 캐스팅할 수 있다.
// 상속 관계에 있지 않은 클래스 간에는 타입 캐스팅할 수 있는 예외가 있는데 Any, AnyObject 타입을 사용할 때다.
// 상속관계가 직접 성립하는것은 아니지만 가장 상위클래스라고 볼 수 있다
var allCar: AnyObject = Car()
allCar = SUV()

func move(_ param: AnyObject) -> AnyObject {
    return param
}
move(Car2())
move(Vehicle2())

var list3 = [AnyObject]()
list3.append(Vehicle2())
list3.append(Car2())
list.append(SUV())

// AnyObject 타입으로 선언된 값은 타입 캐스팅을 통해 구체적인 타입으로 변환할 수 있다. 특성상 항상 다운 캐스팅만 수행함

let obj: AnyObject = SUV()

if let suv = obj as? SUV {
    print("\(suv) 캐스팅이 성공하였습니다.")
}

// Any : 클래스에 국한되지 않고 스위프트에서 제공하는 모든 타입을 허용
var value: Any = "Sample String"
value = 3
value = false
value = [1,3,5,7,9]
value = {
    print("함수가 실행됩니다")
}

func name(_ param: Any) {
    print("\(param)")
}
name(3)
name(false)
name([1,3,5,7,9])
name{
    print(">>>")
}

var rows = [Any]()
rows.append(3)
rows.append(false)
rows.append([1,3,5,7,9])
rows.append{
    print(">>>")
}

//MARK:- 초기화 구문

struct Resolution3 {
    var width = 0
    var height = 0
    
    // 초기화 메소드 : width를 인자값으로 받음
    init(width: Int) {
        self.width = width
    }
}

class VideoMode3 {
    var resolution = Resolution3(width: 2048)
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    // 기본 초기화 구문
    init() {
    }
    
    // 초기화 메소드 : interlaced, frameRate 두 개의 인자값을 받음
    init(interlaced: Bool, frameRate: Double) {
        self.interlaced = interlaced
        self.frameRate = frameRate
    }
    
    // 초기화될 때 name 인자값만 받는 init 구문
    init(name: String) {
        self.name = name
    }
    
    // 초기화될 때 interlaced 인자값만 받는 init 구문
    init(interlaced: Bool) {
        self.interlaced = interlaced
    }
    
    // 초기화될 때 interlace, frameRate, name 세 개의 인자값을 받는 init 구문
    init(interlaced: Bool, frameRate: Double, name: String) {
        self.interlaced = interlaced
        self.frameRate = frameRate
        self.name = name
    }
}

let resolution = Resolution3.init(width: 4096)
let videoMode = VideoMode3(interlaced: true, frameRate: 40.0) // .init은 생략 가능

// VideoMode3 클래스에 대한 인스턴스를 생성하고 상수에 할당
let nameVideoMode = VideoMode3(name: "홍길동")
let simpleVideoMode = VideoMode3(interlaced: true)
let doubleVideoMode = VideoMode3(interlaced: true, frameRate: 40.0)
let tripleVideoMode = VideoMode3(interlaced: true, frameRate: 40.0, name: "홍길동")

//MARK: 초기화 구문 오버라이딩
// 초기화 구문을 오버라이딩할 때는 override키워드를 붙여야한다.
// 상위 클래스에서 선언된 적이 없는 초기화 형식일 때는 override 키워드를 붙이면 안된다.
// 기본 초기화 구문 init()은 부모 클래스에 명시적으로 선언된 적이 없더라도 이를 상속받은 자식 클래스에서는 반드시 오버라이딩 형식으로 작성해야 한다
class Base{
    var baseValue: Double
    init(inputValue: Double) {
        self.baseValue = inputValue
    }
}

// 자식 클래스인 ExBase에서 초기화 구문을 오버라이딩하면 해당 초기화 구문은 새롭게 작성되므로 ExBase 클래스를 초기화할 때 baseValue에 대한 값 할당이 이루어지지 않는다.
// 이러한 오류를 방지하기 위해 오버라이딩된 초기화 구문에서 부모클래스의 초기화 구문을 직접 호출해준다

class ExBase: Base {
    override init(inputValue: Double) {
        super.init(inputValue: 10.5)
    }
}

//MARK:- 옵셔널 체인
// 클래스나 구조체의 인스턴스가 옵셔널 타입으로 선언될 경우 프로퍼티와 메소드를 호출하기 위해서는 매번 if 구문을 통해 옵셔널 인스턴스 정상값 여부를 검사해야한다

struct Human {
    var name: String?
    var man: Bool = true
}

var boy: Human? = Human(name: "홍길동", man: true)

// 변수 boy를 사용하려면 옵셔널 타입에 대한 안정성 검사가 필요하다
if boy != nil {
    if boy!.name != nil {
        print("이름은 \(boy!.name!)입니다.")
    }
}

// 또는 옵셔널 비강제 해제 구문
if let b = boy {
    if let name = b.name {
        print("이름은 \(name)입니다.")
    }
}

struct Company {
    var ceo: Human?
    var companyName: String?
    func getCEO() -> Human? {
        return self.ceo
    }
}

var startup: Company? = Company(ceo: Human(name:"나대표", man: false), companyName: "루비페이퍼")
// startup을 이용하여 ceo 내부 프로퍼티인 name을 참조하기위해서는
if let company = startup {
    if let ceo = company.ceo {
        if let name = ceo.name {
            print("대표이사의 이름은 \(name)입니다.")
        }
    }
}

// 옵셔널 체인은 옵셔널 타입으로 정의된 값이 하우 ㅣ프로퍼티나 메소드를 가지고 있을 때, 이 요소들을 if구문을 쓰지 않고도 간결하게 사용할 수 있는 코드를 작성하기위해 도입됨
if let name = startup?.ceo?.name {
    print("대표이사의 이름은 \(name)입니다")
}
startup?.ceo?.name = "꼼꼼한 윤형찬"

// 옵셔널 체인으로 참조된 값은 무조건 옵셔널 타입으로 반환된다.
// 옵셔널 체인 과정에서 옵셔널 타입들이 여러 번 겹쳐 있더라도 중첩되지 않고 한 번만 처리된다.

var someCompany: Company? = Company(ceo: Human(name: "팀 쿡", man: true), companyName: "Apple")
let name = someCompany?.getCEO()?.name
if name != nil {
    print("대표이사의 이름은 \(name!)입니다.")
}
