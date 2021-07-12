//
//  ContentView.swift
//  Todo
//
//  Created by Akash Pate on 10/07/21.
//

import SwiftUI

struct ToDoListView: View {
    
    @EnvironmentObject
    var toDoStorage: ToDoStorage
    
    var body: some View {
        NavigationView{
            List{
                ForEach(self.toDoStorage.toDos){ toDo in
                    
                    if toDo.important{
                        Text(toDo.title)
                            .bold()
                            .foregroundColor(.red)

                    }else{
                        Text(toDo.title)
                    }
                }.onDelete(perform: { indexSet in
                    if let index = indexSet.first{
                        self.toDoStorage.toDos.remove(at: index)
                    }
                })
            }.navigationBarTitle("My Todos")
            .navigationBarItems(trailing: NavigationLink("Add", destination: NewToDoView()))
        }
    }
}

struct ToDoListView_Preview: PreviewProvider {
    static var previews: some View {
        ToDoListView().environmentObject(ToDoStorage())
    }
}
