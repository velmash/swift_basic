import UIKit

var str = "Hello, playground"

//MARK: - 반복분
for row in 1...9 {
    print("2 X \(row) = \(row * 2)")
}

var lang = "swift"
for char in lang {
    print("개별 문자는 \(char)입니다")
}

//MARK: 루프 상수 생략
let size = 5
let padChar = "0"
var keyword = "3"

for _ in 1...size {
    keyword =  padChar + keyword
}
print("\(keyword)")

//MARK: 이중루프 - 구구단
for i in 1..<10 {
    for j in 1..<10 {
        print("\(i) X \(j) = \(i * j)")
    }
}

//MARK: while
var n = 1024
while n < 1000 {
    n = n * 2
}

print("n = \(n)")

//MARK: repeat ~ while
var n2 = 1024
repeat {
    n2 = n2 * 2
}
while n2 < 1000

print("n2 = \(n2)")


//MARK: - 조건문

var browser = "Safari"
var browserName: String

if (browser == "IE") {
    browserName = "인터넷 익스플로러"
} else if (browser == "FF") {
    browserName = "파이어폭스"
} else if (browser == "Chrome") {
    browserName = "크롬"
} else if (browser == "Opera") {
    browserName = "오페라"
} else if (browser == "Safari") {
    browserName = "싸파리"
} else {
    browserName = "알려지지 않은 브라우저"
}

print("사용하는 브라우저는 \(browserName)입니다")

//MARK: guard
func divide(base: Int) {
    guard base != 0 else {
        print("연산할 수 없습니다.")
        return
    }
    guard base > 0 else {
        print("base 는 0 보다 커야합니다.")
        return
    }
    guard base < 100 else {
        print("base는 100보다 작아야 합니다.")
        return
    }
    let result = 100 / base
    print(result)
}

//MARK:- switch

var value = (2, 3)
switch value {
case let (x, 3):
    print("튜플의 두 번째 값이 3일 때 첫 번째 값은 \(x)입니다.")
case let (3, y):
    print("듀플의 첫 번째 값이 3일 때 두 번째 값은 \(y)입니다.")
case let (x, y):
    print("튜플의 값은 각각 \(x), \(y)입니다.")
}

switch value {
case (0..<2, 3) :
    print("범위 A에 포함되었습니다")
case (2..<5, 0..<3) :
    print("범위 B에 포함되었습니다")
case (2..<5, 3..<5) :
    print("범위 C에 포함되었습니다")
default :
    print("범위 D에 포함되었습니다")
}

var point = (3, -3)

switch point {
case let (x, y) where x == y :
    print("\(x)와 \(y)은 x==y 선 상에 있습니다")
case let (x, y) where x == -y :
    print("\(x)와 \(y)은 x==-y 선 상에 있습니다")
case let (x, y) :
    print("\(x)와 \(y)은 일반 좌표 상에 있습니다")
}

//MARK:- 제어 전달문
//MARK: break
for row in 0...5 {
    if row > 2 {
        break
    }
    print(row)
}

//MARK: continue
for row in 0...5 {
    if row < 2 {
        continue
    }
    print(row)
}


var text = "This is a swift book for Apple's programming language"
var result = ""

for char in text {
    if char == " " {
        result.append(Character("_"))
        continue
    } else if char == "o" {
        result.append(Character("O"))
        continue
    }
    result.append(char)
}
print(result)

//MARK: 구문 레이블 - 사용 전
for i in 1...5 {
    for j in 1...9 {
        if (j == 3) {
            break
        }
        print("\(i) * \(j) = \(i * j)")
    }
}

//MARK: 구문 레이블 - 사용 후
outer : for i in 1...5 {
    inner : for j in 1...9 {
        if (j == 3) {
            break outer
        }
        print("\(i) * \(j) = \(i * j)")
    }
}
