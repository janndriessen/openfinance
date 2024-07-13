//
//  OFApi.swift
//  openfinance
//
//  Created by Jann Driessen on 13.07.24.
//

import BasedUtils
import Foundation

enum OFApiError: Error {
    case notFound
    case invalidConfig
    case unknown
}

class OFApi {

    internal let baseUrl: String = "http://localhost:3000"

    // MARK: - GET /balance

    struct BalanceResponse: Decodable {
        let balance: String
        let symbol: String
    }

    func getBalance(for symbol: String, account: String) async throws -> String {
        guard let url = URL(string: "\(baseUrl)/balance/\(symbol.lowercased())?account=\(account))") else { throw OFApiError.invalidConfig }
        let request = try createGetRequest(url: url)
        let (data, res) = try await URLSession.shared.data(for: request)
        if let httpResponse = res as? HTTPURLResponse {
            let statusCode = httpResponse.statusCode
            print("error \(httpResponse.statusCode)")
            if statusCode == 404 {
                throw OFApiError.notFound
            }
            if statusCode < 200 || statusCode > 299 {
                print("Error fetching account data")
                throw OFApiError.unknown
            }
        }
        let balance = try JSONDecoder().decode(BalanceResponse.self, from: data)
        return balance.balance
    }

    // MARK: - GET /price

    struct PriceResponse: Decodable {
        let price: String
        let symbol: String
    }

    func getPrice(symbol1: String, symbol2: String) async throws -> String {
        guard let url = URL(string: baseUrl + "/price/\(symbol1)/\(symbol2)") else { throw OFApiError.invalidConfig }
        let request = try createGetRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let res = try JSONDecoder().decode(PriceResponse.self, from: data)
        return res.price
    }

    // MARK: - POST /swap

    struct SwapRequest: Encodable {
        let baseToken: String
        let quoteToken: String
        let amount: String
        let isBuy: Bool
    }

    struct SwapResponse: Decodable {
        let baseToken: String
        let quoteToken: String
        let amount: String
        let isBuy: Bool
    }

    func swap(request: SwapRequest) async throws -> String {
        guard let url = URL(string: baseUrl + "/swap") else { throw OFApiError.invalidConfig }
        let request = try createPostRequest(url: url, params: request)
        let (data, _) = try await URLSession.shared.data(for: request)
        let res = try JSONDecoder().decode(SwapResponse.self, from: data)
        return res.amount
    }

    // MARK: - Internal

    internal func createGetRequest(url: URL) throws -> URLRequest {
        print(url.absoluteString)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        return request
    }

    internal func createPostRequest<T: Encodable>(url: URL, params: T) throws -> URLRequest {
        print(url.absoluteString)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        request.httpBody = try JSONEncoder().encode(params)
        return request
    }
}
