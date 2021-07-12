//
//  NewToDoView.swift
//  Todo
//
//  Created by Akash Pate on 12/07/21.
//

import SwiftUI

struct NewToDoView: View {
    
    @State
    var toDoTitle = ""
    @State
    var toDoImportant = false
    @Environment(\.presentationMode)
    var presentationMode
    @EnvironmentObject
    var toDoStorage: ToDoStorage
    
    var body: some View {
            VStack(spacing:10){
                TextField("Eg. Buy a cheese", text: $toDoTitle)
                    .padding(.init(
                                top: 20, leading: 20, bottom: 10, trailing: 20))
                Toggle("Important", isOn: $toDoImportant)
                    .padding(.init(
                                top: 10, leading: 20, bottom: 10, trailing: 20))
                Button("Save", action: {
                    self.toDoStorage.toDos.append(ToDoItem(title: toDoTitle, important: toDoImportant))
                    self.presentationMode.wrappedValue.dismiss()
                }).disabled(toDoTitle.isEmpty)
                Spacer()
            }.navigationTitle("New Todo")
    }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView().environmentObject(ToDoStorage())
    }
}
