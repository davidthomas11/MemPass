// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift

import UIKit

struct R {
  static func validate() {
    storyboard.launchScreen.validateImages()
    storyboard.launchScreen.validateViewControllers()
    storyboard.main.validateImages()
    storyboard.main.validateViewControllers()
  }
  
  struct file {
    static var shareTechMonoTtf: NSURL? { return _R.hostingBundle?.URLForResource("Share-TechMono", withExtension: "ttf") }
    static var zrnicTtf: NSURL? { return _R.hostingBundle?.URLForResource("zrnic", withExtension: "ttf") }
  }
  
  struct font {
    static func shareTechMono(size size: CGFloat) -> UIFont? {
      return UIFont(name: "Share-TechMono", size: size)
    }
    
    static func zrnicRgRegular(size size: CGFloat) -> UIFont? {
      return UIFont(name: "ZrnicRg-Regular", size: size)
    }
  }
  
  struct image {
    static var brain: UIImage? { return UIImage(named: "Brain", inBundle: _R.hostingBundle, compatibleWithTraitCollection: nil) }
    static var hamby: UIImage? { return UIImage(named: "hamby", inBundle: _R.hostingBundle, compatibleWithTraitCollection: nil) }
  }
  
  struct nib {
    static var onBoardingViewController: _R.nib._OnBoardingViewController { return _R.nib._OnBoardingViewController() }
    static var view: _R.nib._View { return _R.nib._View() }
  }
  
  struct reuseIdentifier {
    static var sideBarItem: ReuseIdentifier<SideBarTableViewCell> { return ReuseIdentifier(identifier: "sideBarItem") }
  }
  
  struct segue {
    struct sWRevealViewController {
      static var sw_front: StoryboardSegueIdentifier<SWRevealViewControllerSegueSetController, SWRevealViewController, UINavigationController> { return StoryboardSegueIdentifier(identifier: "sw_front") }
      static var sw_right: StoryboardSegueIdentifier<SWRevealViewControllerSegueSetController, SWRevealViewController, SideBarTableControllerTableViewController> { return StoryboardSegueIdentifier(identifier: "sw_right") }
    }
  }
  
  struct storyboard {
    struct launchScreen {
      static var initialViewController: UIViewController? { return instance.instantiateInitialViewController() }
      static var instance: UIStoryboard { return UIStoryboard(name: "LaunchScreen", bundle: _R.hostingBundle) }
      
      static func validateImages() {
        assert(UIImage(named: "Brain") != nil, "[R.swift] Image named 'Brain' is used in storyboard 'LaunchScreen', but couldn't be loaded.")
      }
      
      static func validateViewControllers() {
        
      }
    }
    
    struct main {
      static var appViewController: ViewController? { return instance.instantiateViewControllerWithIdentifier("appViewController") as? ViewController }
      static var initialViewController: UINavigationController? { return instance.instantiateInitialViewController() as? UINavigationController }
      static var instance: UIStoryboard { return UIStoryboard(name: "Main", bundle: _R.hostingBundle) }
      static var onBoarding: OnBoardingViewController? { return instance.instantiateViewControllerWithIdentifier("onBoarding") as? OnBoardingViewController }
      static var swReveal: SWRevealViewController? { return instance.instantiateViewControllerWithIdentifier("swReveal") as? SWRevealViewController }
      
      static func validateImages() {
        
      }
      
      static func validateViewControllers() {
        assert(appViewController != nil, "[R.swift] ViewController with identifier 'appViewController' could not be loaded from storyboard 'Main' as 'ViewController'.")
        assert(onBoarding != nil, "[R.swift] ViewController with identifier 'onBoarding' could not be loaded from storyboard 'Main' as 'OnBoardingViewController'.")
        assert(swReveal != nil, "[R.swift] ViewController with identifier 'swReveal' could not be loaded from storyboard 'Main' as 'SWRevealViewController'.")
      }
    }
  }
}

struct _R {
  static var hostingBundle: NSBundle? { return NSBundle(identifier: "com.DaveAnthonyThomas.MemPass") }
  
  struct nib {
    struct _OnBoardingViewController: NibResource {
      var instance: UINib { return UINib.init(nibName: "OnBoardingViewController", bundle: _R.hostingBundle) }
      var name: String { return "OnBoardingViewController" }
      
      func firstView(ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]?) -> UIView? {
        return instantiateWithOwner(ownerOrNil, options: optionsOrNil)[0] as? UIView
      }
      
      func instantiateWithOwner(ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]?) -> [AnyObject] {
        return instance.instantiateWithOwner(ownerOrNil, options: optionsOrNil)
      }
    }
    
    struct _View: NibResource {
      var instance: UINib { return UINib.init(nibName: "View", bundle: _R.hostingBundle) }
      var name: String { return "View" }
      
      func firstView(ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]?) -> UIView? {
        return instantiateWithOwner(ownerOrNil, options: optionsOrNil)[0] as? UIView
      }
      
      func instantiateWithOwner(ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]?) -> [AnyObject] {
        return instance.instantiateWithOwner(ownerOrNil, options: optionsOrNil)
      }
      
      func secondView(ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]?) -> UIView? {
        return instantiateWithOwner(ownerOrNil, options: optionsOrNil)[1] as? UIView
      }
    }
  }
}

struct ReuseIdentifier<T>: CustomStringConvertible {
  let identifier: String
  
  var description: String { return identifier }
}

struct StoryboardSegueIdentifier<Segue: UIStoryboardSegue, Source: UIViewController, Destination: UIViewController>: CustomStringConvertible {
  let identifier: String
  
  var description: String { return identifier }
}

struct TypedStoryboardSegueInfo<Segue: UIStoryboardSegue, Source: UIViewController, Destination: UIViewController>: CustomStringConvertible {
  let destinationViewController: Destination
  let identifier: String?
  let segue: Segue
  let sourceViewController: Source
  
  var description: String { return identifier ?? "" }
  
   init?(segue: UIStoryboardSegue) {
    guard let segue = segue as? Segue, sourceViewController = segue.sourceViewController as? Source, destinationViewController = segue.destinationViewController as? Destination else { return nil }
    self.segue = segue
    self.identifier = segue.identifier
    self.sourceViewController = sourceViewController
    self.destinationViewController = destinationViewController
  }
}

protocol NibResource {
  var instance: UINib { get }
  var name: String { get }
}

protocol Reusable {
  typealias T
  
  var reuseIdentifier: ReuseIdentifier<T> { get }
}

extension UITableView {
  func dequeueReusableCellWithIdentifier<T : UITableViewCell>(identifier: ReuseIdentifier<T>, forIndexPath indexPath: NSIndexPath?) -> T? {
    if let indexPath = indexPath {
      return dequeueReusableCellWithIdentifier(identifier.identifier, forIndexPath: indexPath) as? T
    }
    return dequeueReusableCellWithIdentifier(identifier.identifier) as? T
  }
  
  func dequeueReusableCellWithIdentifier<T : UITableViewCell>(identifier: ReuseIdentifier<T>) -> T? {
    return dequeueReusableCellWithIdentifier(identifier.identifier) as? T
  }
  
  func dequeueReusableHeaderFooterViewWithIdentifier<T : UITableViewHeaderFooterView>(identifier: ReuseIdentifier<T>) -> T? {
    return dequeueReusableHeaderFooterViewWithIdentifier(identifier.identifier) as? T
  }
  
  func registerNib<T: NibResource where T: Reusable, T.T: UITableViewCell>(nibResource: T) {
    registerNib(nibResource.instance, forCellReuseIdentifier: nibResource.reuseIdentifier.identifier)
  }
  
  func registerNibForHeaderFooterView<T: NibResource where T: Reusable, T.T: UIView>(nibResource: T) {
    registerNib(nibResource.instance, forHeaderFooterViewReuseIdentifier: nibResource.reuseIdentifier.identifier)
  }
  
  func registerNibs<T: NibResource where T: Reusable, T.T: UITableViewCell>(nibResources: [T]) {
    nibResources.forEach(registerNib)
  }
}

extension UICollectionView {
  func dequeueReusableCellWithReuseIdentifier<T: UICollectionViewCell>(identifier: ReuseIdentifier<T>, forIndexPath indexPath: NSIndexPath) -> T? {
    return dequeueReusableCellWithReuseIdentifier(identifier.identifier, forIndexPath: indexPath) as? T
  }
  
  func dequeueReusableSupplementaryViewOfKind<T: UICollectionReusableView>(elementKind: String, withReuseIdentifier identifier: ReuseIdentifier<T>, forIndexPath indexPath: NSIndexPath) -> T? {
    return dequeueReusableSupplementaryViewOfKind(elementKind, withReuseIdentifier: identifier.identifier, forIndexPath: indexPath) as? T
  }
  
  func registerNib<T: NibResource where T: Reusable, T.T: UICollectionViewCell>(nibResource: T) {
    registerNib(nibResource.instance, forCellWithReuseIdentifier: nibResource.reuseIdentifier.identifier)
  }
  
  func registerNib<T: NibResource where T: Reusable, T.T: UICollectionReusableView>(nibResource: T, forSupplementaryViewOfKind kind: String) {
    registerNib(nibResource.instance, forSupplementaryViewOfKind: kind, withReuseIdentifier: nibResource.reuseIdentifier.identifier)
  }
  
  func registerNibs<T: NibResource where T: Reusable, T.T: UICollectionViewCell>(nibResources: [T]) {
    nibResources.forEach(registerNib)
  }
  
  func registerNibs<T: NibResource where T: Reusable, T.T: UICollectionReusableView>(nibResources: [T], forSupplementaryViewOfKind kind: String) {
    nibResources.forEach { self.registerNib($0, forSupplementaryViewOfKind: kind) }
  }
}

extension UIViewController {
  convenience init(nib: NibResource) {
    self.init(nibName: nib.name, bundle: _R.hostingBundle)
  }
}

extension UIViewController {
  func performSegueWithIdentifier<Segue: UIStoryboardSegue,Source: UIViewController,Destination: UIViewController>(identifier: StoryboardSegueIdentifier<Segue, Source, Destination>, sender: AnyObject?) {
    performSegueWithIdentifier(identifier.identifier, sender: sender)
  }
}

extension UIStoryboardSegue {
  func typedInfoWithIdentifier<Segue: UIStoryboardSegue,Source: UIViewController,Destination: UIViewController>(identifier: StoryboardSegueIdentifier<Segue, Source, Destination>) -> TypedStoryboardSegueInfo<Segue, Source, Destination>? {
    guard self.identifier == identifier.identifier else { return nil }
    return TypedStoryboardSegueInfo(segue: self)
  }
}