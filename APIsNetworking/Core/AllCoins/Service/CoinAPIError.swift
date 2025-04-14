//
//  CoinAPIError.swift
//  APIsNetworking
//
//  Created by Manyuchi, Carrington C on 2025/04/14.
//

import Foundation

enum CoinAPIError: Error {
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData:
            return "Invalid data returned by the API."
        case .jsonParsingFailure:
            return "Failed to parse JSON data."
        case .requestFailed(let description):
            return "Request Failed: \(description)"
        case .invalidStatusCode(statusCode: let statusCode):
            return "Invalid status code: \(statusCode)."
        case .unknownError(error: let error):
            return "Unknown Error occured: \(error.localizedDescription)"
        }
    }
}
