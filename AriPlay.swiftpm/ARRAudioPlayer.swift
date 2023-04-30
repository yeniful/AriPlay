import AVKit


class ARRAudioPlayer {
    
    var audioPlayer: AVAudioPlayer?
    var path: URL?
    var instrunment: ARRInstrument?
    var note: ARRNote?
    
    init(instrunment: ARRInstrument, note: ARRNote){
        self.instrunment = instrunment
        self.note = note
        self.path = Bundle.main.url(forResource: instrunment.rawValue + "_" + note.rawValue, withExtension: "wav")
        print("audioPlayer init")
    }
    
    deinit {
        print(audioPlayer, "audioPlayer deinit")
    }
    
    func ARRplay(){
        guard let url = path else { return }
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: url)
            guard let audioPlayer = audioPlayer else { return }
            audioPlayer.play()
        } catch let error {
            NSLog(error.localizedDescription)
        }
    }
    
    func ARRstop(){
        do {
            guard let audioPlayer = audioPlayer else { return }
            audioPlayer.stop()
            print("stopped")
        } catch let error {
            NSLog(error.localizedDescription)
        }
    }
}



