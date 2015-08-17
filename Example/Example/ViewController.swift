//
//  ViewController.swift
//  Example
//
//  Created by Hirohisa Kawasaki on 4/7/15.
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//

import UIKit
import PhotoPicker

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let delay = 0.5 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.showPhotoPicker()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func showPhotoPicker() {
        let picker = PhotoPicker()
        picker.showIn(viewController: self)
    }
}

extension ViewController: ImagePickerControllerDelegate {

    func imagePickerController(picker: ImagePickerController, didFinishTakingPicture image: UIImage) {
        println(image.size)
    }

    func imagePickerController(picker: ImagePickerController, didFinishPickingAssets assets: [PHAsset]) {
        println(assets)
    }

    func imagePickerControllerDidCancel(picker: ImagePickerController) {
        println(__FUNCTION__)
    }

}

extension ViewController: ImagePickerControllerDataSource {

    func heightForRowInAlbum(picker: ImagePickerController) -> CGFloat {
        return 100
    }

    func imagePickerController(picker: ImagePickerController, configureCell cell: UITableViewCell, collection: PHAssetCollection) {
        cell.textLabel?.text = collection.localizedTitle
        cell.separatorInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        cell.accessoryType = .DisclosureIndicator
    }

    func createAssetsViewController() -> AssetsViewController {
        return AssetsViewController(nibName: "AssetsViewController", bundle: nil)
    }

    func imagePickerController(picker: ImagePickerController, configureCollectionView collectionView: UICollectionView) {
        collectionView.registerNib(UINib(nibName: "AssetCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

        let collectionViewLayout = UICollectionViewFlowLayout()
        let margin: CGFloat = 10
        let length = (view.frame.width - margin * 4) / 3
        collectionViewLayout.itemSize = CGSize(width: length, height: length)
        collectionViewLayout.minimumInteritemSpacing = margin
        collectionViewLayout.minimumLineSpacing = margin
        collectionView.collectionViewLayout = collectionViewLayout
    }

}

