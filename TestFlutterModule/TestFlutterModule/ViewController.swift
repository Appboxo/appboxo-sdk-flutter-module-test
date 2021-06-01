//
//  ViewController.swift
//  TestFlutterModule
//
//  Created by Владимир Лесунов on 1/6/21.
//

import UIKit
import AppBoxoSDK
import Flutter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button = UIButton(type:UIButton.ButtonType.custom)
            button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
            button.setTitle("Show Flutter!", for: UIControl.State.normal)
        button.frame = CGRect(x: (view.frame.width - 160.0) / 2.0 , y: (view.frame.height - 40.0) / 2.0, width: 160.0, height: 40.0)
            button.backgroundColor = UIColor.blue
            self.view.addSubview(button)
          }

          @objc func showFlutter() {
            let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
            let flutterViewController =
                FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
            navigationController?.pushViewController(flutterViewController, animated: true)
          }


}

