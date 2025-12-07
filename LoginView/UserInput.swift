import SwiftUI

public
@propertyWrapper
struct UserInput: DynamicProperty {
    @State private var value: String
    private let validator: (String) -> String?

    public init(wrappedValue: String, validator: @escaping (String) -> String? = { _ in nil }) {
        _value = State(initialValue: wrappedValue)
        self.validator = validator
    }

    public var wrappedValue: String {
        get { value }
        nonmutating set { value = newValue }
    }

    public var projectedValue: Binding<String> {
        Binding(
            get: { value },
            set: { value = $0 }
        )
    }

    public var error: String? {
        validator(value)
    }

    public var isValid: Bool {
        validator(value) == nil
    }
}
