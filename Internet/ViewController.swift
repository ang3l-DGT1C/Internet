//
//  ViewController.swift
//  Internet
//
//  Created by Ángel González on 03/02/23.
//

import UIKit
import WebKit


class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var actInd : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let ad = UIApplication.shared.delegate as! AppDelegate
        var mensaje = ""
        if ad.internetStatus {
            mensaje = "La conexion a Internet es " + ad.internetType
            // Hacemos la carga del contenido HTML
            //1. Creamos la URL del contenido
            let urlString = "http://manualweb.net/html/introduccion-html/"
            //guard let laUrl = URL(string: urlString) else { return }
            
            // Implementación para mostrar archivos locales
            guard let laUrl = Bundle.main.url(forResource:"entrenamiento_anaeróbico", withExtension: "pdf") else { return }
            
            //2. creamos el request que se va a enviar
            let request = URLRequest(url : laUrl)
            webView.load(request)
        }
        else {
            mensaje = "No hay conexión a Internet"
        }
        let ac = UIAlertController(title: "hola", message: mensaje, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default) {
                alertaction in
                // Este codigo se ejecutará cuando el usuario toque el botón
        }
        ac.addAction(action)
        self.actInd.stopAnimating()
        self.present(ac, animated: true)
    }
}

