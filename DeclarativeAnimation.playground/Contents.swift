//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    let label = UILabel()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        label.frame = CGRect(x: 150, y: 200, width: 100, height: 20)
        label.text = "Hello World!"
        label.textColor = .red
        label.backgroundColor = .blue
        label.alpha = 0.0
        view.addSubview(label)
        self.view = view
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        fadeInUsingBlocks()
        fadeInDeclarative()
    }
    
    func fadeInDeclarative() {
//        label.animate([.fadeIn(duration: 1.0), .resize(to: CGSize(width: 200, height: 200) , duration: 1.0)])
        
        label.animate(inParallel: [.fadeIn(duration: 1.0), .resize(to: CGSize(width: 200, height: 200) , duration: 1.0)])
    }
    
    
    func fadeInUsingBlocks() {
        UIView.animate(withDuration: 1.0, animations: {
            self.label.alpha = 1.0
        }) { (done) in
            UIView.animate(withDuration: 1.0, animations: {
                self.label.frame = CGRect(x: 150, y: 200, width: 200, height: 100)
            }, completion: nil)
        }
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

// MARK: Model
struct Animation {
    let duration: TimeInterval
    let closure: (UIView) -> Void
}

extension Animation {
    static func fadeIn(duration: TimeInterval = 0.3) -> Animation {
        return Animation(duration: duration, closure: { (view) in
            view.alpha = 1.0
        })
    }
    
    static func resize(to size: CGSize, duration: TimeInterval = 0.3) -> Animation {
        return Animation(duration: duration, closure: { (view) in
            view.bounds.size = size
        })
    }
}


// MARK : Animating
extension UIView {
    func animate(_ animations: [Animation]) {
        guard !animations.isEmpty else {
            return
        }
        
        var animations = animations
        let animation = animations.removeFirst()
        
        UIView.animate(withDuration: animation.duration, animations: { 
            animation.closure(self)
        }) { (done) in
            // Recursively call the animate method.
            self.animate(animations)
        }
    }
    
    func animate(inParallel animations: [Animation]) {
        for animation in animations {
            UIView.animate(withDuration: animation.duration, animations: { 
                animation.closure(self)
            })
        }
    }
}