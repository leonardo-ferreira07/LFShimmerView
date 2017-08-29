//
//  ViewController.swift
//  LFShimmerView
//
//  Created by leonardo-ferreira07 on 08/29/2017.
//  Copyright (c) 2017 leonardo-ferreira07. All rights reserved.
//

import UIKit
import LFShimmerView

class ViewController: UIViewController {

    @IBOutlet weak var shimmerView: DesignableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        shimmerView.addShimmerAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

