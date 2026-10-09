import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let noteSounds = ["C", "D", "E", "F", "G", "A", "B"]
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func notePressed(_ sender: UIButton)
    {
        guard let note = sender.titleLabel?.text else { return }
        
        playNote(note: note)
    }
    
    
    func playNote(note: String)
    {
        
        if let soundURL = Bundle.main.url(forResource: note, withExtension: "wav") 
        {
            do 
            {
                
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } 
            catch 
            {
                print("Error playing sound: \(error)")
            }
        }
    }
}
