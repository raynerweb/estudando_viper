//
//  SprintClient.swift
//  EstudandoViper
//
//  Created by rayner on 26/06/21.
//

import Foundation
import RxSwift
import RxAlamofire

struct SprintClient {
    
    static let kBaseURL = "https://scrum-deck-backend.herokuapp.com"
    
    static func get() -> Observable<[Sprint]> {
        return RxAlamofire.requestDecodable(.get, "\(kBaseURL)/sprint")
            .map { (response, sprints: [Sprint]) in return sprints }
    }
    
}
