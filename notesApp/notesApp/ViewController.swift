//
//  ViewController.swift
//  notesApp
//
//  Created by ibaikaa on 24/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var notesTableView: UITableView!
    
    //картинки из assets
    let noteNotDoneStateImage = UIImage(named: "blank-check-box")
    let noteDoneStateImage = UIImage(named: "check-box-done")
    
    
    
    var notesVC: [Note] = notes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notesTableView.dataSource = self
        notesTableView.delegate = self
        
    }
}

extension ViewController: UITableViewDataSource{
    
    //количество ячеек = количество заметок в массиве
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notesVC.count
    }
    
    
    //кастомизация ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom_cell", for: indexPath) as! CustomNoteTableViewCell
        
        cell.noteStateButton.addTarget(self, action: #selector(moveDoneNotesToTop), for: .touchUpInside)
        
        let isDone = notesVC[indexPath.row].done
        
        cell.noteTitleLabel.text = notesVC[indexPath.row].title

        
        if isDone{
            cell.noteStateButton.setImage(noteDoneStateImage, for: .normal)
        } else {
            cell.noteStateButton.setImage(noteNotDoneStateImage, for: .normal)
        }
        
        return cell
    }
    
    //функция сортировки выполненных задач вперед 
    @objc func moveDoneNotesToTop(){
                
        var c = 0
        for note in notesVC{
            if note.done{
                notesVC.remove(at: c)
                notesVC.insert(note, at: 0)
            }
            c += 1
        }

        self.notesTableView.reloadData()

    }
}


extension ViewController: UITableViewDelegate{
    
    //создание и вызов alertController для добавления/удаления заметки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "Добавить задачу", message: "Сформулируйте свою задачу в текстовое поле", preferredStyle: .alert)
        
        var textField = UITextField()
        
        alertController.addTextField { text in
            textField = text
        }
        
        let actionAdd = UIAlertAction(title: "Добавить заметку", style: .default) { action in
            let newNote = Note(title: textField.text!, done: false)
            self.notesVC.append(newNote)
            notes = self.notesVC
            self.notesTableView.reloadData()
        }
        
        let actionRemove = UIAlertAction(title: "Удалить заметку", style: .destructive) { action in
            self.notesVC.remove(at: indexPath.row)
            notes = self.notesVC
            self.notesTableView.reloadData()
        }
        
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel)
        
        alertController.addAction(actionAdd)
        alertController.addAction(actionRemove)
        alertController.addAction(actionCancel)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    // высота ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}

