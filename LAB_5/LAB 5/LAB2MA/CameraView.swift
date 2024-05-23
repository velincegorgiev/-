//
//  CameraView.swift
//  LAB2MA
//
//  Created by David Atanasoski on 16.9.23.
//

import Foundation

import UIKit
import AVFoundation

// Tryed both solutions camera does not work

class CameraView:UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.backgroundColor = .secondarySystemBackground

    }
    @IBOutlet weak var imageView: UIImageView!
    var imagePicker: UIImagePickerController!


    @IBAction func button(_ sender: Any) {

                if !UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let alertController = UIAlertController(title: nil, message: "Device has no camera.", preferredStyle: .alert)

                    let okAction = UIAlertAction(title: "Alright", style: .default, handler: { (alert: UIAlertAction!) in
                    })

                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    let picker = UIImagePickerController()
                    picker.sourceType = .camera
                    picker.allowsEditing = true
                    picker.delegate = self
                    present(picker,animated: true)
                }
    }



}



extension CameraView: UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true,completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           picker.dismiss(animated: true, completion: nil)

           guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
               return
           }
           imageView.image = image
    }
}




//import MobileCoreServices
//
//class CameraView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//    /// the captured image
//    private var image: UIImage?
//
//    // 1. Check for permissions first
//    /// "Take Photo" button action handler
//    ///
//    /// - parameter sender: the button
//    @IBAction func takePhoto(_ sender: UIButton) {
//        if AVCaptureDevice.authorizationStatus(for: .video) ==  .authorized {
//            self.showPickerWithSourceType(UIImagePickerController.SourceType.camera)
//        } else {
//            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
//                DispatchQueue.main.async {
//                    if granted {
//                        self.showPickerWithSourceType(UIImagePickerController.SourceType.camera)
//                    } else {
//                        self.showAlert("No access to camera", message: "You need to grant permissions to camera to take a picture.")
//                    }
//                }
//            })
//        }
//    }
//
//    // 2. Open photo capture
//    /// Show image picker
//    /// - Parameter sourceType: the type of the source
//    private func showPickerWithSourceType(_ sourceType: UIImagePickerController.SourceType) {
//        var vc: UIViewController!
//        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
//            let imagePicker = UIImagePickerController()
//            imagePicker.delegate = self
//            imagePicker.mediaTypes = [kUTTypeImage as String]       // if you also need a video, then use [kUTTypeImage as String, kUTTypeMovie as String]
//            imagePicker.sourceType = sourceType
//            imagePicker.videoQuality = UIImagePickerController.QualityType.typeMedium
//            vc = imagePicker
//        }
//        else {
//            let alert = UIAlertController(title: "Error", message: "This feature is supported on real devices only", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            vc = alert
//        }
//        DispatchQueue.main.async {
//            self.present(vc, animated: true, completion: nil)
//        }
//    }
//
//    // 3. Temporary save image in `self.image`
//    /// Image selected/captured
//    /// - Parameters:
//    ///   - picker: the picker
//    ///   - info: the info
//    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let mediaType = info[UIImagePickerController.InfoKey.mediaType] {
//            if (mediaType as AnyObject).description == kUTTypeImage as String {
//                if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//                    self.image = image
//                }
//            }
//        }
//        picker.dismiss(animated: true, completion: nil)
//    }
//
//    // 4. Save image
//    /// "Save" button action handler
//    ///
//    /// - parameter sender: the button
//    @IBAction func saveImageButtonAction(_ sender: Any) {
//        guard let image = self.image else { return }
//        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
//    }
//
//
//    // Called when image save is complete (with error or not)
//    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
//        if let error = error {
//            print("ERROR: \(error)")
//        }
//        else {
//            self.showAlert("Image saved", message: "The iamge is saved into your Photo Library.")
//        }
//    }
//
//    /// Show popup with title and message
//    /// - Parameters:
//    ///   - title: the title
//    ///   - message: the message
//    private func showAlert(_ title: String, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }
//}
