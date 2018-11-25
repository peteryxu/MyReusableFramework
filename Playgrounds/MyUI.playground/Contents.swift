//: A UIKit based Playground for presenting user interface

/*
 # Table of Contents
 ## Overview
 
*/

import UIKit
import PlaygroundSupport
import SwiftSpinner
import Alamofire
import MyReusableFramework


class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
    
    /*override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SwiftSpinner.show("Connecting \nto satellite...").addTapHandler({
            SwiftSpinner.hide()
        })
    } */
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SwiftSpinner.show("Connecting \nto satellite...")
        Alamofire.request("http://www.google.com").response { response in
            print(String(describing: response.response))
            SwiftSpinner.hide()
        }
    }
}


// You can also access the same image in code:
let image = UIImage(named: "PeterXu")

// You can find resources by using Bundle APIs:
let videoURL = Bundle.main.url(forResource: "MyVideo", withExtension: "mp4")


//: Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
