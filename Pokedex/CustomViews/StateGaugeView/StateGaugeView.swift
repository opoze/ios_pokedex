//
//  StateGaugeView.swift
//  Pokedex
//
//  Created by Luis Alberto Zagonel Pozenato on 12/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class StateGaugeView: UIView {
    
    let nibName: String = "StateGaugeView"
    
    var stat: Int = 0
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statLabel: UILabel!
    @IBOutlet weak var gaugeBar: GaugeProgressView!
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        contentView.fixInView(self)
    }
    
    func config(name: String, stat: Int) {
        self.nameLabel.text = name
        self.statLabel.text = String(format: "%03d", arguments: [stat])
        self.stat = stat
    }
    
    func animate(){
        self.gaugeBar.fill(aspect: Float(self.stat))
    }
}
