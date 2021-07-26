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
    }
    
    // vlaues
    struct State {
        var value: Int = 0
    }
    
    let initialState: State = State()
    
    // return Observable
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .increase:
            return Observable.just(Mutation.increaseValue)
        case .decrease:
            return Observable.just(Mutation.decreraseValue)
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
        }
        return newState
    }
}
