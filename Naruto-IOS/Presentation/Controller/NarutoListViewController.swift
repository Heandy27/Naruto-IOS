//
//  NarutoListViewController.swift
//  Naruto-IOS
//
//  Created by Andy Heredia on 13/9/24.
//

import UIKit

final class NarutoListViewController: UITableViewController {
    
    // MARK: - Table View DataSource
    /// - DataSource: Provee datos y celdas al tableview
    /// typealias: Te permite crear tipos para no repetir muchas veces, creamos un tipo que contiene la clase UITableview............
    /// Creamos un generico:  Identificar a cada una de nuestras celdas Int, el siguiente es que
    /// Tipo de datos que queremos representar en nuestro TableView "Clan"
    typealias DataSource = UITableViewDiffableDataSource<Int, Clan>
    // MARK:  Snapshot
    /// Una representacion de los estado de los datos en una vista especifica en el tiempo
    /// Nos sirve para actaulizar los datos una vez los tengamos preparados, puede ser en una api o local
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Clan>
    
    // MARK: - Model
    /// Creamos una lista vacia que solo añadira elementos que sea de tipo "Clan"
    private let clans: [Clan] = Clan.allCases
    /// Es opcional por que inicialmente no le damos valor, para que no pete
    private var datasource: DataSource?
    
    
    
    // MARL: - Lifecycle 
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        tableView.register(UINib(nibName: NarutoTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: NarutoTableViewCell.identifier)
        
        datasource = DataSource(tableView: tableView, cellProvider: { tableView, indexPath, clan in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NarutoTableViewCell.identifier, for: indexPath) as? NarutoTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: clan)
            return cell
        })
        tableView.dataSource = datasource
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(clans)
        datasource?.apply(snapshot)
        // Imprimir la data! :D
        NetworkModel.shared.getAllCharacters { result in
            switch result {
            case let .success(characters):
                print(characters)
            case let .failure(error):
                print(error)
            }
        }

    }
    
    
}


extension NarutoListViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let houseIndexPath = clans[indexPath.row]
        let narutoDetailVC = NarutoDetailUIViewController(clanes: houseIndexPath)
        navigationController?.show(narutoDetailVC, sender: self)
    }
    
}
