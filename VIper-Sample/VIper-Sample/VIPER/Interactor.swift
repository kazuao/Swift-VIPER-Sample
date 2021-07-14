//
//  Interactor.swift
//  VIper-Sample
//
//  Created by k-aoki on 2021/07/14.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func getUsers()
}

class UserInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getUsers() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let _self = self else { return }
            
            guard let data = data, error == nil else {
                
                _self.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            
            do {
                let entities = try JSONDecoder().decode([User].self, from: data)
                _self.presenter?.interactorDidFetchUsers(with: .success(entities))
//
            } catch {
                _self.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
            }
        }
        
        task.resume()
    }
}
