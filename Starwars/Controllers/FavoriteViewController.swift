//
//  FavoriteController.swift
//  Starwars
//
//  Created by Mohamed Brahem on 25/04/2023.
//

import Foundation
import UIKit
import Apollo
import ApolloAPI
import SnapKit
import Combine

final class FavoriteViewController : UIViewController {
    
    // MARK: - Properties
    
    private let viewModal = FavoriteViewModal(mainQueue: .main, filmsClient: GraphQLClient(client: Network.shared.apolloClient, error: nil, performResponses: [:], fetchResponses: [:]))
    public var disposables = Set<AnyCancellable>()

    
    private lazy var view1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    private lazy var view2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        return view
    }()
    
    private lazy var view3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Favorite"
        
        viewModal.inputs.fetchFilms()
        setupBindings()
    }
    
    // MARK: - Setup
    
    private func setupBindings() {
        viewModal.outputs.films
            .sink { [weak self] in
                // populate videw with reveived value
                print($0)
            }
            .store(in: &disposables)
    }
    
    /*private func layout() {
        view.addSubview(view1)
        view1.snp.makeConstraints{ (maker) in
            maker.left.equalToSuperview()
            maker.height.equalTo(view1.snp.width)
            maker.centerY.equalToSuperview()
        }
        
        view.addSubview(view2)
        view2.snp.makeConstraints{ (maker) in
            maker.left.equalTo(view1.snp.right)
            maker.height.equalTo(view2.snp.width)
            maker.width.equalTo(view1)
            maker.centerY.equalToSuperview()
        }
        
        view.addSubview(view3)
        view3.snp.makeConstraints{ (maker) in
            maker.left.equalTo(view2.snp.right)
            maker.height.equalTo(view3.snp.width)
            maker.right.equalToSuperview()
            maker.width.equalTo(view2)
            maker.centerY.equalToSuperview()
        }
    }*/

}
