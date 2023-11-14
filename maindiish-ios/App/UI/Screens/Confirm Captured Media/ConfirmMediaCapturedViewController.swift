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
    
    // MARK: - Public Properties
    
    var confirmationCompletion: ((Bool) -> Void)?
    
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
        dismiss(animated: false) {
            self.viewModel.completion?(true)
        }
    }
    
    @IBAction
    func crossButtonPressed(_ sender: UIButton) {
        dismiss(animated: true) {
            self.viewModel.completion?(false)
        }
    }
    
    // MARK: - Private Methods
  
    private func setupView() {
        switch viewModel.mediaType {
            case .video(let url):
                embedVideoPlayer(url: url)
            case .images(let imagesData):
                guard let data = imagesData, !data.isEmpty else { return }
                embedImageView(imageData: data[0])
            default:
                break
        }
    }
    
    private func embedVideoPlayer(url: URL?) {
        
        guard let url = url else {
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
    
    private func embedImageView(imageData: Data?) {
        guard let data = imageData else {
            return
        }
        
        let image = UIImage(data: data)
        let imageView = UIImageView(image: image)
        
        imageView.fixInView(confirmationView.capturedMediaView)
        
    }
    
}
