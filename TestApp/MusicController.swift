
import UIKit
import AVFoundation

class MusicController: UIViewController {
    
    var player: AVAudioPlayer?
    
    @IBOutlet weak var volumnSlider: UISlider!
    
    @IBAction func volumnActionChanged(_ sender: Any) {
        player?.volume = volumnSlider.value
    }
    
    @IBAction func btnPlay(_ sender: Any) {
        
         guard let url = Bundle.main.url(forResource: "music", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
            player.volume = volumnSlider.value
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    @IBAction func btnPause(_ sender: Any) {
          player?.pause()
    }
    
    @IBAction func btnStop(_ sender: Any) {
        player?.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()        
        // Dispose of any resources that can be recreated.
    }
    
}

