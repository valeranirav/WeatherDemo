//
//  NVRequestHandler.swift
//  NVWeatherStack
//

import Foundation

/// `NVRequestHandler` handles the result of the request

class NVRequestHandler {

    /**
        Handles the response data of the request

        - parameter completion: The closure called when the `Data` parsing using `NVParserHelper` is completed

        - returns: A closure which takes one argument: NVResult enum
    */
    func networkResult<T: Decodable> (
        completion: @escaping ((Result<T, NVError>) -> Void)) -> ((Result<Data, NVError>) -> Void
        ) {
        return { dataResult in
            DispatchQueue.global(qos: .background).async(execute: {
                switch dataResult {
                case .success(let data) :
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(T.self, from: data)
                        completion(.success(result))
                    } catch {
                        print("Error: \(error.localizedDescription)")
                        completion(.failure(.decode(string: "Decoding the data error: " + error.localizedDescription)))
                    }

                case .failure(let error) :
                    print("Network error \(error)")
                    completion(.failure(.network(string: "Network error " + error.localizedDescription)))
                }
            })
        }
    }
}
