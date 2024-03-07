//
//  ContentView.swift
//  Calculator
//
//  Created by StudentAM on 3/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numsAndOperations: [[String]] = [
            ["AC","+/-", "%", "÷"],
            ["7","8", "9", "x"],
            ["4","5", "6", "-"],
            ["1","2", "3", "+"],
            ["0", "." , "="]
        ]
    @State private var displayNum: String = "0"
    @State private var num1: String = "0"
    @State private var num2: String = "0"
    @State private var oprator: String = ""
    
    @State private var didTap: Bool = false
  
    
    

   
    var body: some View {
        VStack {
            HStack {
              
                    Text("\(displayNum)")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .offset(y: 100)
                        .padding()
                        .bold()
                       
                
                
            }
            .padding()
                ForEach(numsAndOperations.indices, id: \.self) { num in
                    HStack {
                        ForEach(numsAndOperations[num], id: \.self) { char in
                            
                            
                            
                            if char == "÷" || char == "x" || char == "-"  || char == "+" || char == "=" {
                                Button(action: {
                                   
                                    didTap = true
                                    
                                    if char == "+" {
                                        
                                        num1 = displayNum
                                        displayNum = "0"
                                        oprator = "+"
        
                                        
                                         
                                    } else if char == "-" {
                                        num1 = displayNum
                                        displayNum = "0"
                                        oprator = "-"
                                        
                                    } else if char == "x" {
                                        num1 = displayNum
                                        displayNum = "0"
                                        oprator = "x"
                                        
                                    } else if char == "÷" {
                                        num1 = displayNum
                                        displayNum = "0"
                                        oprator = "÷"
                                        
                                        if char == "÷" && char == "0"{
//                                            displayNum -= "0"
                                        }
                                    } else if char == "=" {
                                        num2 = displayNum
                                        
                                        if oprator == "+" {
                                            displayNum = add(num1: num1, num2: num2)
                                        
                                        }
                                        
                                        if oprator == "-" {
                                            displayNum = subtract(num1: num1, num2: num2)
                                        }
                                        
                                        if oprator == "x" {
                                            displayNum = mutiply(num1: num1, num2: num2)
                                        }
                                        
                                        if oprator == "÷" {
                                            displayNum = divde(num1: num1, num2: num2)
                                        }
                                    }
                                    
//
                                }, label: {
                                    withAnimation {
                                        Text("\(char)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 25))
                                            .frame(width: 40, height: 40)
                                            .padding()
                                            .background(Color.orange)
//                                            .background(didTap ? Color.white : Color("Orange"))
                                            .clipShape(Circle())
                                            
                                    }
                                    
                                    
                                })
                            } else if char == "AC" || char == "+/-" ||  char == "%" || char == "C" {
                                Button(action: {
                                       
                                    
                                        if char == "AC" || char == "C" {
                                            displayNum = "0"

                                            numsAndOperations[0][0] = "AC"
                                        }
                                       else if char == "%" {
                                            if let displayDouble = Double(displayNum) {
                                                displayNum = String(displayDouble * 0.01)
                                            }
                                              
                                            
                                        } else if char == "+/-" {
                                            if let number = Int(displayNum) {
                                                displayNum =  String(number * -1)
                                                
                                            }
                                            
                                            
                                        }
                                    
                                    
                                }, label: {
                                    Text("\(char)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 25))
                                        .frame(width: 40, height: 40)
                                        .padding()
                                        .background(Color("Light Gray"))
                                        .clipShape(Circle())
                                })
                              
                                
                            } else if char == "0" {
                                withAnimation {
                                    Button(action: {
                                         displayNum += "0"
                                    }, label: {
                                        Text("\(char)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 25))
                                            .frame(width: 120, height: 40)
                                            .padding()
                                            .background(Color("Dark Gray"))
                                            .cornerRadius(40)
                                    })
//
                                }
//
                            } else {
                                
                                Button(action: {
                                    numsAndOperations[0][0] = "C"
                                    
                                    
                                    
                                    if displayNum.count <= 6 {
                                        if displayNum == "0" {
                                            displayNum = char
                                        } else {
                                            
                                            displayNum += char
                                            
                                            
                                        }
                                    } else if displayNum.count <= 9 {
                                        Text("\(displayNum)")
                                        //Greather then seven
                                            .font(displayNum.count > 7 ? .system(size: 40) : .system(size: 60))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                            .offset(y: 60)
                                            .bold()
                                       
                                            
                                    }
                                    
                                    
                                }, label: {
                                    Text("\(char)")
                                        .foregroundColor(.white)
                                        .frame(width: 40, height: 40)
                                        .font(.system(size: 25))
                                        .padding()
                                        .background(Color("Dark Gray"))
                                        .clipShape(Circle())
                                    
                                })
                                
                                
                                
                            }
                        }
                            
                    }
                    .offset(y: 100)

                
                    
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.black
                .ignoresSafeArea()
        }
     
       
        
    }
}

#Preview {
    ContentView()
        
}

extension Int {

    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var delimiter: String {
            return Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
        }
}

extension Double {
    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var delimiter: String {
        return Double.commaFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}

func add(num1: String, num2: String) -> String {
    print("Num1: \(num1.count)")
    print("Num2: \(num2.count)")
    if num1.contains(".") || num2.contains(".") {
        if let number1 = Double(num1), let number2 = Double(num2) {
            let result = number1 + number2
            
           
            
            return String(result.delimiter)
        }
    } else {
        if let number1 = Int(num1), let number2 = Int(num2) {
            let result = number1 + number2
            
            return String(result.delimiter)
        }
    }
    
    return "Error"
}

func subtract(num1: String, num2: String) -> String {
    if num1.contains(".") || num2.contains(".") {
        if let number1 = Double(num1), let number2 = Double(num2) {
            let result = number1 - number2
            
            return String(result.delimiter)
        }
    } else {
        if let number1 = Int(num1), let number2 = Int(num2) {
            let result = number1 - number2
            
            return String(result.delimiter)
        }
    }
    
    return "ERROR"
    
   
}

func divde(num1: String, num2: String) -> String {
    
    if num1.contains(".") || num2.contains(".") {
        if let number1 = Double(num1), let number2 = Double(num2) {
            let result = number1 / number2
            
            return String(result.delimiter)
        }
    } else if num1 == "0" || num2 == "0" {
        return "ERROR"
    } else {
        if let number1 = Int(num1), let number2 = Int(num2) {
            let result = number1 / number2
            
            return String(result.delimiter)
        }
    }
      return "Invalid Result"
    
}

func mutiply(num1: String, num2: String) -> String {
   
    if num1.contains(".") || num2.contains(".") {
        if let number1 = Double(num1), let number2 = Double(num2) {
            let result = number1 * number2
            
            return String(result.delimiter)
        }
    } else {
        if let number1 = Int(num1), let number2 = Int(num2) {
            let result = number1 * number2
            
            return String(result.delimiter)
        }
    }
        return "Invalid Result"
}




    

