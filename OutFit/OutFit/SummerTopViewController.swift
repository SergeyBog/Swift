//
//  SummerTopViewController.swift
//  OutFit
//
//  Created by Sergey Bohachenko on 24.06.2020.
//  Copyright © 2020 Sergey Bohachenko. All rights reserved.
//

import UIKit

class SummerTopViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    
    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var textView1: UITextField!
    @IBOutlet weak var textView2: UITextField!
    @IBOutlet weak var textView3: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad()
    {
    super.viewDidLoad()
        if let text = saveText.string(forKey: "textView.content") {
            textView.text = text
        }
        if let text=saveText1.string(forKey: "textView1.content"){
            textView1.text=text
        }
        if let text=savetext2.string(forKey: "textView2.content"){
            textView2.text=text
        }
        if let text=savetext3.string(forKey: "textView3.content"){
            textView3.text=text
        }
        GetRealImage()
        
}
    /*var objects:[UIImage]=[]{
        didSet{
            imageView.image=objects.last
        }
    }*/
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer)
    {
        openImagePicker()
    }
    
    func openImagePicker(){
    let picker = UIImagePickerController()
    picker.delegate=self
    present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info:[ UIImagePickerController.InfoKey:Any]) {
        print(info)
        picker.dismiss(animated: true, completion: nil)
        imageView.image=info[.originalImage] as? UIImage
        
       }
    func GetRealImage(){
        
        let realIamge=imageView.image
        if let data=realIamge?.pngData(){
            let fileName = getDocumentDirectory().appendingPathComponent("test.png")
        }
        let image = UIImage(named: "test.png")
        if(image==nil){
            return
        }
        let imageData:NSData=image!.pngData()! as NSData
        UserDefaults.standard.set(imageData, forKey: "saved image")
        let data=UserDefaults.standard.object(forKey: "saved image") as! NSData
        imageView.image=UIImage(data: data as Data)
    }
    func getDocumentDirectory()->URL{
        let paths=FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    let saveText = UserDefaults.standard
    @IBAction func HideKeyboard(_ sender: UITextField) {
    saveText.set(textView.text, forKey: "textView.content")
    }
    let saveText1=UserDefaults.standard
    @IBAction func HideKeyboard1(_ sender: UITextField) {
        saveText1.set(textView1.text,forKey: "textView1.content")
    }
    let savetext2=UserDefaults.standard
    @IBAction func HideKeyboard2(_ sender: UITextField) {
        savetext2.set(textView2.text,forKey: "textView2.content")
    }
    let savetext3=UserDefaults.standard
    @IBAction func HideKeyboard3(_ sender: UITextField) {
        savetext3.set(textView3.text,forKey: "textView3.content")
    }
    
}
