//
//  ArcLayer.swift
//  Animation Starter
//
//  Created by 陈炯 on 15/11/15.
//  Copyright (c) 2015年 Jiong. All rights reserved.
//

import UIKit

class ArcLayer: CAShapeLayer {
  
  let animationDuration: CFTimeInterval = 0.18
  
  override init() {
    super.init()
    fillColor = Colors.blue.CGColor
    path = arcPathStarting.CGPath
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  var arcPathPre: UIBezierPath {
    let arcPath = UIBezierPath()
    arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
    arcPath.addLineToPoint(CGPoint(x: 0.0, y: 99.0))
    arcPath.addLineToPoint(CGPoint(x: 100.0, y: 99.0))
    arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
    arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
    arcPath.closePath()
    return arcPath
  }
  
  var arcPathStarting: UIBezierPath {
    let arcPath = UIBezierPath()
    arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
    arcPath.addLineToPoint(CGPoint(x: 0.0, y: 80.0))
    arcPath.addCurveToPoint(CGPoint(x: 100.0, y: 80.0), controlPoint1: CGPoint(x: 30.0, y: 70.0), controlPoint2: CGPoint(x: 40.0, y: 90.0))
    arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
    arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
    arcPath.closePath()
    return arcPath
  }
  
  var arcPathLow: UIBezierPath {
    let arcPath = UIBezierPath()
    arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
    arcPath.addLineToPoint(CGPoint(x: 0.0, y: 60.0))
    arcPath.addCurveToPoint(CGPoint(x: 100.0, y: 60.0), controlPoint1: CGPoint(x: 30.0, y: 65.0), controlPoint2: CGPoint(x: 40.0, y: 50.0))
    arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
    arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
    arcPath.closePath()
    return arcPath
  }
  
  var arcPathMid: UIBezierPath {
    let arcPath = UIBezierPath()
    arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
    arcPath.addLineToPoint(CGPoint(x: 0.0, y: 40.0))
    arcPath.addCurveToPoint(CGPoint(x: 100.0, y: 40.0), controlPoint1: CGPoint(x: 30.0, y: 30.0), controlPoint2: CGPoint(x: 40.0, y: 50.0))
    arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
    arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
    arcPath.closePath()
    return arcPath
  }
  
  var arcPathHigh: UIBezierPath {
    let arcPath = UIBezierPath()
    arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
    arcPath.addLineToPoint(CGPoint(x: 0.0, y: 20.0))
    arcPath.addCurveToPoint(CGPoint(x: 100.0, y: 20.0), controlPoint1: CGPoint(x: 30.0, y: 25.0), controlPoint2: CGPoint(x: 40.0, y: 10.0))
    arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
    arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
    arcPath.closePath()
    return arcPath
  }
  
  var arcPathComplete: UIBezierPath {
    let arcPath = UIBezierPath()
    arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
    arcPath.addLineToPoint(CGPoint(x: 0.0, y: -5.0))
    arcPath.addLineToPoint(CGPoint(x: 100.0, y: -5.0))
    arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
    arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
    arcPath.closePath()
    return arcPath
  }
  
  func animate() {
    let arcAnimationPre: CABasicAnimation = CABasicAnimation(keyPath: "path")
    arcAnimationPre.fromValue = arcPathPre.CGPath
    arcAnimationPre.toValue = arcPathStarting.CGPath
    arcAnimationPre.beginTime = 0.0
    arcAnimationPre.duration = animationDuration
    
    let arcAnimationLow: CABasicAnimation = CABasicAnimation(keyPath: "path")
    arcAnimationLow.fromValue = arcPathStarting.CGPath
    arcAnimationLow.toValue = arcPathLow.CGPath
    arcAnimationLow.beginTime = arcAnimationPre.beginTime + arcAnimationPre.duration
    arcAnimationLow.duration = animationDuration
    
    let arcAnimationMid: CABasicAnimation = CABasicAnimation(keyPath: "path")
    arcAnimationMid.fromValue = arcPathLow.CGPath
    arcAnimationMid.toValue = arcPathMid.CGPath
    arcAnimationMid.beginTime = arcAnimationLow.beginTime + arcAnimationLow.duration
    arcAnimationMid.duration = animationDuration
    
    let arcAnimationHigh: CABasicAnimation = CABasicAnimation(keyPath: "path")
    arcAnimationHigh.fromValue = arcPathMid.CGPath
    arcAnimationHigh.toValue = arcPathHigh.CGPath
    arcAnimationHigh.beginTime = arcAnimationMid.beginTime + arcAnimationMid.duration
    arcAnimationHigh.duration = animationDuration
    
    let arcAnimationComplete: CABasicAnimation = CABasicAnimation(keyPath: "path")
    arcAnimationComplete.fromValue = arcPathHigh.CGPath
    arcAnimationComplete.toValue = arcPathComplete.CGPath
    arcAnimationComplete.beginTime = arcAnimationHigh.beginTime + arcAnimationHigh.duration
    arcAnimationComplete.duration = animationDuration
    
    let arcAnimationGroup: CAAnimationGroup = CAAnimationGroup()
    arcAnimationGroup.animations = [arcAnimationPre, arcAnimationLow, arcAnimationMid, arcAnimationHigh, arcAnimationComplete]
    arcAnimationGroup.duration = arcAnimationComplete.beginTime + arcAnimationComplete.duration
    arcAnimationGroup.fillMode = kCAFillModeForwards
    arcAnimationGroup.removedOnCompletion = false
    addAnimation(arcAnimationGroup, forKey: nil)
  }
}
