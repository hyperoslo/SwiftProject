import Spots

public struct SpotsConfigurator: Configurable {

  public func configure() {
    Spots.Controller.configure = {
      $0.backgroundColor = UIColor.clear
    }

    ListSpot.configure = { tableView in
      let inset: CGFloat = 15

      tableView.backgroundColor = UIColor.clear
      tableView.layoutMargins = UIEdgeInsets.zero
      tableView.tableFooterView = UIView(frame: CGRect.zero)
      tableView.separatorInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
      tableView.separatorStyle = .none
    }

    // Lists
    // ListSpot.register(defaultView: TableCell.self)
    // ListSpot.register(header: TableHeader.self, identifier: HeaderIdentifier.header)
    // ListSpot.register(view: MenuTableCell.self, identifier: ViewIdentifier.menu)
    
    // Grids
    // GridSpot.register(header: GridHeader.self, identifier: HeaderIdentifier.header)
    // GridSpot.register(view: MenuGridCell.self, identifier: ViewIdentifier.menu)

    // Carousels
    // CarouselSpot.register(view: MenuCarouselCell.self, identifier: ViewIdentifier.menu)
  }
}
