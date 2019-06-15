//
//  Result.swift
//  Pokedex
//
//  Created by Luis Alberto Zagonel Pozenato on 15/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

#if swift(>=5.0)
#else
enum Result<Success, Failure> where Failure : Error {
    
    /// A success, storing a `Success` value.
    case success(Success)
    
    /// A failure, storing a `Failure` value.
    case failure(Failure)
}
#endif
