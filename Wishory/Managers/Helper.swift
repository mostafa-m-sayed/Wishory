//
//  Helper.swift
//  Wishory
//
//  Created by Mostafa Sayed on 03/11/2024.
//


/// Generic Helpers
final class Helper {
    static let shared = Helper()

    private init() {}

    func getMessageFromError(_ error: Error) -> String {
        let errorMessage: String
            if case let NetworkManager.NetworkError.decodingError(message) = error {
                errorMessage =  message
                print(message)
            } else if case let NetworkManager.NetworkError.serverError(message) = error {
                errorMessage =  message
            } else {
                errorMessage = error.localizedDescription
            }
        return errorMessage
    }

    func printLineSeparator() {
        print("""
              - - - - - - - - - - - - - - - - - - - - - - - - -
              """)
   }
}
