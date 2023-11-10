//
//  CreateBlogViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 10/11/2023.
//

import Foundation
import UIKit
import PhotosUI
import UniformTypeIdentifiers
import MobileCoreServices

class CreateBlogViewController: ViewController<CreateBlogViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var createBlogView: CreateBlogView!
    
    // MARK: - Action Methods
    
    @IBAction
    func crossButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: false)
    }
    
    @IBAction
    func uploadImagesTapped(_ sender: UIButton) {
        
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0
        configuration.filter = .images
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        
        present(picker, animated: true)
    }
    
    @IBAction
    func removeSelectedMediaButtonTapped(_ sender: UIButton) {
        let index = sender.tag
        viewModel.postData.imagesData.remove(at: index)
        createBlogView.mediaCollectionView.reloadData()
    }
    
    @IBAction
    func reviewButtonTapped(_ sender: RoundedButton) {
        viewModel.validate()
    }
    
    @IBAction
    func titleEditingDidChange(_ sender: UITextField) {
        viewModel.postData.title = sender.text ?? ""
    }
    
}

// MARK: - UICollectionViewDataSource Methods

extension CreateBlogViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.postData.imagesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CreateBlogMediaCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        
        cell.removeImageButton.tag = indexPath.row
        
        let imagedata = viewModel.postData.imagesData[indexPath.row]
        let image = UIImage(data: imagedata)
        cell.imageView.image = image
        
        return cell
    }
}

// MARK: - UITextViewDelegate
extension CreateBlogViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let textViewText = textView.text as? NSString ?? ""
        
        var updatedText = textViewText.replacingCharacters(in: range, with: text)
        
        switch textView.tag {
            case CreateBlogTextViewTag.description.rawValue:
                guard updatedText.count <= 2000 else {
                    return false
                }
                
                createBlogView.wordCountLabel.text = "\(updatedText.count)/2000"
                viewModel.postData.description = updatedText
                textView.text = updatedText
                
            case CreateBlogTextViewTag.tags.rawValue:
                if (text == "#" && textView.text.last != " ")
                    || ((textView.text.last == "#" || textView.text.last == " ") && text == " ") {
                    return false
                }
                if text.isEmpty && range.length > 0 {
                    if textView.text.count > 2 && textView.text.last == "#" {
                        textView.text.removeLast(2)
                        updatedText = textView.text
                    }
                } else if updatedText.last == " " {
                    updatedText.append("#")
                }
                
                let finalText = updatedText.isEmpty ? "#" : updatedText
                textView.text = finalText
                viewModel.postData.tags = finalText
                
            default:
                break
        }
        
        return false
    }
   
}

// MARK: - UIImagePickerControllerDelegate Methods

extension CreateBlogViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        var processedImagesCount = 0
        
        for result in results {
            result.itemProvider.loadDataRepresentation(forTypeIdentifier: UTType.image.identifier, completionHandler: { data, error in
                self.viewModel.postData.imagesData.append(data ?? Data())
                
                processedImagesCount += 1
                if processedImagesCount == results.count {
                    DispatchQueue.main.async {
                        picker.dismiss(animated: true)
                        self.createBlogView.mediaCollectionView.reloadData()
                    }
                }
            })
        }
        
    }
}
