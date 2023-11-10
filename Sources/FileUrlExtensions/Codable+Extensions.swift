//  Created by Axel Ancona Esselmann on 9/28/23.
//

import Foundation

public extension Decodable {
    init(url: URL, decoder: JSONDecoder = DefaultEncoders.decoder) throws {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        self = try decoder.decode(Self.self, from: data)
    }
}

public extension Encodable {
    func save(to url: URL, encoder: JSONEncoder = DefaultEncoders.encoder) throws {
        let data = try encoder.encode(self)
        try data.write(to: url)
    }
}

public struct DefaultEncoders {
    public static var encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()

    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
