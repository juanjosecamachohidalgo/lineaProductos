//
//  ViewController.swift
//  secondApp
//
//  Created by Juanjo on 8/10/18.
//  Copyright © 2018 Juan José Camacho Hidalgo. All rights reserved.
//

import UIKit

class AmigoViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var controlEvaluacion: EvaluacionControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NombreTxt.delegate = self
        saveBtn.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: properties

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var NombreTxt: UITextField!
    
    var amigo: Amigo?
    
    
    @IBOutlet weak var saveBtn: UIBarButtonItem!
  
    
    //MARK: Actions
    
        @IBAction func seleccionarImagen(sender: UITapGestureRecognizer) {
        NombreTxt.resignFirstResponder()
        let imagePickerCtrl = UIImagePickerController()
        //imagePickerCtrl.sourceType = .PhotoLibrary
        //imagePickerCtrl.sourceType = .Camera
        imagePickerCtrl.sourceType = .SavedPhotosAlbum
        imagePickerCtrl.delegate = self
        presentViewController(imagePickerCtrl, animated: true, completion: nil)
    }
  
    
    @IBAction func introducirUsuario(sender: UITextField) {
        //NombreLbl.text = "Hola " + sender.text!
    }
    
    //MARK: UIImageViewControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imgView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: Navegación
    
    @IBAction func cancelar(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (sender !== saveBtn){
            return
        }
        amigo = Amigo(nombre: NombreTxt.text ?? "", foto: imgView.image, gAfinidad: controlEvaluacion.gradoAfinidad)
        
    }
    
   
    
    @IBAction func editing(sender: UITextField) {
        if(sender.text != nil){
            saveBtn.enabled = true
        }
        
        
    }
    
   

}

