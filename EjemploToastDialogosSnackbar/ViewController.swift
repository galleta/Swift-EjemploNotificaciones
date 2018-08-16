//
//  ViewController.swift
//  EjemploToastDialogosSnackbar
//
//  Created by Francisco Jesús Delgado Almirón on 14/8/18.
//  Copyright © 2018 Francisco Jesús Delgado Almirón. All rights reserved.
//

import UIKit

import Toast_Swift
import MaterialComponents.MaterialSnackbar
import MaterialComponents.MaterialSnackbar_ColorThemer

/*
 Fuentes:   https://github.com/scalessec/Toast-Swift
            https://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift
            https://material.io/develop/ios/components/snackbars/
 
            -----------------------------
            https://stackoverflow.com/questions/27693142/uialertcontroller-get-text
            http://nikolakirev.com/blog/uialertcontroller-swift-example
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func funcionalidadBotonToastNormal(_ sender: Any)
    {
        self.view.makeToast("Esto es un toast")
    }
    
    @IBAction func funcionalidadBotonToastPosicion(_ sender: Any)
    {
        let aleatorio:UInt32 = arc4random_uniform(3) // aleatorio entre 0 y 2
        
        if( aleatorio == 0 )
        {
            self.view.makeToast("Esto es un toast con tiempo y posición (arriba)", duration: 3.0, position: .top)
        }
        if( aleatorio == 1 )
        {
            self.view.makeToast("Esto es un toast con tiempo y posición (centro)", duration: 3.0, position: .center)
        }
        if( aleatorio == 2 )
        {
            self.view.makeToast("Esto es un toast con tiempo y posición (abajo)", duration: 3.0, position: .bottom)
        }
    }
    
    @IBAction func funcionalidadBotonToastImagen(_ sender: Any)
    {
        self.view.makeToast("Esto es un toast con imagen", duration: 2.0, position: .bottom, title: "Un título", image: UIImage(named: "happy.jpg"))
        
    }
    
    @IBAction func funcionalidadBotonDialogo1(_ sender: UIButton)
    {
        // Creo la alerta
        let alert = UIAlertController(title: "Diálogo con 1 botón", message: "Mensaje diálogo con 1 botón", preferredStyle: UIAlertControllerStyle.alert)
        
        // Agrego un botón sin acción
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // Muestro la alerta
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func funcionalidadBotonDialogo2(_ sender: UIButton)
    {
        // create the alert
        let alert = UIAlertController(title: "Diálogo con 2 botones", message: "Mensaje diálogo con dos botones estilo ActionSheet", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Continuar", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func funcionalidadBotonDialogo3(_ sender: UIButton)
    {
        // create the alert
        let alert = UIAlertController(title: "Diálogo con 3 botones", message: "Mensaje diálogo con 3 botones", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Recordar mañana", style: UIAlertActionStyle.destructive, handler: { action in
            // Código para cuando se pulse Recordar mañana
            print("Pulsado recordar mañana")
        }))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func funcionalidadBotonDialogoTexto(_ sender: UIButton)
    {
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "Diálogo", message: "Introduce un texto", preferredStyle: UIAlertControllerStyle.alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        
        //Create and an option action
        let nextAction: UIAlertAction = UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default) { (action: UIAlertAction) in
            if let alertTextField = actionSheetController.textFields?.first, alertTextField.text != nil
            {
                print("Has escrito... \(alertTextField.text!)")
            }
        }
        actionSheetController.addAction(nextAction)
        
        //Add a text field
        actionSheetController.addTextField
        {
            textField -> Void in
            //TextField configuration
            textField.textColor = UIColor.blue
        }
        
        //Present the AlertController
        self.present(actionSheetController, animated: true, completion: nil)
        
    }
    
    @IBAction func funcionalidadBotonSnackbar1(_ sender: UIButton)
    {
        let message = MDCSnackbarMessage()
        message.text = "Este texto está en un Snackbar"
        MDCSnackbarManager.show(message)
    }
    
    @IBAction func funcionalidadBotonSnackbar2(_ sender: UIButton)
    {
        let message = MDCSnackbarMessage()
        message.text = "Este texto está en un Snackbar y tiene una acción"
        let action = MDCSnackbarMessageAction()
        let actionHandler = {() in
            print("Se ha pulsado la acción")
        }
        action.handler = actionHandler
        action.title = "OK"
        message.action = action
        MDCSnackbarManager.show(message)
    }
    
    
    
    
}

