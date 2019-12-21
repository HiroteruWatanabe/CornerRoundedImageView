import UIKit

class CornerRoundedImageViewImageView: UIImageView {
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
  
  private func setup() {}
}
