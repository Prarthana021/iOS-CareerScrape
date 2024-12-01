//
//  LoginView.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 11/30/24.
//

import SwiftUI

struct LoginView: View {
//    @StateObject private var viewModel = AuthViewModel()
    @EnvironmentObject private var viewModel: AuthViewModel
    var body: some View {
        NavigationView {
            VStack() {
                Image("logo6")
                    .resizable()
                    .frame(width: 380, height: 90)
                
                    .padding(.top, -106)
                    .padding(.bottom, 5)
                
                Text("Welcome to CareerScrape!")
                    .font(.title)
                    .foregroundColor(Color.black)
                    .padding([.top, .bottom], 2)
                    .shadow(radius: 9.0, x: 10, y: 10)
                
                Image("prathu")
                    .resizable()
                    .frame(width: 200, height: 180)
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 9.0, x: 20, y: 10)
                    .padding(.bottom, 40)
                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Username", text: $viewModel.username)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(25.0)
                        .shadow(radius: 10.0, x: 5, y: 10)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textContentType(.password)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(25.0)
                        .shadow(radius: 10.0, x: 5, y: 10)
                    // TODO: progressView
                    if viewModel.isLoading{
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .red))
                            .padding(.top,20)
                    }
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding(.top,10)
                    }
                }
                .padding([.leading, .trailing], 50)
                
                Button(action: {}) {
                    Text("Forgot password?")
                        .padding([.leading], 150)
                        .foregroundColor(.black)
                }
                
                Button(action: { submit() }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 200, height: 60)
                        .background(
                            Color(red: 255/255, green: 183/255, blue: 178/255) // #FFB7B2
                        )
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding(.top, 20)
                
                Spacer()
                
                HStack {
                    Text("Don't have an account? ")
                        .foregroundColor(.black)
                    NavigationLink(destination: SignUpView()) {
                        Text("Signup")
                            .foregroundColor(.red)
                    }
                }
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 222/255, green: 214/255, blue: 206/255),
                        Color(red: 254/255, green: 197/255, blue: 187/255),
                        Color(red: 245/255, green: 235/255, blue: 224/255)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
    
    func submit() {
        print("\(viewModel.username) \(viewModel.password)")
        viewModel.login()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

