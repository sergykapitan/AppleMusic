//
//  DetailViewController.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//


import UIKit
import Foundation


class DetailViewController: UIViewController {
    //MARK: - Property
  
    let detailView = DetailViewCode()
    var viewModel: DetailViewModel
    
    //MARK: - LifiCicle
    override func loadView() {
        super.loadView()
        view = detailView
    
    }
    override func viewDidLoad() {
            super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        viewModel.fetchTrack()
            
        }
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
//    func setTrack(viewModel: DetailViewModel) {
//
//        detailView.configureDetailView(trackTitle: , author: viewModel.artistName)
//
//
//        guard let url = URL(string: viewModel.iconUrlString ?? "") else { return }
//       // trackImageView.sd_setImage(with: url, completed: nil)
//    }
    
    
}
extension DetailViewController: DetailViewModelProtocol {
    
    func fetchingResult(_ isNeedToUpdateView: Bool, errorDescription: String?) {
        guard errorDescription == nil else {
            DispatchQueue.main.async {
             
            }
            return }
        if isNeedToUpdateView {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
              //  setTrack(viewModel: )
       
            }
        } else {
            DispatchQueue.main.async {
                
            }
        }
    }
}
