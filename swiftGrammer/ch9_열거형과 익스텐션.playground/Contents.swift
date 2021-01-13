//MARK:- 열거형
// 열거형 : 하나의 주제로 연관된 데이터들이 멤버로 구성되어 있는 자료형 객체
// 1. 원치 않는 값이 잘못 입력되는 것을 막고 싶을 때
// 2. 입력받을 값을 미리 특정할 수 있을 때
// 3. 제한된 값 중에서만 선택할 수 있도록 강제하고 싶을 때    사용한다

enum Direction {
    case north
    case south
    case east, west
}

let N = Direction.north
let S = Direction.south
let E = Direction.east
let W = Direction.west


// var directionToHead: Direction = Direction.west
// directionToHead = .east
var directionToHead: Direction = .east

/*
switch directionToHead {
case Direction.north:
    print("북쪽입니다")
case Direction.south:
    print("남쪽입니다")
case Direction.east:
    print("동쪽입니다")
case Direction.west:
    print("서쪽입니다")
}
*/
switch directionToHead {
case .north:
    print("북쪽입니다")
case .south:
    print("남쪽입니다")
case .east:
    print("동쪽입니다")
case .west:
    print("서쪽입니다")
}

// 멤버와 실질적인 값을 분리하여 멤버는 이해하기 쉬운 문자열 위주로 정의하고, 실질적으로 필요한 값은 멤버에 연계하여 사용하여 훨씬 편리하고 좋게 사용할 수 있다
// 멤버에 대입할 값의 자료형을 열거형 타입의 선언 뒤에 타입 어노테이션으로 표기해야한다.
enum HTTPCode: Int {
    case OK = 200
    case NOT_MODIFY = 304
    case INCORRECT_PAGE = 404
    case SERVER_ERROR = 500
    
    var value: String {
        return "HTTPCode number is \(self.rawValue)"
    }
    
    func getDescription() -> String {
        switch  self {
        case .OK:
            return "응답이 성공했습니다. HTTP 코드는 \(self.rawValue)입니다."
        case .NOT_MODIFY:
            return "변경된 내역이 없습니다. HTTP 코드는 \(self.rawValue)입니다."
        case .INCORRECT_PAGE:
            return "존재하지 않는 페이지입니다. HTTP 코드는 \(self.rawValue)입니다."
        case .SERVER_ERROR:
            return "서버 오류입니다. HTTP 코드는 \(self.rawValue)입니다."
        }
    }
    
    static func getName() -> String {
        return "This Enumeration is HTTPCode"
    }
}
// 문자열 형식의 멤버에 할당된 값을 일을 때에는 rawValue라는 속성을 사용한다
HTTPCode.OK.rawValue
HTTPCode.NOT_MODIFY.rawValue
HTTPCode.INCORRECT_PAGE.rawValue
HTTPCode.SERVER_ERROR.rawValue

// 값 자동할당 기능
/*
enum Rank: Int {
    case one = 1
    case two, three, four, five
}
*/
enum Rank: Int {
    case one = 10
    case two = 20
    case three, four, five
}

Rank.one.rawValue
Rank.two.rawValue
Rank.three.rawValue
Rank.four.rawValue
Rank.five.rawValue

// 열거형 객체의 멤버와 값은 선언하는 시점에서 정의되지만, 사용하는 시점에서 멤버에 보조 값을 설정할 수도 있다 (연관 값)
enum ImageFormat {
    case JPEG
    case PNG(Bool)
    case GIF(Int, Bool)
}

var newImage = ImageFormat.PNG(true)
newImage = .GIF(256, false)

var response = HTTPCode.OK
response = .NOT_MODIFY

response.value
response.getDescription()

HTTPCode.getName()


//MARK:- 익스텐션
// 이미 존재하는 클래스나 구조체, 열거형 등의 객체에 새로운 기능을 추가하여 확장해주는 구문이다

//MARK: 익스텐션과 연산 프로퍼티
// 익스텐션을 이용하면 기존 객체에 프로퍼티를 추가할 수 있다. (저장 프로퍼티는 안됨)
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var description: String {
        return "\(self)km는 \(self.km)m, \(self)cm는 \(self.cm)m, \(self)mm는 \(self.mm)m입니다."
    }
}

2.km
5.5.cm
123.mm
print(7.0.description)

let distance = 42.0.km + 195.m
print("마라톤의 총 거리는 \(distance)m입니다.")

//MARK: 익스텐션과 메소드
// 기존 객체에 새로운 인스턴스 메소드나 타입 메소드를 정의할 수 있다
// 기존 객체에서 사용된 같은 메소드를 익스텐션에서 재정의하는 것은 안됨
extension Int {
    func repeatRun(task: () -> Void) {
        for _ in 0 ..< self {
            task()
        }
    }
    
    // 자기 자신의 인스턴스를 수정하거나 프로퍼티를 변경해야 할 때 mutating 키워드 사용
    mutating func square() {
        self = self * self
    }
}

let d = 3
d.repeatRun(task: {
    print("반갑습니다!")
})

// 트레일링 클로저 문법
d.repeatRun {
    print("반갑습니다!")
}

var value = 3
// let 선언한 상수는 값변경이 안되므로 사용 불가
value.square()

// 실행결과 인스턴스의 값 자체를 변경하는 것이므로 
// 3.square() 도 불가
