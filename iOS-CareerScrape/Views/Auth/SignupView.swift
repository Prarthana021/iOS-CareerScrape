//
//  SignupView.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 11/30/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    // Container box for textfields and sign-up button
                    VStack(spacing: 20) {
                        // Sign Up title inside the container
                        Text("Sign Up")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.top, 20)
                        
                        // Username field
                        TextField("Username", text: $viewModel.username)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        
                        // Email field
                        TextField("Email", text: $viewModel.email)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .keyboardType(.emailAddress)
                        
                        // Password field
                        SecureField("Password", text: $viewModel.password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        
                        // Confirm Password field
                        SecureField("Confirm Password", text: $viewModel
                            .rePassword)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        
                        if viewModel.isLoading{
                            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .red))
                                .padding(.top, 20)
                        }
                        if let errorMessage = viewModel.errorMessage{
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .padding(.top, 20)
                        }
                        
                        // Sign Up button
                        Button(action: {
                            // Handle Sign Up action here
                            submit()
                        }) {
                            Text("Sign Up")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 200, height: 60)
                                .background(Color.black) // Consistent button color
                                .cornerRadius(20.0)
                                .shadow(radius: 10.0, x: 5, y: 10)
                        }
                        
                        //                        // Log in with Google button
                        //                        Button(action: {
                        //                            // Handle Google login action here
                        //                            print("login with google")
                        //                        }) {
                        //                            HStack {
                        //                                Image("logogoogle") // Use the custom Google logo image from assets
                        //                                    .resizable()
                        //                                    .scaledToFit()
                        //                                    .frame(width: 50, height: 40)
                        //
                        //                                Text("Log in with Google")
                        //                                    .font(.headline)
                        //                                    .foregroundColor(.black)
                        //                            }
                        //                            .padding()
                        //                            .frame(maxWidth: .infinity)
                        //                            .background(Color(red: 233/255, green: 216/255, blue: 223/255))
                        //                            .cornerRadius(10)
                        //                            .shadow(radius: 5)
                        //                        }
                        
                        // Already have an account? Sign In message
                        HStack {
                            Text("Already have an account?")
                                .foregroundColor(.black)
                            NavigationLink(destination: LoginView()) {
                                Text("Sign In")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .padding(20)
                    .frame(height: 650)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
            }
        }
    }
    func submit(){
        viewModel.singnup()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

