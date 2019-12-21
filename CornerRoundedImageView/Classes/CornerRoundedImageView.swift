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
  
  deinit {
    removeObserver(self, forKeyPath: #keyPath(CornerRoundedImageViewImageView.bounds))
  }
  
  private func setup() {
    addObserver(self, forKeyPath: #keyPath(CornerRoundedImageViewImageView.bounds), options: [.new, .old], context: nil)
    setupCornerRoundedMask()
  }
  
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == #keyPath(CornerRoundedImageViewImageView.bounds) {
      setupCornerRoundedMask()
    }
  }
  
  private func setupCornerRoundedMask() {
    let path = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: (bounds.width - frame.size.width) / 2, y: (bounds.height - frame.size.height) / 2), size: frame.size), cornerRadius: cornerRadius)
    maskLayer.path = path.cgPath
    maskLayer.frame = bounds
    maskLayer.fillRule = .evenOdd
    layer.mask = maskLayer
  }
}
