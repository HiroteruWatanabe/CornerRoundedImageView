import UIKit

open class CornerRoundedImageViewImageView: UIImageView {
  private let maskLayer = CAShapeLayer()
  
  @IBInspectable open var cornerRadius: CGFloat = 8 {
    didSet {
      setupCornerRoundedMask()
    }
  }
  
  override open var image: UIImage? {
    get {
      return super.image
    }
    set {
      super.image = newValue
      setupCornerRoundedMask()
    }
  }
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  override public init(image: UIImage?) {
    super.init(image: image)
    setup()
  }
  
  override public init(image: UIImage?, highlightedImage: UIImage?) {
    super.init(image: image, highlightedImage: highlightedImage)
    setup()
  }
  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  deinit {
    removeObserver(self, forKeyPath: #keyPath(CornerRoundedImageViewImageView.bounds))
  }
  
  private func setup() {
    addObserver(self, forKeyPath: #keyPath(CornerRoundedImageViewImageView.bounds), options: [.new, .old], context: nil)
    setupCornerRoundedMask()
  }
  
  override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == #keyPath(CornerRoundedImageViewImageView.bounds) {
      setupCornerRoundedMask()
    }
  }
  
  private func setupCornerRoundedMask() {
    let path = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: (bounds.width - imagePresentationSize.width) / 2, y: (bounds.height - imagePresentationSize.height) / 2), size: imagePresentationSize), cornerRadius: cornerRadius)
    maskLayer.path = path.cgPath
    maskLayer.frame = bounds
    maskLayer.fillRule = .evenOdd
    layer.mask = maskLayer
  }
  
  private var imagePresentationSize: CGSize {
    guard let image = image else { return frame.size }
    let aspectRatio = image.size.width / image.size.height
    if aspectRatio > 1.0 {
      return CGSize(width: frame.width, height: frame.height / aspectRatio)
    } else {
      return CGSize(width: frame.width * aspectRatio, height: frame.height)
    }
  }
}
