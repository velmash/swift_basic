// 옵셔널 Int 타입
var optInt : Int?
optInt = 3

//옵셔널 String 타입
var optStr : String?
optStr = "Swift"

//옵셔널 Double 타입
var optDouble : Double?

// 옵셔널 Array 타입
var optArr : [String]?
optArr = ["C", "Java", "Objective-C", "SmallTalk"]

//옵셔널 Dictionary 타입
var optDic : Dictionary<String, Int>?
var optDic2 : [String:String]?
optDic = ["국어" : 94, "수학" : 88, "영어" : 96]

// 옵셔널 Class 타입
var optClass : AnyObject?

/*
 (X) : 옵셔널 타입은 결합 연산 또는 더하기 연산이 가능한 데이터 타입이 아님
 Int("123") + Int("123")
 
 (X) : Int? 와 Int는 서로 다른 타입이므로 연산이 불가능
 Int("123") + 30
 */

//MARK:- 옵셔널 강제 해제
// "!" 붙이기
var optInt2: Int? = 3
print("옵셔널 자체의 값 : \(optInt2)")
print("!로 강제 해제한값 : \(optInt2!)")

Int("123")! + Int("123")!
Int("123")! + 30

//MARK: 옵셔널 값의 안전한 해제
var str = "123" // "Swift"
var intFromStr = Int(str)

if intFromStr != nil {
    print("값이 변환되었습니다. 변환된 값은 \(intFromStr!)입니다")
} else {
    print("값 변환에 실패하였습니다")
}

//MARK:- 옵셔널 바인딩
str = "Swift"
if let intStr = Int(str) {
    print("값이 변환되었습니다. 변환된 값은 \(intStr)입니다")
} else {
    print("값 변환에 실패하였습니다")
}

func intFstr(str: String) {
    
    guard let intFromStr = Int(str) else {
        print("값 반환에 실패하였습니다")
        return
    }
    
    print("값이 변환되었습니다. 변환된 값은 \(intFromStr)입니다")
}

//MARK:- 묵시적 옵셔널 (! 로 변수 생성
// 형식상 옵셔널로 정의해야 하지만, 실제로 사용할 때에는 절대 nil 값이 대입될 가능성이 없는 변수일 때 사용
var value: Int! = Int("123")
