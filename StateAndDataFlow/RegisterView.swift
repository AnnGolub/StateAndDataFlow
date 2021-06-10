//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 08.06.2021.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManger
    @State private var showAlert = false
    @AppStorage("userName") private var userName = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $userName)
                    .multilineTextAlignment(.center)
                    .frame(width: 250, height: 24)
                
                Text("\(userName.count)")
            }
            Button(action: registerUser){
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Wrong name"),
                                message: Text("Name is too short")
                            )
                        }
                }
                .disabled(userName.isEmpty)
            }
        }
    }
    private func registerUser() {
        if userName.count >= 3 {
            user.name = userName
            user.isRegister.toggle()
        } else {
            showAlert.toggle()
        }
    }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
