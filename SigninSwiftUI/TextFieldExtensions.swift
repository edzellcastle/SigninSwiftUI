//
//  TextFieldExtensions.swift
//  SigninSwiftUI
//
//  Created by David Lindsay on 10/17/21.
//

import SwiftUI

//extension View {
//    func placeholder<Content: View>(
//        when shouldShow: Bool,
//        alignment: Alignment = .leading,
//        @ViewBuilder placeholder: () -> Content) -> some View {
//
//        ZStack(alignment: alignment) {
//            placeholder().opacity(shouldShow ? 1 : 0)
//            self
//        }
//    }
//}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
            
        }
    }
}
