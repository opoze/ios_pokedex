//
//  gaugeProgressView.swift
//  Pokedex
//
//  Created by Luis Alberto Zagonel Pozenato on 12/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class GaugeProgressView: UIProgressView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        self.clipsToBounds = true
        //@TODO:luis.pozenato: cornerRadius da topview
        self.layer.sublayers![1].cornerRadius = 8
        self.layer.cornerRadius = 8
        self.subviews[1].clipsToBounds = true
    }
    
    func fill(aspect: Float) {
        let value: Float = aspect / 100
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, animations: {
                self.setProgress(value, animated: true)
            })
        }
    }
}
