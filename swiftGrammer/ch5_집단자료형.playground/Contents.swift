//MARK:- 배열
var cities = ["Seoul", "New York", "LA", "Santiago"]
let length = cities.count

for i in 0..<length {
    print("\(i)번째 배열 원소는 \(cities[i])")
}

for row in cities {
    let index = cities.firstIndex(of: row)
    print("\(index!)번째 배열 원소는 \(row)입니다.")
}

//MARK: 배열의 초기화 스타일

//case 1
var cities1 : [String] // 선언
cities1 = [String]()   // 초기화

//case 2
var country : [String] // 선언
country = [] //초기화

//case 3
var list : [Int] = []  // 타입 어노테이션 + 초기화

//case 4
var rows : Array<Float> = [Float]() // 타입 어노테이션 + 제네릭 + 초기화

//case 5
var tables : [String] = Array()  // 타입 어노테이션 + 구방식의 초기화

if country.isEmpty {
    print("배열이 비어있는 상태입니다.")
} else {
    print("배열에는 \(country.count)개의 아이템이 저장되어 있습니다.")
}


//MARK: 아이템 추가 메서드
cities1.append("Seoul"); cities1.append("New York"); cities1.insert("Tokyo", at: 1); cities1.append(contentsOf: ["Dubai","Sydney"])
cities1[2] = "Madrid"

var cities2 = [String](repeating: "None", count: 3)

//MARK: 범위 연산자를 이용한 인덱스 참조
var alphabet = ["a", "b", "c", "d", "e"]

alphabet[0...2]
alphabet[2...3]
alphabet[1..<3]

alphabet[1...2] = ["1", "2", "3"]
alphabet // 기존 b, c는 삭제되고 1,2,3이 대신하게된다

alphabet[2...4] = ["A"]
alphabet

//MARK:- 집합(set)
//집합 정의
var genres : Set = ["Classic", "Rock", "Balad"]
// var genres : Set<String> = ["Classic", "Rock", "Balad"]

//빈 집합을 정의
var genre1 = Set<String>()
genre1.insert("Classic"); genre1.insert("Rock"); genre1.insert("Balad");

if genres.isEmpty {
    print("집합이 비어있습니다.")
} else {
    print("집합에는 현재 \(genres.count) 개의 아이템이 저장되어 있습니다")
}

//MARK: 집합 순회 탐색
for g in genres {
    print("\(g)")
}

for g in genres.sorted() {
    print("\(g)")
}

//MARK: 추가 삭제 메서드
genres.insert("Jazz")

if let removedItem = genres.remove("Rock") {
    print("아이템 \(removedItem)의 삭제가 완료되었습니다.")
} else {
    print("삭제할 값이 집합에 추가되어 있지 않습니다.")
}

genres.removeAll()

if genres.isEmpty {
    print("모든 아이템이 삭제되었습니다")
} else {
    print("아직 \(genres.count)개의 아이템이 남았습니다")
}

if genre1.contains("Rock") {
    print("Rock 아이템이 저장되어 있습니다.")
} else {
    print("Rock 아이템이 저장되어 있지 않습니다.")
}

//MARK: 집합연산
var oddDigits : Set = [1, 3, 5, 7, 9]
var evenDigits : Set = [0, 2, 4, 6, 8]
var primeDigits : Set = [2, 3, 5, 7]

oddDigits.intersection(evenDigits).sorted() // 교집합
oddDigits.symmetricDifference(primeDigits).sorted() // 양쪽 집합중 하나에만 있는 값 (차집합)
oddDigits.union(evenDigits).sorted() // 합집합

oddDigits.subtract(primeDigits) // 공통된거 빼기
oddDigits.sorted()

let A : Set = [1, 3, 5, 7, 9]
let B : Set = [3, 5]
let C : Set = [3, 5]
let D : Set = [2, 4, 6]

B.isSubset(of: A) // 부분집합인지
A.isSuperset(of: B) // 상위집합인지
C.isStrictSubset(of: A) // 정확하게 부분집합인지( C == A 는 false)
C.isStrictSubset(of: B)
A.isDisjoint(with: D) // 공통으로 속한 아이템이 없는지

// 중복되는 값을 걸러내고 싶을 때 집합을 사용하면 좋다
var arr = [4,2,5,1,7,4,9,11,3,5,4] //배열
let set = Set(arr)
arr = Array(set)
// 또는
arr = Array(Set(arr))


//MARK:- 튜플
let tupleValue = ("a", "b", 1, 2.5, true)
//인덱스
tupleValue.0
tupleValue.4

// 타입 어노테이션 정의 가능
var tpl01 : (Int, Int) = (100, 200)
var tpl02 : (Int, String, Int) = (100, "a", 200)
var tpl03 : (Int, (String, String)) = (100, ("t", "v"))
var tpl04 : (String) = ("Sample String") // 얘는 문자열 변수로 선언됨

// 타입 어노테이션을 해주지않으면 tupleValue에서 "b"는 String 형태로 추론된다.
let tupleValue2 : (String, Character, Int, Float, Bool) = ("a", "b", 1, 2.5, true)

let (a,b,c,d,e) = tupleValue2
print(a); print(b); print(c + 2); print(d * 2); print(e)

// 결과값으로 튜플을 반환하는 함수
func getTupleValue() -> (String, String, Int) {
    return("t", "v", 100)
}
//함수가 반환하는 튜플을 튜플 상수로 바인딩
let (t, v, i) = getTupleValue()
let (t1, v1, _) = getTupleValue()

//MARK:- 딕셔너리
/* 선언과 초기화
 
 방법 1
 var capital = Dictionary<String, String>()
 방법 2
 var capital = [String : String] ()
 
 타입 어노테이션을 이용한 딕셔너리의 선언
 
 var capital : Dictionary<String, String>
 딕셔너리의 초기화
 capital = [String:String]() // 초기화 구문에서도 타입 작성을 생략해서는 안됨
 */

var capital : [String:String]

// 초기화
capital = Dictionary<String, String>()
capital = Dictionary()
capital = [String:String]()
capital = [:]

//MARK: 아이템 추가
var newCapital = [String:String]()
newCapital["JP"] = "Tokyo"

if newCapital.isEmpty {
    print("딕셔너리가 비어 있는 상태입니다.")
} else {
    print("딕셔너리의 크기는 현재 \(newCapital.count)입니다.")
}

newCapital.updateValue("Seoul", forKey: "KR")
// "KR" : "Seoul" 데이터가 추가되고 nil을 반환

newCapital.updateValue("London", forKey: "EN")
// "EN" : "London" 데이터가 추가되고 nil을 반환

newCapital.updateValue("Sapporo", forKey: "JP")
// "JP" : "Sapporo" 데이터로 수정되고 "Tokyo"를 리턴함

//MARK: 아이템 삭제
newCapital.updateValue("Ottawa", forKey: "CA")
newCapital.updateValue("Beijing", forKey: "CN")

//nil 사용 삭제
newCapital["CN"] = nil
// "CA"에 해당하는 값을 삭제하고, 반환된 값을 removedValue에 할당한다.
if let removedValue = newCapital.removeValue(forKey: "CA") {
    print("삭제된 값은 \(removedValue)입니다.")
} else {
    print("아무 것도 삭제되지 않았습니다.")
}

//MARK: 순회 탐색
for row in newCapital {
    let (key, value) = row
    print("현재 데이터는 \(key) : \(value)입니다")
}

for (key, value) in newCapital {
    print("현재 데이터는 \(key) : \(value)입니다")
}
