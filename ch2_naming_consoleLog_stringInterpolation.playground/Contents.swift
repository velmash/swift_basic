/* 콘솔로그와 문자열 보간법 */
import Swift

let age: Int = 10

"안녕하세요! 저는 \(age)살입니다."
// == "안녕하세요! 저는 10살입니다."

"안녕하세요! 저는 \(age + 5)살입니다."
// == "안녕하세요! 저는 15살입니다."

print("안녕하세요! 저는 \(age + 5)살입니다.")

print("\n###################\n")

class Person {
    var name: String = "velmash"
    var age : Int = 26
}

let velmash: Person = Person()

print(velmash)

print("\n###################\n")

dump(velmash)
