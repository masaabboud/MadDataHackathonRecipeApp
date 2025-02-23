//
//  LoginView.swift
//  RecipeApp
//
//  Created by Masa Abboud on 2/22/25.
//

import SwiftUI

struct LoginView: View {
    @Binding var currentPage: Int
    @State private var email = ""
    @State private var password = ""
    
    var body: some View{
        NavigationStack{
            VStack{
                Spacer()
                ZStack(alignment: .top) {
                   
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: UIScreen.main.bounds.height * 0.75)
                            .edgesIgnoringSafeArea(.bottom)
                        
                    
                        //form fields
                        VStack(spacing: 24){
                            InputView(text: $email,
                                      title: "Email Address",
                                      placeholder: "name@example.com")
                            .autocapitalization(.none)
                            
                            InputView(text: $password,
                                      title: "Password",
                                      placeholder: "Enter your password",
                                      isSecureField: true)
                        }
                        .padding(.horizontal)
                        .padding(.top, 12)
                        
                        //sign in button
                        Button{
                            print("Log user in...")
                        } label: {
                            HStack{
                                Text("SIGN IN")
                                    .fontWeight(.semibold)
                                Image(systemName: "arrow.right")
                                
                            }
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        }
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                        .padding(.top, 24)
                        
                        Spacer()
                        //sing up button
                    }
                }
            }
        }
    }

