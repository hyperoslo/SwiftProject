import Brick

extension StringConvertible where Self : RawRepresentable, Self.RawValue == String {

  var string: String {
    return self.dashed
  }

  var dashed: String {
    return transformedString(self.rawValue, delimiter: "-")
  }

  func transformedString(_ string: String, delimiter: String) -> String {
    let regex = try! NSRegularExpression(pattern: "(?<=[a-z])([A-Z])|([A-Z])(?=[a-z])", options: [])
    let range = NSRange(location: 1, length: string.characters.count-1)
    let dashedPropertyName = regex.stringByReplacingMatches(
      in: string,
      options: [],
      range: range,
      withTemplate: "\(delimiter)$1$2")

    return dashedPropertyName.lowercased()
  }
}
