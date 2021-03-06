//
//  PhotoPicker.swift
//  PhotoPicker
//
//  Created by Hirohisa Kawasaki on 4/11/15.
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//

import Foundation
import UIKit

public class PhotoPicker {

    public let pickerController = ImagePickerController()
    public init() {
    }

    public func showIn(viewController source: UIViewController) {
        let controller = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        let takePictureAction = UIAlertAction(title: "写真を撮る", style: .Default) { _ in
            self.takePicture(source: source)
        }
        controller.addAction(takePictureAction)
        let albumAction = UIAlertAction(title: "アルバムを開く", style: .Default) { _ in
            self.showAlbum(source: source)
        }
        controller.addAction(albumAction)
        let cancelAction = UIAlertAction(title: "キャンセル", style: .Cancel) { _ in
        }
        controller.addAction(cancelAction)

        source.presentViewController(controller, animated: true) { _ in }
    }

    func takePicture(#source: UIViewController) {
        let viewController = UIImagePickerController()
        viewController.sourceType = .Camera
        viewController.delegate = pickerController
        if let source = source as? ImagePickerControllerDelegate {
            pickerController.delegate = source
        }
        source.presentViewController(viewController, animated: true) {
        }
    }

    func showAlbum(#source: UIViewController) {
        if let source = source as? ImagePickerControllerDelegate {
            pickerController.delegate = source
        }
        if let source = source as? ImagePickerControllerDataSource {
            pickerController.dataSource = source
        }
        source.presentViewController(pickerController, animated: true) {
        }
    }

}
