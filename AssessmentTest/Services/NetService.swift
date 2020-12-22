//
//  NetService.swift
//  AssessmentTest
//
//  Created by Artem on 22.12.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import Foundation

final class NetService {
    
    static let sharedInstanse: NetService = NetService()
    private let queue = DispatchQueue(label: "NetQueue", qos: .utility)
    
    func getData(with url: URL, completion: @escaping (Data?, Error?) -> Void) {
        let configuration = URLSessionConfiguration.default
        configuration.urlCredentialStorage = nil
        let session = URLSession(configuration: .default)
        self.queue.async {
            session.dataTask(with: url) {(data, response, error) in
                DispatchQueue.main.async {
                    completion(data, error)
                }
            } .resume()
        }
    }
    
}
