//
//  ViewController.swift
//  Salvar Anotacoes
//
//  Created by Adriano Kaito on 05/12/18.
//  Copyright © 2018 AK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textoTextView: UITextView!
    let chaveAnotacao = "anotacao"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textoRecuperado = self.recuperarDados()
        textoTextView.text = textoRecuperado
    }

    @IBAction func salvarAnotacao(_ sender: Any) {
        if let texto = textoTextView.text {
            self.salvarDados(texto: texto)
        }
    }
    
    func salvarDados(texto: String) {
        UserDefaults.standard.set("texto", forKey: chaveAnotacao)
        esconderTeclado()
        print(texto)
    }
    
    func recuperarDados() -> String {
        let textoRecuperado = UserDefaults.standard.object(forKey: chaveAnotacao)
        if textoRecuperado != nil {
            return textoRecuperado as! String
        } else {
            return ""
        }
    }
    
    func esconderTeclado() {
        view.endEditing(true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        esconderTeclado()
    }
}

