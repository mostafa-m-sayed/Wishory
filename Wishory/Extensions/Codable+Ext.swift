//
//  Codable+Ext.swift
//  Wishory
//
//  Created by Mostafa Sayed on 03/11/2024.
//


import Foundation

extension Encodable {
    func encode() -> Data? {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return try? encoder.encode(self)
    }
}

extension Sequence {
    func getData() -> Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }

    func getArchived() -> Data? {
        let archivedData = try? NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
        return archivedData
    }

    func getObject<T: Decodable>() -> T? {
        guard
            let data = getData() else { return nil }
        return data.getObject()
    }
}

extension UserDefaults {
    func saveObject<T: Codable>(rawData: T, forKey key: String) {
        do {
            let encoded = try JSONEncoder().encode(rawData)
            UserDefaults.standard.set(encoded, forKey: key)
        }
        catch {
            print(error)
        }
    }

    func getObject<T: Decodable>(key: String) -> T? {
        guard let data = UserDefaults.standard.object(forKey: key) as? Data else { return nil }
        return data.getObject()
    }
}

extension Data {
    func getObject<T: Decodable>() -> T? {
        do {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            let parsedData = try decoder.decode(T.self, from: self)
            return parsedData
        }
        catch {
            print(error)
        }
        return nil
    }
}

extension Encodable {
  func asDictionary() throws -> [String: Any] {
    let data = try JSONEncoder().encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      throw NSError()
    }
    return dictionary
  }
}

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
