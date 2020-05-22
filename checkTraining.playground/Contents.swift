import Foundation

class File {
    class func open(_ path: String, encoding: String.Encoding = .utf8) -> String? {
        if FileManager.default.fileExists(atPath: path) {
            do {
                return try String(contentsOfFile: path, encoding: encoding)
            } catch {
                print(error)
                return nil
            }
        }
        return  nil
    }

    class func save(_ path: String, _ content: String, encoding: String.Encoding = .utf8) -> Bool {
        do {
            try content.write(toFile: path, atomically: true, encoding: encoding)
            return true
        } catch {
            print(error)
            return false
        }
    }
}

var array = Array(repeating: Array(repeating: 0, count: 5), count: 5)

let model = StarCalculator()

for i in 1...5{
    let fileManager = FileManager.default
    let fileContents = try? fileManager.contentsOfDirectory(atPath: "\(NSHomeDirectory())/Desktop/Client-Sentiment-Analysis/dataset/test/\(i)")
    let fileCount = fileContents!.count as Int
    for j in 0..<fileCount{
        if let loadedData = File.open("\(NSHomeDirectory())/Desktop/Client-Sentiment-Analysis/dataset/test/\(i)/\(j).txt"){
            let prediction = try model.prediction(text: loadedData)
            let rating = Int(prediction.label)
            array[i-1][rating!-1]+=1
        }else{
            print("error reading file")
        }
    }
}

postfix operator %

postfix func % (percentage: Int) -> Double {
    return (Double(percentage) / 800)
}

print(array[0])
print("1+2 dla star_1: ")
let star_1 = array[0][0]+array[0][1]
print(star_1%)

print(array[1])
print("2+1+3 dla star_2: ")
let star_2 = array[1][0]+array[1][1]+array[1][2]
print(star_2%)

print(array[2])
print("3+2+3 dla star_3: ")
let star_3 = array[2][1]+array[2][2]+array[2][3]
print(star_3%)

print(array[3])
print("4+3+5 dla star_4: ")
let star_4 = array[3][2]+array[3][3]+array[3][4]
print(star_4%)

print(array[4])
print("5+4 dla star_5: ")
let star_5 = array[4][3]+array[4][4]
print(star_5%)
