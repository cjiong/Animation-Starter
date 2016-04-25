//
//  TriangleLayer.swift
//  Animation Starter
//
//  Created by 陈炯 on 15/11/15.
//  Copyright (c) 2015年 Jiong. All rights reserved.
//
import UIKit

class TriangleLayer: CAShapeLayer {
  
  let innerPadding: CGFloat = 30.0
  
  override init() {
    super.init()
    fillColor = Colors.red.CGColor
    strokeColor = Colors.red.CGColor
    lineWidth = 7.0
    lineCap = kCALineCapRound
    lineJoin = kCALineJoinRound
    path = trianglePathSmall.CGPath
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  var trianglePathSmall: UIBezierPath {
    let trianglePath = UIBezierPath()
    trianglePath.moveToPoint(CGPoint(x: 5.0 + innerPadding, y: 95.0))
    trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5 + innerPadding))
    trianglePath.addLineToPoint(CGPoint(x: 95.0 - innerPadding, y: 95.0))
    trianglePath.closePath()
    return trianglePath
  }
  
  var trianglePathLeftExtension: UIBezierPath {
    let trianglePath = UIBezierPath()
    trianglePath.moveToPoint(CGPoint(x: 5.0, y: 95.0))
    trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5 + innerPadding))
    trianglePath.addLineToPoint(CGPoint(x: 95.0 - innerPadding, y: 95.0))
    trianglePath.closePath()
    return trianglePath
  }
  
  var trianglePathRightExtension: UIBezierPath {
    let trianglePath = UIBezierPath()
    trianglePath.moveToPoint(CGPoint(x: 5.0, y: 95.0))
    trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5 + innerPadding))
    trianglePath.addLineToPoint(CGPoint(x: 95.0, y: 95.0))
    trianglePath.closePath()
    return trianglePath
  }
  
  var trianglePathTopExtension: UIBezierPath {
    let trianglePath = UIBezierPath()
    trianglePath.moveToPoint(CGPoint(x: 5.0, y: 95.0))
    trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5))
    trianglePath.addLineToPoint(CGPoint(x: 95.0, y: 95.0))
    trianglePath.closePath()
    return trianglePath
  }
  
  func animate() {
    let triangleAnimationLeft: CABasicAnimation = CABasicAnimation(keyPath: "path")
    triangleAnimationLeft.fromValue = trianglePathSmall.CGPath
    triangleAnimationLeft.toValue = trianglePathLeftExtension.CGPath
    triangleAnimationLeft.beginTime = 0.0
    triangleAnimationLeft.duration = 0.3
    
    let triangleAnimationRight: CABasicAnimation = CABasicAnimation(keyPath: "path")
    triangleAnimationRight.fromValue = trianglePathLeftExtension.CGPath
    triangleAnimationRight.toValue = trianglePathRightExtension.CGPath
    triangleAnimationRight.beginTime = triangleAnimationLeft.beginTime + triangleAnimationLeft.duration
    triangleAnimationRight.duration = 0.25
    
    let triangleAnimationTop: CABasicAnimation = CABasicAnimation(keyPath: "path")
    triangleAnimationTop.fromValue = trianglePathRightExtension.CGPath
    triangleAnimationTop.toValue = trianglePathTopExtension.CGPath
    triangleAnimationTop.beginTime = triangleAnimationRight.beginTime + triangleAnimationRight.duration
    triangleAnimationTop.duration = 0.20
    
    let triangleAnimationGroup: CAAnimationGroup = CAAnimationGroup()
    triangleAnimationGroup.animations = [triangleAnimationLeft, triangleAnimationRight, triangleAnimationTop]
    triangleAnimationGroup.duration = triangleAnimationTop.beginTime + triangleAnimationTop.duration
    triangleAnimationGroup.fillMode = kCAFillModeForwards
    triangleAnimationGroup.removedOnCompletion = false
    addAnimation(triangleAnimationGroup, forKey: nil)
  }
}
