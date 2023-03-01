//
//  ViewController.swift
//  ImageLoadHW
//
//  Created by 박성민 on 2023/03/01.
//

import UIKit

final class ViewController: UIViewController {
 
    @IBOutlet private weak var firstImageView: UIImageView!
    @IBOutlet private weak var firstButton: UIButton!
    @IBOutlet private weak var secondImageView: UIImageView!
    @IBOutlet private weak var secondButton: UIButton!
    @IBOutlet private weak var thirdImageView: UIImageView!
    @IBOutlet private weak var thirdButton: UIButton!
    @IBOutlet private weak var fourthImageView: UIImageView!
    @IBOutlet private weak var fourthButton: UIButton!
    @IBOutlet private weak var fifthImageView: UIImageView!
    @IBOutlet private weak var fifthButton: UIButton!
    @IBOutlet private weak var loadAllImagesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    @IBAction private func firstButtonTapped(_ sender: Any) {
        firstImageView
            .getImageFromUrl(
                "https://images.unsplash.com/photo-1677516411856-24fd5242df7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80"
                , placeHolder: UIImage(systemName: "photo")
            )
    }
    
    @IBAction private func secondButtonTapped(_ sender: Any) {
        secondImageView
            .getImageFromUrl(
                "https://images.unsplash.com/photo-1677570319276-da8e737f0ba2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2394&q=80"
                , placeHolder: UIImage(systemName: "photo"))
    }
    
    @IBAction private func thirdButtonTapped(_ sender: Any) {
        thirdImageView
            .getImageFromUrl(
                "https://plus.unsplash.com/premium_photo-1665657351698-7d61f4b57ddc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2080&q=80"
                , placeHolder: UIImage(systemName: "photo")
            )
    }
    
    @IBAction private func fourthButtonTapped(_ sender: Any) {
        fourthImageView
            .getImageFromUrl(
                "https://images.unsplash.com/photo-1677537946795-e5558b7f4601?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1665&q=80"
                , placeHolder: UIImage(systemName: "photo")
            )
    }
    
    
    @IBAction private func fifthButtonTapped(_ sender: Any) {
        fifthImageView
            .getImageFromUrl(
                "https://images.unsplash.com/photo-1677549254885-cf55be3e552b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80"
                , placeHolder: UIImage(systemName: "photo")
            )
    }
    
    
    @IBAction private func loadAllImagesButtonTapped(_ sender: Any) {
        firstImageView
            .getImageFromUrl(
                "https://images.unsplash.com/photo-1677516411856-24fd5242df7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80"
                , placeHolder: UIImage(systemName: "photo")
            )
        secondImageView
            .getImageFromUrl(
                "https://images.unsplash.com/photo-1677570319276-da8e737f0ba2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2394&q=80"
                , placeHolder: UIImage(systemName: "photo"))
        thirdImageView
            .getImageFromUrl(
                "https://plus.unsplash.com/premium_photo-1665657351698-7d61f4b57ddc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2080&q=80"
                , placeHolder: UIImage(systemName: "photo")
            )
        fourthImageView
            .getImageFromUrl(
                "https://images.unsplash.com/photo-1677537946795-e5558b7f4601?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1665&q=80"
                , placeHolder: UIImage(systemName: "photo")
            )
        fifthImageView
            .getImageFromUrl(
                "https://images.unsplash.com/photo-1677549254885-cf55be3e552b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80"
                , placeHolder: UIImage(systemName: "photo")
            )
    }

}

extension UIImageView {
    func getImageFromUrl(_ urlStr: String, placeHolder: UIImage? = nil) {
        self.image = placeHolder
        if let url = URL(string: urlStr) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error downloading image: \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                guard let data = data, let image = UIImage(data: data) else {
                    print("Invalid image data")
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    self.image = image
                }
            }
            task.resume()
        }
    }
}
