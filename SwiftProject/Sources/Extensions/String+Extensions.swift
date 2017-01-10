import Foundation
import Fashion

extension String {

  func styleKey(prefix: Any.Type) -> String {
    return self.uppecaseFirst()
      .withPrefix(of: prefix)
      .replace(String(describing: Fashion.Stylesheet), with: "")
      .dashed()
      .lowercased()
  }

  func uppecaseFirst() -> String {
    guard isPresent else { return self }

    var string = self
    string.replaceSubrange(string.startIndex...string.startIndex,
                           with: String(string[string.startIndex]).capitalized)

    return string
  }

  func withPrefix(of: Any.Type) -> String {
    return String(describing: of) + self
  }

  func dashed() -> String {
    let regex = try! NSRegularExpression(pattern: "(?<=[a-z])([A-Z])|([A-Z])(?=[a-z])", options: [])
    let range = NSRange(location: 1, length: self.characters.count-1)
    let snakeCase = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "-$1$2")

    return snakeCase
  }

  var unescaped: String {
    return replacingOccurrences(of: "\\/", with: "/")
  }
}
