// 매개변수와 반환값이 모두 없는 함수
func printHello() {
    print("안녕하세요")
}

// 매개변수가 없지만 반환값은 있는 함수
func  sayHello() -> String {
    let returnValue = "안녕하세요"
    return returnValue
}

// 매개변수는 있으나 반환값이 없는 함수
func printHelloWithName(name: String) {
    print("\(name)님, 안녕하세요")
}

// 매개변수와 반환값이 모두 있는 함수
func sayHelloWithName(name: String) -> String {
    let returnValue = "\(name)님, 안녕하세요"
    return returnValue
}

// 반환값이 없는 함수일 경우에도 return 키워드를 사용하는 이유는 함수의 실행을 명시적으로 종료할 목적으로 사용하는 것
func hello(name: String?) {
    guard let _name = name else {
        return
    }
    print("\(_name)님, 안녕하세요")
}

//MARK: 함수의 호출
printHello()

let inputName = "홍길동"
printHelloWithName(name: inputName)
/*
 func getUserInfo() -> (Int, String) {
 let height = 182
 let name = "윤형찬"
 
 return (height, name)
 }
 */
func getUserInfo() -> (Int, Character, String) {
    // 데이터 타입이 String으로 추론되는 것을 방지하기 위해 타입 어노테이션 선언
    let gender: Character = "M"
    let height = 182
    let name = "윤형찬"
    
    return (height, gender, name)
}

var uInfo = getUserInfo()
uInfo.0
uInfo.1
uInfo.2

var (a, b, c) = getUserInfo()
a
b
c

// 언더바로 필요하지 않은 부분 건너뛰기
var (height, _, name) = getUserInfo()
height
name

// 튜플 반환값 정의 부분에 변수를 할당 -> 함수의 결과값을 받은 변수에 자동으로 바인딩
func getUserInfo2() -> (h: Int, g: Character, n: String) {
    let gender: Character = "M"
    let height = 182
    let name = "윤형찬"
    
    return (height, gender, name)
}

var result = getUserInfo2()
result.h
result.g
result.n

//MARK: 타입 알리어스 (이름이 길거나 사용하기 복잡한 타입 표현을 새로운 타입명으로 정의해주는 문법)
typealias infoResult = (h: Int, g: Character, n: String)

func getUserInfo3() -> infoResult {
    let gender: Character = "M"
    let height = 180
    let name = "윤형찬"
    
    return (height, gender, name)
}

var info = getUserInfo3()
info.0; info.1; info.2
info.h; info.g; info.n

// 내부 매개변수, 외부 매개변수
func printHello(to name: String, welcomeMessage msg: String) {
    print("\(name)님, \(msg)")
}
printHello(to: "홍길동", welcomeMessage: "안녕하세요")

/*
 func printHello(name: String, msg: String) {
 print("\(name)님, \(msg)")
 } *함수명* printHello(name:msg:)
 
 func printHello(to name: String, msg: String) {
 print("\(name)님, \(msg)")
 } *함수명* printHello(to:msg:)
 
 func printHello(to name: String, welcomMessage msg: String) {
 print("\(name)님, \(msg)")
 } *함수병* printHello(to:welcomMessage:)
 */

func printHello2(_ name: String, _ msg: String) {
    print("\(name)님, \(msg)")
}
// 함수명 : printHello2(_:_:)
printHello2("윤형찬", "안녕하세요")

func printHello3(to name: String, _ msg: String) {
    print("\(name)님, \(msg)")
}
// 함수명 : printHello3(to:_:)
printHello3(to: "윤형찬", "안녕하세요")

func printHello4(_ name: String, welcomeMessage msg: String) {
    print("\(name)님, \(msg)")
}
// 함수명 : printHello4(_:welcomeMessage:)
printHello4("윤형찬", welcomeMessage: "안녕하세요")

//MARK: 가변인자
// 개수를 제한하지 않고 인자값을 입력받고, 입력된 인자값을 배열로 처리한다
func avg(score: Int...) -> Double {
    var total = 0 // 점수합계
    for r in score { // 배열로 입력된 값들을 순회 탐색하면서 점수를 합산
        total += r
    }
    return (Double(total) / Double(score.count)) // 평균값을 구해서 반환
}
print(avg(score: 10, 20, 30, 40, 50))


//MARK: 기본값을 갖는 매개변수
func echo(message: String, newline: Bool = true) {
    if newline == true {
        print(message, true)
    } else {
        print(message, false)
    }
}

echo(message: "안녕하세요")
echo(message: "안녕하세요", newline: true)
echo(message: "안녕하세요", newline: false)

//MARK: 매개변수의 수정
func descAge(name: String, _ paramAge: Int) -> String {
    var name = name
    var paramAge = paramAge
    
    // 입력받은 매개변수를 변경
    name = name + "씨"
    paramAge += 1
    return "\(name)의 내년 나이는 \(paramAge)세 입니다."
}

descAge(name: "윤형찬", 27)


//MARK:- 일급 객체로서의 함수
//MARK: 일급 함수의 특성 1 - 변수나 상수에 함수를 대입할 수 있음
func foo(base: Int) -> String {
    print("함수 foo가 실행됩니다")
    return "결과값은 \(base + 1)입니다."
}

let fn1 = foo(base: 5)
let fn2 = foo // fn2 상수에 foo 함수가 할당됨
fn2(5)

//MARK: 일급 함수의 특성 2 - 함수의 반환 타입으로 함수를 사용할 수 있음
func desc() -> String {
    return "this is desc()"
}

// 반환 타입은 함수 타입인 () -> String으로 정의 (pass함수가 desc함수를 반환하기 때문)
func pass() -> () -> String {
    return desc
}

// pass함수의 실행 결과값을 할당받는다. 실행 결과는 desc함수이므로 p에는 desc함수가 할당된다.
let p = pass()
p()


func plus(a: Int, b: Int) -> Int {
    return a + b
}

func minus(a: Int, b: Int) -> Int {
    return a - b
}

func times(a: Int, b: Int) -> Int {
    return a * b
}

func divide(a: Int, b: Int) -> Int {
    guard b != 0 else {
        return 0
    }
    return a / b
}

func calc(_ operand: String) -> (Int, Int) -> Int {
    
    switch operand {
    case "+":
        return plus
    case "-":
        return minus
    case "*":
        return times
    case "/":
        return divide
    default:
        return plus
    }
    
}

// 함수의 실행 결과로 다른 함수를 반환하기
let c1 = calc("+")
c1(3, 4)
let c2 = calc("-")
c2(3, 4)
let c3 = calc("*")
c3(3, 5)
let c4 = calc("/")
c4(3, 4)


//MARK: 일급 함수의 특성 3 - 함수의 인자값으로 함수를 사용할 수 있음
func incr(param: Int) -> Int {
    return param + 1
}

func broker(base: Int, function fn: (Int) -> Int) -> Int {
    return fn(base)
}

broker(base: 3, function: incr)



func successThrough() {
    print("연산 처리가 성공했습니다")
}

func failThrough() {
    print("처리 과정에 오류가 발생하였습니다")
}

func divide(base: Int, success sCallBack: () -> Void, fail fCallBack: () -> Void) -> Int {
    guard base != 0 else {
        fCallBack() // 실패 함수 호출
        return 0
    }
    
    defer {
        sCallBack()
    }
    return 100 / base
}

divide(base: 30, success: successThrough, fail: failThrough)

//MARK: 함수의 중첩

/* case 1
 // 외부 함수
 func outer(base: Int) -> String {
 // 내부 함수
 func inner(inc: Int) -> String {
 return "\(inc)를 반환합니다."
 }
 let result = inner(inc: base + 1)
 
 return result
 }
 
 outer(base: 3)
 */
// case 2
// 외부 함수
func outer(param: Int) -> (Int) -> String {
    // 내부 함수
    func inner(inc: Int) -> String {
        return "\(inc)를 리턴합니다"
    }
    
    return inner
}

let fn_1 = outer(param: 3) // outer()가 실행되고, 그 결과로 inner가 대입됩니다.
let fn_2 = fn_1(30) // Inner(inc: 30)과 동일합니다.


func basic(param: Int) -> (Int) -> Int {
    let value = param + 20
    
    func append(add: Int) -> Int {
        return value + add
    }
    
    return append
}

let result2 = basic(param: 10)
result2(10)


//MARK: 클로저
// 클로저 표현식
let f = { () -> Void in
    print("클로저가 실행됩니다.")
}
f()

({ () -> Void in
    print("클로저가 실행됩니다.")
})()

let closure = { (s1: Int, s2: String) -> Void in
    print("s1: \(s1), s2:\(s2)")
}
closure(1, "Closure")

({ (s1: Int, s2: String) -> Void in
    print("s1: \(s1), s2:\(s2)")
})(1, "Closure")


// 클로저 표현식과 경량 문법
var value = [1, 9, 5, 7, 3, 2]

// 를
func order(s1: Int, s2: Int) -> Bool {
    if s1 > s2 {
        return true
    } else {
        return false
    }
}
value.sort(by: order)

//를 클로저 표현식으로
/*
value.sort(by: {
    (s1: Int, s2: Int) -> Bool in
    if s1 > s2 {
        return true
    } else {
        return false
    }
})
*/
value.sorted(by: {(s1: Int, s2: Int) -> Bool in return s1 > s2 })

value.sorted(by: {(s1: Int, s2: Int) in return s1 > s2 })

value.sorted(by: { s1, s2 in return s1 > s2 })

value.sort(by: { $0 > $1 })

value.sort(by: > )


//MARK: 트레일링 클로저
// 함수의 마지막 인자값이 클로저일 때, 이를 인자값 형식으로 작성하는 대신 함수의 뒤에 꼬리처럼 붙일 수 있는 문법
value.sort() { (s1, s2) in
    return s1 > s2
}

// 인자값이 하나일 경우, 가능한 구문
value.sort { (s1, s2) in
    return s1 > s2
}

// 인자값이 여러 개라면, 무작정 괄호를 생략해서는 안된다.
func divide2(base: Int, success s: () -> Void) -> Int {
    defer {
        s()
    }
    return 100
}

divide2(base: 100) { () in
    print("연산이 성공했습니다.")
}


//MARK: @escaping과 @autoscape
// @escaping 속성 : 인자값으로 전달된 클로저를 저장해 두었다가, 나중에 다른 곳에서도 실행 할 수 있도록 허용해주는 속성
func callback(fn: @escaping () -> Void) {
    let f = fn
    f()
}

callback {
    print("Closure가 실행되었습니다.")
}

// @autoclosure 속성 : 인자값으로 전달된 일반 구문이나 함수 등을 클로저로 래핑하는 역할
func condition(stmt: () -> Bool) {
    if stmt() == true {
        print("결과가 참입니다.")
    } else {
        print("결과가 거짓입니다.")
    }
}
// 실행방법 - 일반 구문
condition(stmt: {
    4 > 2
})

// 1. 경량화되지 않은 클로저 전체 구문
condition { () -> Bool in
    return (4 > 2)
}

// 2. 클로저 타입 선언 생략
condition {
    return (4 > 2)
}

// 3. 클로저 반환구문 생략
condition {
    4 > 2
}

// 구문만 인자값으로 전달해줄 수 있게 된다
func condition2(stmt: @autoclosure () -> Bool) {
    if stmt() == true {
        print("결과가 참입니다.")
    } else {
        print("결과가 거짓입니다.")
    }
}

// 실행방법
condition2(stmt: (4 > 2))
