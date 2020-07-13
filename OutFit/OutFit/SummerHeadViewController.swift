//
//  SummerHeadViewController.swift
//  OutFit
//
//  Created by Sergey Bohachenko on 24.06.2020.
//  Copyright © 2020 Sergey Bohachenko. All rights reserved.
//

import UIKit

class SummerHeadViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var objects:[UIImage]=[]{
        didSet{
            imageView.image=objects.last
        
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        openImagePicker()
    }
    
    func openImagePicker(){
        let picker = UIImagePickerController()
        picker.delegate=self
        present(picker, animated: true, completion: nil)
    }
    
}
extension SummerHeadViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController,didFinishedPickingWithInfo info:[ UIImagePickerController.InfoKey:Any]) {
        print(info)
        picker.dismiss(animated: true, completion: nil)
        imageView.image=info[.originalImage] as? UIImage

    }
}
