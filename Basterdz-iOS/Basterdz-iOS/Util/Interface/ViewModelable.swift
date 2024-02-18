//
//  ViewModelable.swift
//  Basterdz-iOS
//
//  Created by 현수빈 on 2/17/24.
//
import Combine

protocol ViewModelable: ObservableObject {
  associatedtype Action
  associatedtype State
  
  var state: State { get }
  
  func action(_ action: Action)
}
