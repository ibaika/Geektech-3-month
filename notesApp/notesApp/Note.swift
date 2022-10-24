//
//  Note.swift
//  notesApp
//
import Foundation


//класс Заметки
class Note{
    var title: String
    var done: Bool
    
    init(title: String, done: Bool) {
        self.title = title
        self.done = done
    }

}
