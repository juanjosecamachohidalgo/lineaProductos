//
//  EvaluacionControl.swift
//  secondApp
//
//  Created by Aula11 on 22/10/18.
//  Copyright © 2018 Juan José Camacho Hidalgo. All rights reserved.
//

import UIKit

class EvaluacionControl: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    
    //MARK: atributos
    //var gradoAfinidad = 0
    
    var botones: [UIButton] = []
    var gradoAfinidad = 0 {
        didSet{
            actualizaEstrellas()
        }
    }
    
    //CGRect(x: 0, y: 0, width: 44, height: 44)
    //MARK: inicialización
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        for i in 0..<5{
            let boton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            //boton.backgroundColor = UIColor.redColor()
            boton.setImage(UIImage(named:"Estrella vacia"), forState: .Normal)
            boton.setImage(UIImage(named:"Estrella rellena"), forState: .Selected)
            boton.adjustsImageWhenHighlighted = false
            boton.addTarget(self, action: #selector(btnEval(_:)), forControlEvents: .TouchDown)
            boton.tag = i
            botones += [boton]
            addSubview(boton)
        }
    }
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }
    func btnEval(boton: UIButton) {
        //print("Botón pulsado...")
        //print(" Botón \(boton.tag) pulsado...")
       
            gradoAfinidad = botones.indexOf(boton)! + 1
            //actualizaEstrellas()
        
    }
    
    override func layoutSubviews() {
        for (i, boton) in botones.enumerate() {
            boton.frame.origin.x = CGFloat(i * (44 + 5))
        }
    }
    
    func actualizaEstrellas(){
        for (i, botonI) in botones.enumerate(){
            botonI.selected = gradoAfinidad > i
        }
       
    }
    

}
