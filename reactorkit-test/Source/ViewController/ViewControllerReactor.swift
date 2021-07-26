//
//  ViewControllerReactor.swift
//  reactorkit-test
//
//  Created by 김부성 on 2021/07/25.
//

import ReactorKit

class ViewControllerReactor: Reactor {
    
    // user action
    enum Action {
        case increase
        case decrease
    }
    
    // state change
    enum Mutation {
        case increaseValue
        case decreraseValue
        case setLoading(Bool)
    }
    
    // vlaues
    struct State {
        var value: Int = 0
        var isLoading: Bool = false
    }
    
    let initialState: State = State()
    
    // return Observable
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .increase:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                Observable.just(Mutation.increaseValue).delay(.seconds(1), scheduler: MainScheduler.instance),
                Observable.just(Mutation.setLoading(false))
            ])
        case .decrease:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                Observable.just(Mutation.decreraseValue).delay(.seconds(1), scheduler: MainScheduler.instance),
                Observable.just(Mutation.setLoading(false))
            ])
        }
    }
    
    // update State
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .increaseValue:
            newState.value += 1
        case .decreraseValue:
            newState.value -= 1
        case .setLoading(let isLoading):
            newState.isLoading = isLoading
        }
        
        return newState
    }
}
