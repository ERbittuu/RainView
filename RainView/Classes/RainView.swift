//
//  RainView.swift
//  RainView
//
//  Created by erbittuu on 06/02/2017.
//  Copyright (c) 2017 erbittuu. All rights reserved.

public class RainView {
    
    // MARK: - Private
    private var drops: [UIView] = []
    private var view: UIView!
    
    // MARK: Rain drops animator and gravity
    private var dynamicAnimator: UIDynamicAnimator!
    private var gravityBehavior = UIGravityBehavior()
    private var timer : Timer!
    
    private var numberOfDropsPerLoop = 12
    
    // MARK: - Access Rain-fall
    open var isRaining = false
    open var dropColor = UIColor(red:0.12, green:0.65, blue:0.98, alpha:1.00)
    
    // MARK: Open Methods
    public init(view: UIView) {
        // Get main view
        self.view = view
        
        // Initialize animator
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        dynamicAnimator.addBehavior(gravityBehavior)
    }
    
    // Stops water drops
    public func stopRain() {
        isRaining = false
        // Remove all objects from drops array
        drops.removeAll()
        // Stop all timers
        timer.invalidate()
    }
    
    // Starts the rain with heavy drop
    public func startHeavyRain() {
        numberOfDropsPerLoop = 54
        gravityBehavior.gravityDirection.dy = 3
        start(time: 0.1)
    }
    
    // Starts the rain
    public func startRain() {
        numberOfDropsPerLoop = 18
        gravityBehavior.gravityDirection.dy = 2
        start()
    }
    
    // Starts the rain with drizzle
    public func startDrizzle() {
        numberOfDropsPerLoop = 6
        gravityBehavior.gravityDirection.dy = 1
        start()
    }
    
    // MARK: - Helper Methods
    
    // Starts the rain animation
    private func start(time: TimeInterval = 0.2) {
        
        if isRaining {
            stopRain()
        }
        
        isRaining = true
        // Timer that calls spawnFirst method every 0.2/? second. Produces rain drops every .2 second
        timer = Timer.runThisEvery(seconds: time) { (timer) in
            self.forkDrops()
        }
    }
    
    // Fork water drops
    @objc fileprivate func forkDrops() {
        
        func randomDrop() -> Drop { // Generate drops
            return Drop(color: dropColor)
        }
        
        for _ in 0 ..< numberOfDropsPerLoop {
            
            let drop = randomDrop()
            self.view.addSubview(drop)
            self.drops.append(drop)
            gravityBehavior.addItem(drop)
        }
        
        // Checks if each drop is below the bottom of screen. Then removes its gravity, hides it, and removes from array
        for i in 0 ..< drops.count {
            if i >= drops.count {
                break
            }
            
            if drops[i].frame.origin.y > self.view.frame.height {
                gravityBehavior.removeItem(drops[i])
                drops[i].removeFromSuperview()
                drops.remove(at: i)
            }
        }
    }
    
    // MARK: - Water Drop
    class Drop: UIView {
        
        init(color : UIColor) {
            super.init(frame: CGRect(x: 10.rand(range: 350),
                                     y: -200.rand(range: 150),
                                     width: 1,
                                     height: 10.rand(range: 30)))
            backgroundColor = color
            layer.borderWidth = 0.0
        }
        required init?(coder aDecoder: NSCoder) {   fatalError("init(coder:) has not been implemented") }
    }
}

// MARK: - extension
internal extension Timer {
    
    /// Runs every x seconds, to cancel use: timer.invalidate()
    internal static func runThisEvery(seconds: TimeInterval, handler: @escaping (Timer?) -> Void) -> Timer {
        let fireDate = CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, seconds, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, CFRunLoopMode.commonModes)
        return timer!
    }
}

internal extension Int {
    
    /// get random Int
    internal func rand(range : UInt32) -> Int {
        return self + Int(arc4random_uniform(range))
    }
}