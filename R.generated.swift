//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 3 colors.
  struct color {
    /// Color `flat_gray`.
    static let flat_gray = Rswift.ColorResource(bundle: R.hostingBundle, name: "flat_gray")
    /// Color `flat_red`.
    static let flat_red = Rswift.ColorResource(bundle: R.hostingBundle, name: "flat_red")
    /// Color `flat_refresh_gray`.
    static let flat_refresh_gray = Rswift.ColorResource(bundle: R.hostingBundle, name: "flat_refresh_gray")
    
    /// `UIColor(named: "flat_gray", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func flat_gray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.flat_gray, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "flat_red", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func flat_red(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.flat_red, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "flat_refresh_gray", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func flat_refresh_gray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.flat_refresh_gray, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 4 images.
  struct image {
    /// Image `ic_add`.
    static let ic_add = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_add")
    /// Image `ic_edit`.
    static let ic_edit = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_edit")
    /// Image `ic_love`.
    static let ic_love = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_love")
    /// Image `ic_trash`.
    static let ic_trash = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_trash")
    
    /// `UIImage(named: "ic_add", bundle: ..., traitCollection: ...)`
    static func ic_add(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_add, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_edit", bundle: ..., traitCollection: ...)`
    static func ic_edit(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_edit, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_love", bundle: ..., traitCollection: ...)`
    static func ic_love(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_love, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_trash", bundle: ..., traitCollection: ...)`
    static func ic_trash(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_trash, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 3 nibs.
  struct nib {
    /// Nib `AddItemDialog`.
    static let addItemDialog = _R.nib._AddItemDialog()
    /// Nib `ListItemHeader`.
    static let listItemHeader = _R.nib._ListItemHeader()
    /// Nib `ListItemTableViewCell`.
    static let listItemTableViewCell = _R.nib._ListItemTableViewCell()
    
    /// `UINib(name: "AddItemDialog", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.addItemDialog) instead")
    static func addItemDialog(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.addItemDialog)
    }
    
    /// `UINib(name: "ListItemHeader", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.listItemHeader) instead")
    static func listItemHeader(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.listItemHeader)
    }
    
    /// `UINib(name: "ListItemTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.listItemTableViewCell) instead")
    static func listItemTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.listItemTableViewCell)
    }
    
    static func addItemDialog(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> AddItemDialog? {
      return R.nib.addItemDialog.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? AddItemDialog
    }
    
    static func listItemHeader(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UITableViewCell? {
      return R.nib.listItemHeader.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UITableViewCell
    }
    
    static func listItemTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ListItemTableViewCell? {
      return R.nib.listItemTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ListItemTableViewCell
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 2 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `ListItemHeader`.
    static let listItemHeader: Rswift.ReuseIdentifier<UIKit.UITableViewCell> = Rswift.ReuseIdentifier(identifier: "ListItemHeader")
    /// Reuse identifier `ListItemTableViewCell`.
    static let listItemTableViewCell: Rswift.ReuseIdentifier<ListItemTableViewCell> = Rswift.ReuseIdentifier(identifier: "ListItemTableViewCell")
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 3 storyboards.
  struct storyboard {
    /// Storyboard `EditItem`.
    static let editItem = _R.storyboard.editItem()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `ListItem`.
    static let listItem = _R.storyboard.listItem()
    
    /// `UIStoryboard(name: "EditItem", bundle: ...)`
    static func editItem(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.editItem)
    }
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "ListItem", bundle: ...)`
    static func listItem(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.listItem)
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
    try nib.validate()
  }
  
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _AddItemDialog.validate()
    }
    
    struct _AddItemDialog: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "AddItemDialog"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> AddItemDialog? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? AddItemDialog
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "ic_add", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_add' is used in nib 'AddItemDialog', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct _ListItemHeader: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = UIKit.UITableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "ListItemHeader"
      let name = "ListItemHeader"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UITableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UITableViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _ListItemTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = ListItemTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "ListItemTableViewCell"
      let name = "ListItemTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ListItemTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ListItemTableViewCell
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try editItem.validate()
      try launchScreen.validate()
      try listItem.validate()
    }
    
    struct editItem: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let editItemViewControllerID = StoryboardViewControllerResource<EditItemViewController>(identifier: "EditItemViewControllerID")
      let name = "EditItem"
      
      func editItemViewControllerID(_: Void = ()) -> EditItemViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: editItemViewControllerID)
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "ic_edit", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_edit' is used in storyboard 'EditItem', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
        }
        if _R.storyboard.editItem().editItemViewControllerID() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'editItemViewControllerID' could not be loaded from storyboard 'EditItem' as 'EditItemViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct listItem: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = ListItemViewController
      
      let bundle = R.hostingBundle
      let listItemViewControllerID = StoryboardViewControllerResource<ListItemViewController>(identifier: "ListItemViewControllerID")
      let name = "ListItem"
      
      func listItemViewControllerID(_: Void = ()) -> ListItemViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: listItemViewControllerID)
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "ic_add", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_add' is used in storyboard 'ListItem', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
        }
        if _R.storyboard.listItem().listItemViewControllerID() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'listItemViewControllerID' could not be loaded from storyboard 'ListItem' as 'ListItemViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
