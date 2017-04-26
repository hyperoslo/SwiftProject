import Foundation
import Malibu

enum Endpoint: RequestConvertible {

  static var baseUrl: URLStringConvertible? {
    return ""
  }

  static var headers: [String : String] = [
    "Accept": "application/json"
  ]

  var request: Request {
    return Request.get("")
  }
}

struct NetworkingProvider {
  let base: Networking<Endpoint>
}
