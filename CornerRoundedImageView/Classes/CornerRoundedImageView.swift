import UIKit

class CornerRoundedImageViewImageView: UIImageView {
  private let maskLayer = CAShapeLayer()
  
  @IBInspectable var cornerRadius: CGFloat = 8 {
    didSet {
      setupCornerRoundedMask()
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  override init(image: UIImage?) {
    super.init(image: image)
    setup()
  }
  
  override init(image: UIImage?, highlightedImage: UIImage?) {
    super.init(image: image, highlightedImage: highlightedImage)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    setupCornerRoundedMask()
  }
  
  private func setupCornerRoundedMask() {
    let path = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: (bounds.width - frame.size.width) / 2, y: (bounds.height - frame.size.height) / 2), size: frame.size), cornerRadius: cornerRadius)
    maskLayer.path = path.cgPath
    maskLayer.frame = bounds
    maskLayer.fillRule = .evenOdd
    layer.mask = maskLayer
  }
}
