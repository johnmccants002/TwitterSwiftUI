//
//  LoginView.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 6/28/22.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        NavigationView {
        ZStack {
            VStack {
                Image("twitter-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 100)
                    .padding(.top, 88)
                    .padding(.bottom, 32)

            VStack(spacing: 20) {
                CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                
                CustomSecureField(text: $password, placeholder: Text("Password"), imageName: "lock")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)

                    
            }
            .padding(.horizontal, 32)
                
                HStack {
                    Spacer()
                    Button(action: {
                       
                    }, label: {
                        Text("Forgot Password?")
                            .font(.footnote)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.top, 8)
                            .padding(.trailing, 32)
                    })
                }
                Button(action: {
                    viewModel.login(email: email, password: password)
                }, label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 360, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                })
                Spacer()
                NavigationLink(destination: RegistrationView(), label: {
                    HStack {
                        Text("Don't have an account?")
                            .font(.system(size: 14))
                            
                        Text("Sign Up")
                            .font(.system(size: 14, weight: .semibold))
                            
                            
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
 
                })

            }
        }
        
        .background(Color(red: 0.117, green: 0.633, blue: 0.951))
        .ignoresSafeArea()
        
    }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
