//
//  ViewController.swift
//  gapsTzt
//
//  Created by Asanka Gankewala on 11/19/19.
//  Copyright © 2019 Shazeen. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

enum ErrorToThrow: Error{
    case indexOutOfRange
}

let words = ["start", "citizen", "flour", "circle", "petty", "neck", "seem", "lake", "page", "color", "ceiling", "angle", "agent", "mild", "touch", "bite", "cause", "finance", "greet", "eat", "minor", "echo", "aviation", "baby", "role", "surround", "incapable", "refuse", "reliable", "imperial", "outer", "liability", "struggle", "harsh", "coerce", "front", "strike", "rage", "casualty", "artist", "ex", "transaction", "parking", "plug", "formulate", "press", "kettle", "export", "hiccup", "stem", "exception", "report", "central", "cancer", "volunteer", "professional", "teacher", "relax", "trip", "fountain", "effect", "news", "mark", "romantic", "policy", "contemporary", "conglomerate", "cotton", "happen", "contempt", "joystick", "champagne", "vegetation", "bat", "cylinder", "classify", "even", "surgeon", "slip", "private", "fox", "gravity", "aspect", "hypnothize", "generate", "miserable", "breakin", "love", "chest", "split", "coach", "pound", "sharp", "battery", "cheap", "corpse", "hobby", "mature", "attractive", "rock"]

let file = "file.txt" //this is the file. we will write to and read from it

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Task 1
        for i in 0..<words.count {
            print ("\(i+1) : \(getRandomWordSync())")
        }
        
        // Task 2
        for i in 1..<words.count+1 {
            var output = ""
            if (i % 3 == 0 && i % 5 == 0) {output += "FizzBuzz"}
            else if (i % 3 == 0) {output += "Fizz"}
            else if (i % 5 == 0) {output += "Buzz"}
                
            else {output = getRandomWordSync()}
            print(output)
        }
        
        // Task 3
        /*DispatchQueue.main.async {
            for i in 0..<words.count {
                DispatchQueue.main.async {
                    try? getRandomWord(slow: true, completion: {word,error  -> Void in
                        if error == nil {
                            print("\(i) : \(String(describing: word!))")
                        } else {
                            print (error!)
                        }
                    })
                }
            }
        }
        
        DispatchQueue.main.async {
            for i in 1..<words.count+1 {
                var output = ""
                DispatchQueue.main.async {
                    getRandomWord(slow: true, completion: {word,error  -> Void in
                        if error == nil {
                            
                            if (i % 3 == 0 && i % 5 == 0) {output += "FizzBuzz"}
                            else if (i % 3 == 0) {output += "Fizz"}
                            else if (i % 5 == 0) {output += "Buzz"}
                            else {output = word!}
                        } else {
                            output = error!
                        }
                        print(output)
                    })
                    
                }
                
            }
        }*/
        
        // Task 4
        /*for i in 0..<words.count {
            do {
                print ("\(i+1) : \(try? getRandomWordSync())")
            } catch ErrorToThrow.indexOutOfRange {
                print("It shouldn't break anything!")
            }
        }
        
        for i in 1..<words.count+1 {
            var output = ""
            if (i % 3 == 0 && i % 5 == 0) {output += "FizzBuzz"}
            else if (i % 3 == 0) {output += "Fizz"}
            else if (i % 5 == 0) {output += "Buzz"}
                
            else {output = getRandomWordSync()}
            print(output)
        }
        
        DispatchQueue.main.async {
            for i in 0..<words.count {
                DispatchQueue.main.async {
                    try? getRandomWord(slow: true, completion: {word,error  -> Void in
                        if error == nil {
                            print("\(i) : \(String(describing: word!))")
                        } else {
                            print (error!)
                        }
                    })
                }
            }
        }
        
        DispatchQueue.main.async {
            for i in 1..<words.count+1 {
                var output = ""
                DispatchQueue.main.async {
                    do{
                        try? getRandomWord(slow: true, completion: {word,error  -> Void in
                            if error == nil {
                                
                                if (i % 3 == 0 && i % 5 == 0) {output += "FizzBuzz"}
                                else if (i % 3 == 0) {output += "Fizz"}
                                else if (i % 5 == 0) {output += "Buzz"}
                                else {output = word!}
                            } else {
                                output = error!
                            }
                            print(output)
                        })
                    }
                    catch ErrorToThrow.indexOutOfRange {
                        print("It shouldn't break anything!")
                    }
                }
                
            }
        }*/
        // Task 5
        /*DispatchQueue.main.async {
            for i in 0..<words.count {
                DispatchQueue.main.async {
                    try? getRandomWord(slow: true, completion: {word,error  -> Void in
                        if error == nil {
                            print("\(i) : \(String(describing: word!))")
                            self.writeToFile(content: "\(i) : \(String(describing: word!))")
                        } else {
                            print (error!)
                            self.writeToFile(content: error!)
                        }
                    })
                }
            }
            
        }
        
        DispatchQueue.main.async {
            for i in 1..<words.count+1 {
                var output = ""
                DispatchQueue.main.async {
                    try? getRandomWord(slow: true, completion: {word,error  -> Void in
                        if error == nil {
                            
                            if (i % 3 == 0 && i % 5 == 0) {output += "FizzBuzz"}
                            else if (i % 3 == 0) {output += "Fizz"}
                            else if (i % 5 == 0) {output += "Buzz"}
                            else {output = word!}
                        } else {
                            output = error!
                        }
                        print(output)
                        self.writeToFile(content:output)
                    })
                    
                }
                
            }
        }*/
        // Task 6
        //uploadFile()
    }
    
    // Task 6
    /*func uploadFile () {
        let headers: HTTPHeaders = [
            "Content-type": "multipart/form-data"
        ]
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
            let  fileData = fileURL // getting data from local path
            
            let URL = try! URLRequest(url: "https://xxxxxxx/upload", method: .post, headers: headers)
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                
                //multipartFormData.append(fileData, withName: "image", fileName: "image", mimeType: "image/png")
                multipartFormData.append(fileData, withName: "file")
                
            }, with: URL, encodingCompletion: { (result) in
                
                switch result {
                case .success(let upload, _, _):
                    
                    upload.responseJSON { response in
                        print(response)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
                
            })
        }
    }*/
    
    func writeToFile (content: String) {
        let text = content + "\n"
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
            //writing
            if let fileUpdater = try? FileHandle(forUpdating: fileURL) {
                
                // function which when called will cause all updates to start from end of the file
                fileUpdater.seekToEndOfFile()
                
                // which lets the caller move editing to any position within the file by supplying an offset
                fileUpdater.write(text.data(using: .utf8)!)
                
                //Once we convert our new content to data and write it, we close the file and that’s it!
                fileUpdater.closeFile()
            }
            //reading
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                print(text2)
            }
            catch {/* error handling here */}
        }
    }
}

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

func getRandomWordSync() -> String {
    let index = randomInRange(min: 0, max: 100)
    let word = words[index]
    return word
}

func getRandomWord(slow: Bool = false, completion:@escaping(_ word: String?, _ error: String?)->()) throws {
    let index = randomInRange(min: 0, max: 200)
    guard let word = words[safe: index] else {
        //return completion(nil, "Fatal error: Index out of range")
        // Task 4
        throw ErrorToThrow.indexOutOfRange
    }
    
    let delay = slow ? 10.0 : 0.0   //500.0
    
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        completion(word, nil)
    }
}

func randomInRange(min: Int, max: Int) -> Int {
    return Int.random(in: min ..< max)
}
