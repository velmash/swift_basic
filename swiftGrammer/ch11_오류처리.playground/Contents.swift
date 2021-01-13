//MARK: 오류 타입 정의하기
// 함수가 반환할 오류는 일관된 주제와 연관된 다양한 경우를 표현할 수 있어야 한다.
// 열거형이 적합

enum DateParseError: Error {
    case overSizeString // 입력된 데이터의 길이가 필요한 크기보다 크다
    case underSizeString // 입력된 데이터의 길이가 필요한 크기보다 부족하다
    case incorrectFormat(part: String) // 입력된 데이터의 형식이 맞지 않다
    case incorrectData(part: String) // 입력된 데이터의 값이 올바르지 않다
}

//MARK: 오류 던지기
import Foundation

struct Date {
    var year: Int
    var month: Int
    var date: Int
}

func parseDate(param: NSString) throws -> Date {
    // 입력된 문자열의 길이가 10이 아닐 경우 분석이 불가능하므로 오류
    guard param.length == 10 else {
        if param.length > 10 {
            throw DateParseError.overSizeString
        } else {
            throw DateParseError.underSizeString
        }
    }
    
    // 반환할 객체 타입 선언
    var dateResult = Date(year: 0, month: 0, date: 0)
    
    // 연도 정보 분석
    if let year = Int(param.substring(with: NSRange(location: 0, length: 4))) {
        dateResult.year = year
    } else {
        // 연도 분석 오류
        throw DateParseError.incorrectFormat(part: "year")
    }
    
    // 월 정보 분석
    if let month = Int(param.substring(with: NSRange(location: 5, length: 2))) {
        // 월에 대한 값은 1 ~ 12까지만 가능하므로 그 의외의 범위는 잘못된 값으로 처리한다.
        guard month > 0 && month < 13 else {
            throw DateParseError.incorrectData(part: "month")
        }
        dateResult.month = month
    } else {
        // 월 분석 오류
        throw DateParseError.incorrectFormat(part: "month")
    }
    
    // 일 정보 분석
    if let date = Int(param.substring(with: NSRange(location: 8, length: 2))) {
        // 일에 대한 값은 1 ~. 1까지만 가능하므로 그 이외의 범위는 잘못된 값으로 처리한다.
        guard date > 0 && date < 32 else {
            throw DateParseError.incorrectData(part: "date")
        }
        dateResult.date = date
    } else {
        // 일 분석 오류
        throw DateParseError.incorrectFormat(part: "date")
    }
    return dateResult
}

// 이렇게 정의된 함수나 메소드를 호출할 때는 호출할 이름 앞에 try 키워드를 붙여야한다.
// 함수에서 던지는 오류를 잡아내려면 catch 구문을 사용해야 한다.
// let date = try parseDate(param: "2020-02-28")


//MARK: 오류 객체 잡아내기
func getPartsDate(date: NSString, type: String) {
    do {
        let date = try parseDate(param: date)
        
        switch type {
        case "year" :
            print("\(date.year)년입니다.")
        case "month" :
            print("\(date.month)월입니다.")
        case "date" :
            print("\(date.date)일입니다.")
        default :
            print("입력값에 해당하는 날짜 정보가 없습니다.")
        }
    } catch DateParseError.overSizeString {
        print("입력된 문자열이 너무 깁니다. 줄여주세요")
    } catch DateParseError.underSizeString {
        print("입력된 문자열이 불충분합니다. 늘려주세요")
    } catch DateParseError.incorrectFormat(let part) {
        print("입력값이 \(part)에 해당하는 형식이 잘못되었습니다.")
    } catch DateParseError.incorrectData(let part) {
        print("입력란의 \(part)에 해당하는 값이 잘못사용되었습니다. 확인해주세요.")
    } catch {
        print("알 수 없는 오류가 발생하였습니다.")
    }
}

getPartsDate(date: "2015-12-31", type: "year")
getPartsDate(date: "2012-12-31", type: "month")
getPartsDate(date: "2015-13-31", type: "month")
getPartsDate(date: "2015-12-40", type: "date")

// 오류를 던지지 않게 하고 싶을 때는 try 키워드 대신 try! 키워드를 사용한다.
let date = try! parseDate(param: "2015-09-32")
print("\(date)")
