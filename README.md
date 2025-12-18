# SwiftUI Property Wrapper Demo

A focused demo showcasing a reusable SwiftUI property wrapper for validated user input. The goal is to illustrate how a `DynamicProperty`-backed wrapper can encapsulate input state, validation logic, and bindings for clean, testable SwiftUI forms.

## What is a Property Wrapper?

Swift’s `@propertyWrapper`, introduced in Swift 5.1, allows developers to add custom behavior to properties by wrapping them with a separate type. This feature simplifies property management and reduces boilerplate code.

## Why a Property Wrapper?

Property wrappers let you bundle:
- Storage (here, `@State` for view updates)
- Behavior (validation via a closure)
- Projection (a `Binding<String>` for `TextField`/`SecureField`)
- Convenience (computed `error` and `isValid`)

This keeps your views declarative and free from boilerplate validation code.

## The `@UserInput` Wrapper

Key aspects:
- `DynamicProperty` so SwiftUI updates the view when the value changes.
- Internal `@State` to store the current input text.
- A validator closure `(String) -> String?` that returns an error message or `nil`.
- Exposes:
  - `wrappedValue` (the text)
  - `$projectedValue` (a `Binding<String>`)
  - `_property.error` (optional error message)
  - `_property.isValid` (convenience boolean)

### Implementation Summary

- Holds a `String` in `@State`.
- Accepts a validator closure in the initializer.
- Provides a `Binding` via `projectedValue` to plug into SwiftUI text fields.
- Computes `error` and `isValid` on demand.

## Usage in a View

```swift
@UserInput(validator: { $0.isEmpty ? "Username cannot be empty" : nil })
var username: String = ""

@UserInput(validator: { $0.isEmpty ? "Password cannot be empty" : nil })
var password: String = ""
