//
//  FirstViewController.swift
//  Animation
//
//  Created by Anna Yatsun on 24/12/2018.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, RootViewRepresentable {
        
    typealias RootView = MovingSquareView 
    
    @IBAction func buttonAction(_ sender: UIButton) {
        self.rootView.do {
            $0.isStopped.toggle()
            $0.loopingMovingOfSquare()
        }
    }
   
    override func viewDidLoad() {
        super .viewDidLoad()	
    }
}
	
