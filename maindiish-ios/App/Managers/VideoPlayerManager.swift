import AVFoundation

class VideoPlayerManager {
    
    // MARK: - Shared Instance
    
    static let shared = VideoPlayerManager()

    // MARK: - Private Properties
    
    private var currentPlayer: AVPlayer?

    // MARK: - Initializers
    
    private init() {}

    // MARK: - Public Methods
    
    func playVideo(url: URL, inLayer layer: CALayer) {
        stopPlayback()

        currentPlayer = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: currentPlayer)
        playerLayer.videoGravity = .resizeAspect
        playerLayer.frame = layer.bounds
        layer.addSublayer(playerLayer)

        currentPlayer?.play()
    }

    func stopPlayback() {
        currentPlayer?.pause()
        currentPlayer?.replaceCurrentItem(with: nil)
        currentPlayer = nil
    }
}
