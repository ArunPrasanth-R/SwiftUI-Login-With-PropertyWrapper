//
//  ContentView.swift
//  LoginView
//
//  Created by ArunPrasanth R on 7/12/25.
//

import SwiftUI

struct ContentView: View {
    @UserInput(validator: { $0.isEmpty ? "Username cannot be empty" : nil })
    var username: String = ""
    @UserInput(validator: { $0.isEmpty ? "Password cannot be empty" : nil })
    var password: String = ""
    @State private var showingAlert: Bool = false

    var body: some View {
        GeometryReader { reader in
            let contentWidth = reader.size.width / 1.4

            VStack(spacing: 20) {
                Text("Login")
                    .font(.title)
                    .bold()

                VStack(alignment: .leading, spacing: 4) {
                    TextField("Username", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(width: contentWidth)
                    if let error = _username.error {
                        Text(error)
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }

                VStack(alignment: .leading, spacing: 10) {
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: contentWidth)
                    if let error = _password.error {
                        Text(error)
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }

                Button(action: {
                    showingAlert = true
                }) {
                    Text("Login")
                        .frame(width: contentWidth, height: 44)
                }
                .buttonStyle(.borderedProminent)
                .disabled(!_username.isValid || !_password.isValid)
                .alert("Username: \(username)\nPassword: \(password)", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) {}
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .top
            )
            .padding(.top, 100)
            .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}
