//  Created by Axel Ancona Esselmann on 10/14/23.
//

import Foundation

public extension Bundle {
    var appName: String {
        bundleIdentifier?.components(separatedBy: ".").last ?? ""
    }
}
