import SwiftUI

// A property wrapper for managing user-entered text along with validation.
// It integrates with SwiftUI via DynamicProperty so it updates the view when the value changes.
@propertyWrapper
public struct UserInput: DynamicProperty {
    // State - The stored text value, persisted as SwiftUI state so view updates occur on change.
    @State private var value: String
    // A validation closure that returns an optional error message. nil means "valid".
    private let validator: (String) -> String?

    // Initializes the wrapper with an initial value and an optional validator.
    // The wrappedValue initializes the @State storage.
    public init(wrappedValue: String, validator: @escaping (String) -> String? = { _ in nil }) {
        _value = State(initialValue: wrappedValue)
        self.validator = validator
    }

    // The value exposed to the property using this wrapper.
    // nonmutating set allows mutation from a struct conforming to DynamicProperty.
    public var wrappedValue: String {
        get { value }
        nonmutating set { value = newValue }
    }

    // The projected value ($property) exposed as a Binding<String> so views like TextField can bind to it.
    public var projectedValue: Binding<String> {
        Binding(
            get: { value },
            set: { value = $0 }
        )
    }

    // Returns the current validation error, if any, based on the validator.
    public var error: String? {
        validator(value)
    }

    // Boolean flag indicating whether the current value is valid (no error).
    public var isValid: Bool {
        validator(value) == nil
    }
}
