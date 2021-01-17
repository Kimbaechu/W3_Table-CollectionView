//
//  MainViewController.swift
//  W3_TableView
//
//  Created by Beomcheol Kwon on 2021/01/13.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController {
    
    let colorData = createRandomColorData(items: 3)
    
    private let tableView = UITableView(frame: .zero, style: .grouped).then {
        $0.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        $0.register(ADTableViewCell.self, forCellReuseIdentifier: ADTableViewCell.identifier)
        $0.register(ColorTableViewCell.self, forCellReuseIdentifier: ColorTableViewCell.identifier)
        $0.separatorStyle = .none
        
        //        $0.rowHeight = 110
        $0.rowHeight = UITableView.automaticDimension
//        $0.estimatedRowHeight = 110
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

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return colorData.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: ColorTableViewCell.identifier, for: indexPath) as! ColorTableViewCell
            
            cell.colorView.backgroundColor = colorData[indexPath.row]
            
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        
        case 1, 2:
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50)).then {
                $0.backgroundColor = .darkGray
            }
            
            let label = UILabel().then {
                $0.font = .boldSystemFont(ofSize: 20)
                $0.text = "Header"
            }
            
            headerView.addSubview(label)
            
            label.snp.makeConstraints {
                $0.left.equalTo(headerView.snp.left).offset(20)
                $0.centerY.equalTo(headerView)
            }
            
            return headerView
            
        default:
            return nil
        }
        
    }
    //
    //    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //
    //        let footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 20)).then {
    //            $0.backgroundColor = .systemBackground
    //        }
    //
    //        let label = UILabel().then {
    //            $0.font = .boldSystemFont(ofSize: 24)
    //            $0.text = "Footer"
    //        }
    //
    //        footerView.addSubview(label)
    //
    //        label.snp.makeConstraints {
    //            $0.left.equalTo(footerView.snp.left).offset(20)
    //            $0.centerY.equalTo(footerView)
    //        }
    //
    //        return footerView
    //    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1, 2:
            return 50
            
        default:
            return 0
        }
    }
    
    //    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    //        return 20
    //    }
}
