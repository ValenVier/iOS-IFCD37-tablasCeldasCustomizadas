//
//  ViewController.swift
//  tablasCeldasCustomizadas
//
//  Created by Javier Rodríguez Valentín on 27/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var array = ["item1","item2","item3","item4", "item5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        
        table.delegate = self //para incluir acciones en tablas
        
        table.tableFooterView = UIView() //para no ver líneas fuera de la tabla
        
        //MARK: nibName
        //el nibname es el nombre de3l archivo donde hemos creado la celda
        table.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
}

//con el comentario con mark hacemos que se pueda buscar las palabras de después del comentario en la jerarquía de busqueda, hacemos marcas de busqueda
//MARK: extensión DataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count //tantos items como tenga el array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
        cell?.label.text = array[indexPath.row]
        
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3 //repite toda la tabla 3 veces
    }
    
    //la siguiente función nos da la altura de cada celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80
        }else if indexPath.section == 1{
            return 120
        }else{
            return UITableView.automaticDimension //nos devuelve un tamaño automático
        }
    }
    
    //MARK: Cabecera y footer
    //título de la cabecera
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Sección: \(section)"
        
        //en el mainStoryBoard al seleccionar la tabla en la parte del style podemos cambiarlo. con plain nos deja la cabecera de la sección mostrada encima de la tabla constantemente hasta que el último elemento de la tabla se haya sacado de la pantalla, en cuyo caso se pone la seccion siguiente
    }
    
    //altura de la cabecera
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 20
        }else if section == 1{
            return 40
        }else{
            return 60
        }
    }
    
    //crear una vista en el header -> no funciona bien
    //esta función no es muy útil porque no hace lo que le ponemos ya que gobierna la tabla que tiene ya unos valores
   /* func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        if section == 1{
        let view = UIView(frame:CGRect(x:10, y:10, width:10, height:10))
        view.backgroundColor = .red
        return view
        }else{
            return nil
        }
    }*/
    
    //título de footer
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "El footer de sección: \(section)"
    }
    
    //altura del footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0{
            return 20
        }else if section == 1{
            return 40
        }else{
            return 60
        }
    }
    
}

//MARK: Extensión delegate
extension ViewController: UITableViewDelegate { //acciones en tabla
    
    //accion cuando seleccionamos una fila
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Has seleccionado: \(array[indexPath.row])")
    }
}



