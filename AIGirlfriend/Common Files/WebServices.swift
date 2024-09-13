//
//  WebServices.swift
//  AIGirlfriend
//
//  Created by Netset on 22/07/24.
//

import Foundation
import Combine
import Alamofire

class NetworkManager {
    
    static var shared: NetworkManager {
        return NetworkManager()
    }
    fileprivate init(){}
    
    // MARK: - Private Methods
    func headers() -> [String:String] {
        var headersVal = [
            Param.deviceId:Constants.AppInfo.DeviceId,
            Param.deviceType:Param.ios,
            Param.appVersion:Constants.AppInfo.appVersion,
            Param.contentType:Param.appJson,
            Param.requestFrom:Param.passenger,
            Param.appVersionPassenger:Constants.AppInfo.appVersion,
            Param.timeZone:"\(TimeZone.current.identifier)"
        ]
        return headersVal
    }
    
    func isInternetWorking() -> Bool {
        if NetworkReachabilityManager()!.isReachable {
            return true
        } else {
            return false
        }
    }
    
    
    // MARK: - Public Methods
    func getData<T: Decodable>(_ urlStr: String, method: HTTPMethod = .get, responseType: T.Type) -> AnyPublisher<T, NetworkError> {
        guard let url = URL(string: "\(urlStr)") else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        return Future { promise in
            AF.request(url, method: method, headers: HTTPHeaders(self.headers())).responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    promise(.success(data))
                case .failure(let error):
                    print("Error in getData: \(error)")
                    promise(.failure(NetworkError.decodingError))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func postData<T: Decodable>(_ urlStr: String, parameters: [String: Any], method: HTTPMethod = .post, responseType: T.Type) -> AnyPublisher<T, NetworkError> {
        guard let url = URL(string: "\(urlStr)") else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        return Future { promise in
            AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: HTTPHeaders(self.headers())).responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    promise(.success(data))
                case .failure(let error):
                    print("Error in postData: \(error)")
                    promise(.failure(NetworkError.decodingError))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
