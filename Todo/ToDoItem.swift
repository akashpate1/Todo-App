//
//  ToDoItem.swift
//  Todo
//
//  Created by Akash Pate on 12/07/21.
//

import Foundation

struct ToDoItem : Identifiable,Codable{
    
    var id = UUID()
    var title: String
    var important: Bool
    
    init(title:String,important:Bool) {
        self.title = title
        self.important = important
    }
}

class ToDoStorage: ObservableObject{
    
    @Published var toDos = [ToDoItem](){
        didSet{
            UserDefaults.standard.set(try? PropertyListEncoder().encode(toDos),forKey: "todos")
        }
    }
    
    init() {
        if let data = UserDefaults.standard.value(forKey: "todos") as? Data{
            if let userDefaultToDos = try? PropertyListDecoder().decode(Array<ToDoItem>.self, from: data){
                toDos = userDefaultToDos
            }
        }
    }

}
