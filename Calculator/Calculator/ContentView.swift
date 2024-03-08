//
//  ContentView.swift
//  Calculator
//
//  Created by StudentAM on 3/1/24.
//

import SwiftUI


struct ContentView: View {
    //All the calculator buttons
    @State private var numsAndOperations: [[String]] = [
            ["AC","+/-", "%", "÷"],
            ["7","8", "9", "x"],
            ["4","5", "6", "-"],
            ["1","2", "3", "+"],
            ["0", "." , "="]
        ]
    // calculator value variable
    @State private var displayNum: String = "0"
    //Number 1 variable
    @State private var num1: String = "0"
    //Number 2 variable
    @State private var num2: String = "0"
    //Help with choosing the oprator
    @State private var oprator: String = ""
    
  
  
    
    

   
    var body: some View {
        VStack {
            HStack {
              //Displays calculator number
                Text("\(displayNum)")
                //Adjust the font for bigger or smaller numbers
                        .font(displayNum.count > 7 ? .system(size: 40) : .system(size: 60))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .offset(y: 100)
                        .padding()
                        .bold()
                       
                
                
            }
            .padding()
            //Display all the operators in the array
                ForEach(numsAndOperations.indices, id: \.self) { num in
                    HStack {
                        //Displays all the numbers
                        ForEach(numsAndOperations[num], id: \.self) { char in
                            
                            
                            //All the operation
                            if char == "÷" || char == "x" || char == "-"  || char == "+" || char == "=" {
                                Button(action: {
                                   
                                  //Check what operator the user selcted and add the approite operator to oprator
                                    
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
                                    } 
                                    //Check what operator the user selected when they press equal and matches the correct operator
                                    else if char == "=" {
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
                                        //Orange operator buttons
                                        Text("\(char)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 25))
                                            .frame(width: 40, height: 40)
                                            .padding()
                                            .background(Color.orange)
                                            .clipShape(Circle())
                                            
                                    }
                                    
                                    
                                })
                                //Gray operator buttons
                            } else if char == "AC" || char == "+/-" ||  char == "%" || char == "C" {
                                Button(action: {
                                       
                                    //AC change
                                    //Set AC when number is zero else to C when the user has selected a number
                                        if char == "AC" || char == "C" {
                                            displayNum = "0"

                                            numsAndOperations[0][0] = "AC"
                                        }
                                    //Check if number is a percent sign
                                       else if char == "%" {
                                           //Convert number to Double and times the number by 0.01 to get percent
                                            if let displayDouble = Double(displayNum) {
                                                displayNum = String(displayDouble * 0.01)
                                            }
                                              
                                            
                                        }
                                    //Adds a minus sign to the display num
                                        else if char == "+/-" {
                                            //converts number to Int and times it by -1
                                            if let number = Int(displayNum) {
                                                displayNum =  String(number * -1)
                                                
                                            }
                                            
                                            
                                        }
                                    
                                    
                                }, label: {
                                    //Button styleing for gray buttons
                                    Text("\(char)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 25))
                                        .frame(width: 40, height: 40)
                                        .padding()
                                        .background(Color("Light Gray"))
                                        .clipShape(Circle())
                                })
                              
                                //Zero button
                            } else if char == "0" {
                                withAnimation {
                                    Button(action: {
                                         displayNum += "0"
                                        //Add a zero to the display number
                                    }, label: {
                                        //Button styleing
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
                                    //Set the AC to C when the user select a number
                                    
                                    //Make sure you can only add nine numbers
                                    if displayNum.count <= 9 {
                                        //Removes an extra zero
                                        if displayNum == "0" {
                                            displayNum = char
                                        } else {
                                            //Add the number the user selected to display num
                                           
                                            displayNum += char
                                            
                                        }
                                    } else {
                                        if let displayInt = Int(displayNum) {
                                            displayNum = displayInt.delimiter
                                        }
                                    }
                                    
                                    
                                }, label: {
                                    //Button styleing for number buttons
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
            //Set the background color black
            Color.black
                .ignoresSafeArea()
        }
     
       
        
    }
}

#Preview {
    ContentView()
        
}

//Extra Credit - Add commas to number for both Int and Doubles
extension Int {

    //Uses the number formatter to add commas
    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    //Create a new variable for Int to use commas
    var delimiter: String {
            return Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
        }
}

extension Double {
        //Uses the number formatter to add commas
    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
        //Create a new variable for Int to use commas
    var delimiter: String {
        return Double.commaFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}

//Add Function
func add(num1: String, num2: String) -> String {
    
    //Check if number contains a decamil
    if num1.contains(".") || num2.contains(".") {
        //Converts number to Double
        if let number1 = Double(num1), let number2 = Double(num2) {
            let result = number1 + number2
            
           
            
            return String(result.delimiter)
        }
    } else {
        //Converts number to Int
        if let number1 = Int(num1), let number2 = Int(num2) {
            let result = number1 + number2
            
            return String(result.delimiter)
        }
    }
        //If an error wil return
    return "Error"
}

//Subtract Function
func subtract(num1: String, num2: String) -> String {
        //Check if number contains a decamil
    if num1.contains(".") || num2.contains(".") {
            //Converts number to Double
        if let number1 = Double(num1), let number2 = Double(num2) {
            let result = number1 - number2
            
            return String(result.delimiter)
        }
    } else {     
            //Converts number to Int
        if let number1 = Int(num1), let number2 = Int(num2) {
            let result = number1 - number2
            
            return String(result.delimiter)
        }
    }
        //If an error wil return
    return "ERROR"
    
   
}

//Divde Function
func divde(num1: String, num2: String) -> String {
        //Check if number contains a decamil
    if num1.contains(".") || num2.contains(".") {
            //Converts number to Double
        if let number1 = Double(num1), let number2 = Double(num2) {
            let result = number1 / number2
            
            return String(result.delimiter)
        }
        //Check if number is zero
    } else if num1 == "0" || num2 == "0" {
        return "ERROR"
    } else {
            //Converts number to Int
        if let number1 = Int(num1), let number2 = Int(num2) {
            let result = number1 / number2
            
            return String(result.delimiter)
        }
    }
        //If an error wil return
      return "Invalid Result"
    
}

//Mutiply Function
func mutiply(num1: String, num2: String) -> String {
        //Check if number contains a decamil
    if num1.contains(".") || num2.contains(".") {
            //Converts number to Double
        if let number1 = Double(num1), let number2 = Double(num2) {
            let result = number1 * number2
            
            return String(result.delimiter)
        }
    } else {
            //Converts number to Int
        if let number1 = Int(num1), let number2 = Int(num2) {
            let result = number1 * number2
            
            return String(result.delimiter)
        }
    }
    //If an error wil return
        return "Invalid Result"
}




    

