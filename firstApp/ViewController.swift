//
//  ViewController.swift
//  firstApp
//
//  Created by Aula11 on 24/9/18.
//  Copyright © 2018 Juan José Camacho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: properties

    @IBOutlet weak var nombreLbl: UILabel!
    @IBOutlet weak var nombreTxt: UITextField!
    @IBOutlet weak var apellidoTxt: UITextField!
    var nombre : String = ""
    
    
    
    @IBOutlet weak var fondoVista: UIView!
   
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nombreTxt.delegate = self;
        apellidoTxt.delegate = self;
        nombreLbl.text = "Hola desconocido"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: actions
    @IBAction func setResetBtn(sender: UIButton) {
     nombreLbl.text = "Hola desconocido"
     nombreTxt.text = "Nombre de usuario"
     apellidoTxt.text = "Apellido"
     
     }
    @IBAction func cambiarColor(sender: UIButton) {
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        fondoVista.backgroundColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
         }
  
    
    @IBAction func nombreDidEndEditing(sender: UITextField) {
        nombreLbl.text = "Hola " + sender.text!
        nombre = sender.text!
    }
    @IBAction func apellidoDidEndEditing(sender: UITextField) {
        //textFieldDidEndEditing(sender)
        nombreLbl.text = "Hola " + nombre + " " + sender.text!
        
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    
    

}

