//
//  ReviewBriefViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/11/2023.
//
import AVKit
import Foundation
import UIKit

class ReviewBriefViewController: ViewController<ReviewBriefViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var reviewBriefView: ReviewBriefView!
    
    // MARK: - Private Properties
    
    private var videoPlayer: AVPlayerViewController?
    private var imageView: UIImageView?
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMediaView()
        reviewBriefView.setData(data: viewModel.brief)
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func backButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: false)
    }
    
    @IBAction
    func publishButtonTapped(_ sender: RoundedButton) {
        viewModel.publish()
    }
    
    // MARK: - Private Methods
    
    private func setMediaView() {
        switch viewModel.brief.mediaType {
            case .images(let imagesData):
            guard let data = imagesData, !data.isEmpty else { return }
                embedImageView(imageData: data[0])
            case .video(let url):
                embedVideoPlayer(fileURL: url)
            default:
                break
        }
        updateMediaView()
    }
    
    private func embedImageView(imageData: Data?) {
        guard let data = imageData else { return }
        
        let image = UIImage(data: data)
        imageView = UIImageView(image: image)
        imageView?.fixInView(reviewBriefView.mediaView)
    }
    
    private func embedVideoPlayer(fileURL: URL?) {
        guard let url = fileURL else {
            return
        }
        
        let player = AVPlayer(url: url)
        
        videoPlayer = AVPlayerViewController()
        videoPlayer?.player = player
        videoPlayer?.showsPlaybackControls = false
        
        videoPlayer?.view.fixInView(reviewBriefView.mediaView)
        
        player.play()
    }
    
    private func updateMediaView() {
        reviewBriefView.videoIndicatorImageView.isHidden = viewModel.brief.mediaType != .video()
    }
   
}
