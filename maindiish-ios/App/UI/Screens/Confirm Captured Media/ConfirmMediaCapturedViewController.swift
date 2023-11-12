//
//  ConfirmMediaCapturedViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 12/11/2023.
//
import AVKit
import AVFoundation
import Foundation
import UIKit

class ConfirmMediaCapturedViewController: ViewController<ConfirmMediaCapturedViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var confirmationView: ConfirmMediaCapturedView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func tickButtonPressed(_ sender: UIButton) {
        viewModel.router.pop(animated: false)
        
        dismiss(animated: false)
    }
    
    @IBAction
    func crossButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        if viewModel.mediaType == .video {
            embedVideoPlayer()
        } else {
            embedImageView()
        }
    }
    
    private func embedVideoPlayer() {
        
        guard let url = viewModel.videoFileURL else {
            return
        }
        
        let player = AVPlayer(url: url)
        
        let controller = AVPlayerViewController()
        controller.player = player
        
        addChild(controller)
        controller.view.fixInView(confirmationView.capturedMediaView)
        controller.didMove(toParent: self)
        
        player.play()
    }
    
    private func embedImageView() {
        guard let data = viewModel.imageData else {
            return
        }
        
        let image = UIImage(data: data)
        let imageView = UIImageView(image: image)
        
        imageView.fixInView(confirmationView.capturedMediaView)
        
    }
    
}
