import Fashion

public struct FashionConfigurator: Configurable {

  public func configure() {
    let stylesheets: [Stylesheet] = [
      SystemStylesheet(),
      MainStylesheet()
    ]

    Fashion.register(stylesheets: stylesheets)
  }
}
