import UIKit
import Foundation



//func startPlaying(){
//    let randomRoomNumber = Int.random(in: 1...4)
//    print(randomRoomNumber)
//    
//}

var stepsLeft = 3

func canContinuePlaying(stepsLeft: Int) -> Bool{
    if stepsLeft != 0{
        return true
    }
    
    return false
}

//func changeRoomButtonTapped(to room: Int, currentRoomVC: UIViewController, roomDestinationVC: UIViewController){
//    switch room{
//    case 1:
//        let fi = roomDestinationVC.storyboard?.instantiateViewController(withIdentifier: <#T##String#>)
//
//    default:
//        break
//    }
//
//}

