//
//  LoginViewTests.swift
//  LoginViewTests
//
//  Created by ArunPrasanth R on 7/12/25.
//

import Testing

@Suite("LoginView General Tests")
struct LoginViewTests {
    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
}

@Suite("UserInput Property Wrapper Validation Tests")
struct UserInputValidationTests {

    @Test("Username can't be empty")
    func usernameEmptyValidation() {
        let wrapper = UserInput(wrappedValue: "", validator: { $0.isEmpty ? "Username cannot be empty" : nil })
        #expect(wrapper.error == "Username cannot be empty")
        #expect(!wrapper.isValid)
    }

    @Test("Username is valid when not empty")
    func usernameValid() {
        let wrapper = UserInput(wrappedValue: "arun", validator: { $0.isEmpty ? "Username cannot be empty" : nil })
        #expect(wrapper.error == nil)
        #expect(wrapper.isValid)
    }

    @Test("Password can't be empty")
    func passwordEmptyValidation() {
        let wrapper = UserInput(wrappedValue: "", validator: { $0.isEmpty ? "Password cannot be empty" : nil })
        #expect(wrapper.error == "Password cannot be empty")
        #expect(!wrapper.isValid)
    }

    @Test("Password is valid when not empty")
    func passwordValid() {
        let wrapper = UserInput(wrappedValue: "secret", validator: { $0.isEmpty ? "Password cannot be empty" : nil })
        #expect(wrapper.error == nil)
        #expect(wrapper.isValid)
    }
}
