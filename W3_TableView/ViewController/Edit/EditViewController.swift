//
//  EditViewController.swift
//  W3_TableView
//
//  Created by Beomcheol Kwon on 2021/01/13.
//

import UIKit
import SnapKit
import Then

class EditViewController: UIViewController {
    
    var colorData0 = createRandomColorData(items: 3)
    var colorData1 = createRandomColorData(items: 3)
    var colorData2 = createRandomColorData(items: 3)
    
    private let tableView = UITableView(frame: .zero, style: .grouped).then {
        $0.register(EditTableViewCell.self, forCellReuseIdentifier: EditTableViewCell.identifier)
        $0.register(ColorTableViewCell.self, forCellReuseIdentifier: ColorTableViewCell.identifier)
        $0.separatorStyle = .none
        $0.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        createUI()
    }
    
    private func createUI() {
        self.navigationItem.title = "Colors"
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
    }
}

extension EditViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return colorData0.count
        case 1:
            return colorData1.count
        case 2:
            return colorData2.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EditTableViewCell.identifier, for: indexPath) as! EditTableViewCell
        
       
        switch indexPath.section {
        case 0:
            cell.colorView.backgroundColor = colorData0[indexPath.row]
           
        case 1:
            cell.colorView.backgroundColor = colorData1[indexPath.row]

        case 2:
            cell.colorView.backgroundColor = colorData2[indexPath.row]
         
        default:
            return UITableViewCell()
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title:  "Delete", handler: { [weak self] (ac: UIContextualAction, view: UIView, success: (Bool) -> Void) in
            
            switch indexPath.section {
            case 0:
                self?.colorData0.remove(at: indexPath.row)
               
            case 1:
                self?.colorData1.remove(at: indexPath.row)

            case 2:
                self?.colorData2.remove(at: indexPath.row)
             
            default:
                print("error")
            }
            tableView.reloadData()
            
          
        })

        deleteAction.image = UIImage(systemName: "trash")
        
        return UISwipeActionsConfiguration(actions:[deleteAction])
    }
}

