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
    guard !isEmpty else {
      return self
    }

    var string = self
    string.replaceSubrange(string.startIndex...string.startIndex,
                           with: String(string[string.startIndex]).capitalized)

    return string
  }

  func withPrefix(of prefix: Any.Type) -> String {
    return String(describing: prefix) + self
  }

  func dashed() -> String {
    return separated(by: "-")
  }

  func separated(by delimiter: String) -> String {
    let regex = try? NSRegularExpression(
      pattern: "(?<=[a-z])([A-Z])|([A-Z])(?=[a-z])",
      options: [])

    let range = NSRange(location: 1, length: self.characters.count - 1)

    let transformed = regex?.stringByReplacingMatches(
      in: self,
      options: [],
      range: range,
      withTemplate: "\(delimiter)$1$2")

    return transformed ?? self
  }

  var unescaped: String {
    return replacingOccurrences(of: "\\/", with: "/")
  }
}
