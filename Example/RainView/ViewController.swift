//
//  Controllers.swift
//  RainView
//
//  Created by erbittuu on 06/02/2017.
//  Copyright © 2017 utsav.patel. All rights reserved.
//

import UIKit
import RainView

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black]
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.title = "RainView Demo"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let view = segue.destination as? ViewController {
            view.type = Int(segue.identifier!)!
        }
    }
}

class ViewController: UIViewController {
    
    var type = 0
    
    var rainPlace: RainView!
    
    @IBOutlet weak var blurView1: UIVisualEffectView!
    var pauseButton : UIBarButtonItem!
    var playButton : UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pauseButton = UIBarButtonItem(barButtonSystemItem: .pause, target: self, action: #selector(startStopRain(_:)))
        playButton = UIBarButtonItem(barButtonSystemItem: .play, target: self, action:  #selector(startStopRain(_:)))

        self.navigationItem.rightBarButtonItem = pauseButton
    }
    
    @IBAction func startStopRain(_ sender: UIBarButtonItem?) {
        
        if rainPlace.isRaining {
            rainPlace.stopRain()
            self.navigationItem.rightBarButtonItem = playButton
        }else{
            startRain()
            self.navigationItem.rightBarButtonItem = pauseButton
        }
    }
    
    func startRain(){
        if type == 1 {
            self.title = "Rain"
            rainPlace.startRain()
        }else if type == 2 {
            self.title = "HeavyRain"
            rainPlace.startHeavyRain()
        }else if type == 3 {
            self.title = "Drizzle"
            rainPlace.startDrizzle()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        rainPlace = RainView.init(view: self.view)
        
        blurView1.layer.cornerRadius = 20.0
        blurView1.layer.masksToBounds = true
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        startStopRain(nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
