//
//  Extensions.swift
//  Nounou
//
//  Created by RCD on 24/05/2023.
//

import Foundation
import UIKit
import SDWebImage

//MARK: UIImage

extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

//MARK: UIView

extension UIView {
    
    public var borderRadius: CGFloat {
        
        get{
            return self.layer.cornerRadius
        }
        
        set(newValue){
            self.layer.cornerRadius = newValue
        }
    }
    
    public var width: CGFloat {
        return self.frame.size.width
    }
    
    public var height: CGFloat{
        return frame.size.height
    }
    
    public var top: CGFloat{
        return frame.origin.y
    }
    
    public var bottom: CGFloat{
        return frame.size.height + frame.origin.y
    }
    
    public var left: CGFloat{
        return frame.origin.x
    }
    
    public var right: CGFloat{
        return frame.size.width + frame.origin.x
    }
    
    func tamic() {
        self.translatesAutoresizingMaskIntoConstraints = true
    }
    
    func Activate(_ Constraints: [NSLayoutConstraint]){
        NSLayoutConstraint.activate(Constraints)
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -(padding.right)).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -(padding.bottom)).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func centerToX() {
        
        guard let superview = self.superview else {
            
            print ("DEBUG: Could not find superview")
            return
        }
        
        self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
    }
    
    func setBorder(borderWidth: CGFloat, borderColor: UIColor){
        
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    func centerToY() {
        
        guard let superview = self.superview else {
            
            print ("DEBUG: Could not find superview")
            return
        }
        
        self.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
    
    func setWidth(_ width: CGFloat) {
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setHeight(_ height: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func widthGreaterThanOrEqualToConstant(_ width: CGFloat) {
        self.widthAnchor.constraint(greaterThanOrEqualToConstant: width).isActive = true
    }
    
    func heightGreaterThanOrEqualToConstant(_ height: CGFloat) {
        self.heightAnchor.constraint(greaterThanOrEqualToConstant: height).isActive = true
    }
    
    func widthLessThanOrEqualTo(_ width: CGFloat) {
        self.widthAnchor.constraint(lessThanOrEqualToConstant: width).isActive = true
    }
    
    func heightLessThanOrEqualTo(_ height: CGFloat) {
        self.heightAnchor.constraint(lessThanOrEqualToConstant: height).isActive = true
    }
    
    func drawLine(on view: UIView, lineThickness: CGFloat = 1, lineColor: UIColor = UIColor.black, lineWidth: CGFloat ) {
        
        let bp = UIBezierPath()
        bp.move(to: CGPoint(x: 0, y: 0))
        bp.addLine(to: CGPoint(x: lineWidth, y: 0))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.backgroundColor = lineColor.cgColor
        shapeLayer.path = bp.cgPath
        shapeLayer.lineWidth = lineThickness
        shapeLayer.contentsGravity = .center
        
        view.layer.addSublayer(shapeLayer)
    }
    
    func addInnerShadow() {
        
        let innerShadow = CALayer()
        innerShadow.frame = bounds
        
        // Shadow path (1pt ring around bounds)
        let radius = self.layer.cornerRadius
        let path = UIBezierPath(roundedRect: innerShadow.bounds.insetBy(dx: 0, dy:2), cornerRadius:radius)
        let cutout = UIBezierPath(roundedRect: .init(x: 0, y: 0, width: width, height: height - 2), cornerRadius:radius).reversing()
        
        path.append(cutout)
        innerShadow.shadowPath = path.cgPath
        innerShadow.masksToBounds = true
        
        // Shadow properties
        innerShadow.shadowColor = UIColor.black.cgColor
        innerShadow.shadowOffset = CGSize(width: 0, height: 0)
        innerShadow.shadowOpacity = 0.3
        innerShadow.shadowRadius = 5
        innerShadow.cornerRadius = self.layer.cornerRadius
        layer.addSublayer(innerShadow)
    }
    
    func setShadow(color: UIColor = .black, shadowRadius:CGFloat = 5, shadowOpacity: Float = 5, shadowOffset: CGSize = .zero) {
        
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = .zero
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    private struct AssociatedKeys {
        static var touchTarget = "touchTarget"
    }
    
    private var touchTarget: (() -> Void)? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.touchTarget) as? (() -> Void)
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.touchTarget, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func onClick(_ target: (() -> Void)?) {
        self.touchTarget = target
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
    
    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        self.touchTarget?()
    }
    
    
    func roundCorners(corners: CACornerMask, radius: CGFloat) {
        self.borderRadius = radius
        self.layer.maskedCorners = [corners]
        
    }
    
    private var initialRotationAngle: CGFloat {
        return atan2(self.transform.b, self.transform.a)
    }
    
    func rotate180() {
        UIView.animate(withDuration: 0.3) {
            let rotationAngle = self.initialRotationAngle + .pi
            self.transform = CGAffineTransform(rotationAngle: rotationAngle)
        }
    }
    
    func rotateBack() {
        UIView.animate(withDuration: 0.3) {
            self.transform = CGAffineTransform(rotationAngle: self.initialRotationAngle)
        }
    }
    
}

//MARK: Text Field
extension UITextField {
    
    func setPlaceholder(text: String, color: UIColor, underline: NSUnderlineStyle? = nil, font: UIFont? = nil) {
        
        if let underline = underline {
            
            self.attributedPlaceholder = NSAttributedString( string: text.localized(),
                                                             attributes: [.foregroundColor:color,
                                                                          .underlineStyle: underline.rawValue,
                                                             ])
        } else if  let font = font {
            
            self.attributedPlaceholder = NSAttributedString( string: text.localized(),
                                                             attributes: [.foregroundColor:color,
                                                                          .font: font
                                                             ])
        } else if let font = font, let underline = underline {
            
            self.attributedPlaceholder = NSAttributedString( string: text.localized(),
                                                             attributes: [.foregroundColor:color,
                                                                          .font: font,
                                                                          .underlineStyle: underline,
                                                             ])
        }  else {
            
            self.attributedPlaceholder = NSAttributedString( string: text.localized(),
                                                             attributes: [NSAttributedString.Key.foregroundColor:color])
        }
        
    }
    
    func setUnderLine(_ color: UIColor) {
        
        let border = CALayer()
        border.borderColor = color.cgColor
        let underlineWidth = self.width/1.05
        border.frame = CGRect(x: self.width - (self.width/2) - (underlineWidth/2), y: self.height - 1, width: underlineWidth, height: 1)
        border.borderWidth = 1
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}

extension UIViewController {
    
    @objc func injected() {
        
    }
}

//MARK: String

extension String {
    func withBoldText(boldPartsOfString: Array<NSString>, font: UIFont, boldFont: UIFont) -> NSAttributedString {
        let nonBoldFontAttribute = [NSAttributedString.Key.font:font]
        let boldFontAttribute = [NSAttributedString.Key.font:boldFont]
        let boldString = NSMutableAttributedString(string: self as String, attributes:nonBoldFontAttribute)
        for i in 0 ..< boldPartsOfString.count {
            boldString.addAttributes(boldFontAttribute, range: (self as NSString).range(of: boldPartsOfString[i] as String))
        }
        return boldString
    }
    
    func underlinedAttributedString(font: UIFont, textColor: UIColor, underlineColor: UIColor) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: textColor,
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: underlineColor
        ]
        
        return NSAttributedString(string: self, attributes: attributes)
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            let font = UIFont.systemFont(ofSize: 18)
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,          .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    var toHTMLString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
}

extension NSMutableAttributedString {
    
    @discardableResult func appendWith(_ text: String,
                                       color: UIColor = UIColor.darkText,
                                       font: UIFont = .CustomFont(),
                                       letterSpacing: CGFloat = 0.8,
                                       withUnderline: Bool = false,
                                       underlineColor: UIColor = .black,
                                       withStrikeThrough: Bool = false,
                                       strikeThroughColor: UIColor = .darkText) -> NSMutableAttributedString{
        let attrText = NSAttributedString.makeWith(color: color, 
                                                  font: font, 
                                                   text.localized(),
                                                   letterSpacing: letterSpacing,
                                                   withUnderline: withUnderline,
                                                   underlineColor:underlineColor,withStrikeThrough: withStrikeThrough,
                                                   strikeThroughColor: strikeThroughColor)
        self.append(attrText)
        return self
    }
    
}

extension NSAttributedString {
    
    func apply(_ attributes: [NSAttributedString.Key:Any]) -> NSAttributedString {
        let mutable = NSMutableAttributedString(string: self.string, attributes: self.attributes(at: 0, effectiveRange: nil))
        mutable.addAttributes(attributes, range: NSMakeRange(0, (self.string as NSString).length))
        return mutable
    }
    
    public static func makeWith(color: UIColor = UIColor.darkText, 
                                font: UIFont = UIFont.CustomFont(),
                                _ text: String,
                                letterSpacing: CGFloat = .zero,
                                withUnderline: Bool = false,
                                underlineColor: UIColor = .black,
                                withStrikeThrough: Bool = false,
                                strikeThroughColor: UIColor? = .darkText) -> NSMutableAttributedString {
        
        
        var attrs = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.kern: letterSpacing] as [NSAttributedString.Key : Any]
        
        if withUnderline {
            let underlineStyle = NSUnderlineStyle.single.rawValue
            attrs[.underlineStyle] = underlineStyle
            attrs[.underlineColor] = underlineColor
        }
        
        if withStrikeThrough{
            attrs[.strikethroughColor] = strikeThroughColor
            attrs[.strikethroughStyle] =  NSUnderlineStyle.single.rawValue
        }
        
        return NSMutableAttributedString(string: text, attributes:attrs)
    }
    
    func underline(_ color: UIColor, style: NSUnderlineStyle = .single) -> NSAttributedString {
        self.apply([.underlineColor: color, .underlineStyle: style.rawValue])
    }
}

extension UINavigationController {
    
    open override func viewDidLoad() {
        
        interactivePopGestureRecognizer?.delegate = nil
        view.semanticContentAttribute = isArabic ? .forceRightToLeft :.forceLeftToRight
    }
}


extension UIImage {
    
    func imageWithColor(_ color: UIColor, size: CGSize) -> UIImage? {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func withInset(_ insets: UIEdgeInsets) -> UIImage? {
        let cgSize = CGSize(width: self.size.width + insets.left * self.scale + insets.right * self.scale,
                            height: self.size.height + insets.top * self.scale + insets.bottom * self.scale)
        
        UIGraphicsBeginImageContextWithOptions(cgSize, false, self.scale)
        defer { UIGraphicsEndImageContext() }
        
        let origin = CGPoint(x: insets.left * self.scale, y: insets.top * self.scale)
        self.draw(at: origin)
        
        return UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(self.renderingMode)
    }
    
}

extension UIViewController{
    
    func pushViewController(with ViewController: UIViewController){
        
        let vc = ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
//    func showWebviewWith(url:String, title: String){
//        
//        let vc = WebviewVC(title: title.localized(), url: url)
//        self.pushViewController(with: vc)
//    }
    
    typealias DidDismissHandler = () -> Void
    
    func setBadgeValue(value: Int) {
        if let tabBarController = navigationController?.tabBarController,
           let tabBarItem = tabBarController.tabBar.items?[2] {
            tabBarItem.badgeValue = value > 0 ? "\(value)" : nil
        }
    }

    public func assignPickerToTextField(pickerView: UIPickerView, textField: UITextField) {
        // Set the delegate and datasource of the picker view
        
        // Create a toolbar with a Done button for the picker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done".localized(), style: .plain, target: self, action: #selector(self.doneButtonTapped))
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        
        // Assign the toolbar as the input accessory view for the textField
        textField.inputAccessoryView = toolbar
        
        // Assign the pickerView as the input view for the textField
        textField.inputView = pickerView
    }
    
    @objc private func doneButtonTapped() {
        view.endEditing(true) // Close the keyboard or picker view
    }

}


extension UIImageView {
    
    func setImageWith(_ url: String, completed: Callback? = nil) {
        
        guard let URL  = URL(string: url) else {
            debugPrint("DEBUG: Could not download image")
            return
        }
        
        self.sd_imageTransition = .fade
        self.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
        self.sd_setImage(with: URL)
    }
}

extension UIColor {
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: NSCharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    var isDark: Bool {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        guard getRed(&red, green: &green, blue: &blue, alpha: nil) else {
            return false
        }
        
        let luminance = 0.2126 * red + 0.7152 * green + 0.0722 * blue
        
        return luminance < 0.5
    }
}

extension UIImage {
    var averageColor: UIColor? {
        guard let cgImage = cgImage else { return nil }
        
        let context = CIContext(options: nil)
        let ciImage = CIImage(cgImage: cgImage)
        
        let extent = ciImage.extent
        let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: ciImage, kCIInputExtentKey: CIVector(cgRect: extent)])
        
        guard let outputImage = filter?.outputImage else { return nil }
        guard let outputData = context.createCGImage(outputImage, from: extent) else { return nil }
        
        _ = CGDataProvider(data: outputData as! CFData)
        guard let colorSpace = CGColorSpace(name: CGColorSpace.sRGB) else { return nil }
        guard let averageCGColor = CGColor(colorSpace: colorSpace, components: [0, 0, 0, 1]) else { return nil }
        
        return UIColor(cgColor: averageCGColor)
    }
}

extension UIColor {
    var isLight: Bool {
        var white: CGFloat = 0
        self.getWhite(&white, alpha: nil)
        return white > 0.5
    }
}

//MARK: Button

extension UIButton{
    
    func makeButtonImageToScaleAspectFit(){
       self.contentVerticalAlignment = .fill
       self.contentHorizontalAlignment = .fill
       self.imageView?.contentMode = .scaleAspectFit
    }
}
