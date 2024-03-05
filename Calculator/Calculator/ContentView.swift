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
            ["0", " . " , "="]
        ]
    @State private var displayNum: Int = 0
    @State private var num1: Int = 0
    @State private var num2: Int = 0
    @State private var oprator: String = ""

   
    var body: some View {
        VStack {
            HStack {
                Text("\(displayNum)")
                    .font(.system(size: 60))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                    .bold()
            }
                ForEach(numsAndOperations.indices, id: \.self) { num in
                    HStack {
                        ForEach(numsAndOperations[num], id: \.self) { char in
                            
                            
                            
                            if char == "÷" || char == "x" || char == "-"  || char == "+" || char == "=" {
                                Button(action: {
                                    
                                    if char == "+" {
                                        
                                        num1 = displayNum
                                        displayNum = 0
                                        oprator = "+"
                                        
                                        
                                         
                                    } else if char == "-" {
                                        num1 = displayNum
                                        displayNum = 0
                                        oprator = "-"
                                        
                                    } else if char == "x" {
                                        num1 = displayNum
                                        displayNum = 0
                                        oprator = "x"
                                        
                                    } else if char == "÷" {
                                        num1 = displayNum
                                        displayNum = 0
                                        oprator = "÷"
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
                                    Text("\(char)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 25))
                                        .frame(width: 40, height: 40)
                                        .padding()
                                        .background(Color("Orange"))
                                        .clipShape(Circle())
                                })
                            } else if char == "AC" || char == "+/-" ||  char == "%" {
                                Button(action: {
                                    if char == "AC" {
                                        displayNum = 0
                                    }
                                    
                                    if char == "%" {
                                      
//                                        if let number = Int(displayNum) {
//                                            number = Double(displayNum) * 0.01
//                                        }
                                       
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
                                Button(action: {
                                    
                                }, label: {
                                    Text("\(char)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 25))
                                        .frame(width: 100, height: 40)
                                        .padding()
                                        .background(Color("Dark Gray"))
                                        .cornerRadius(40)
                                })
//
                            } else {
                                
                                Button(action: {
                                    //DN -> Display Number
                                    if let DN = Int(char) {
                                        displayNum = DN
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
                    .padding()
                    
                    
                    
                    
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

func add(num1: Int, num2: Int) -> Int {
    let sum = num1 + num2
    return sum
}

func subtract(num1: Int, num2: Int) -> Int {
    let subtractopreator = num1 - num2
    return subtractopreator
}

func divde(num1: Int, num2: Int) -> Int {
    let opreator = num1 / num2
    return opreator
}

func mutiply(num1: Int, num2: Int) -> Int {
    let muti = num1  * num2
    return muti
}




    

