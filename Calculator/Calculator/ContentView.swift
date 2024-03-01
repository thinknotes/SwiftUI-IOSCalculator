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
                                    
                                }, label: {
                                    Text("\(char)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40))
                                        .frame(width: 40, height: 40)
                                        .padding()
                                        .background(Color("Orange"))
                                        .clipShape(Circle())
                                })
                            } else if char == "AC" {
                                Text("\(char)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 30))
                                    .frame(width: 40, height: 40)
                                    .padding()
                                    .background(Color("Light Gray"))
                                    .clipShape(Circle())
                            } else if char == "+/-" {
                                Text("\(char)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 27))
                                    .frame(width: 40, height: 40)
                                    .padding()
                                    .background(Color("Light Gray"))
                                    .clipShape(Circle())
                            } else if char == "%" {
                                Text("\(char)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                                    .frame(width: 40, height: 40)
                                    .padding()
                                    .background(Color("Light Gray"))
                                    .clipShape(Circle())
                            } else if char == "0" {
                                Text("\(char)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40))
                                    .frame(width: 100, height: 40)
                                    .padding()
                                    .background(Color("Dark Gray"))
                                    .cornerRadius(40)
//                                    .clipShape(Circle())
                            } else {
                                
                                Button(action: {
                                    handelClick(char: char)
                                    
                                }, label: {
                                    Text("\(char)")
                                        .foregroundColor(.white)
                                        .frame(width: 40, height: 40)
                                        .font(.system(size: 40))
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

func add(num1: String, num2: String) -> String {
    let opreator = num1 + num2
    return opreator
}

func handelClick(char: String) {
    if char == "+" {
        print("Adding")
    }
}
    
  
    

