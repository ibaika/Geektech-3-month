import UIKit


//класс кастомизированной ячейки
class CustomNoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var noteStateButton: UIButton!
    
    @IBOutlet weak var noteTitleLabel: UILabel!
    

    @IBAction func noteStateButtonTapped(_ sender: UIButton) {
        for note in notes{
            if note.title == noteTitleLabel.text!{
                note.done = !note.done
            }
        }
        
    }
}
