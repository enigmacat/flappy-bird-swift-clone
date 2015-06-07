import Foundation

class MainScene: CCNode {
    var _scrollSpeed: CGFloat = 80
    var _hero: CCSprite!
    var _physicsNode: CCPhysicsNode!
    var _ground1: CCSprite!
    var _ground2: CCSprite!
    var grounds: [CCSprite] = []
    var sinceTouch: CCTime = 0
    
    func didLoadFromCCB() {
        self.userInteractionEnabled = true
        grounds.append(_ground1)
        grounds.append(_ground2)
    }
    
    override func update(delta: CCTime) {
        _hero.position = ccp(_hero.position.x + _scrollSpeed * CGFloat(delta), _hero.position.y)
        _physicsNode.position = ccp(_physicsNode.position.x - _scrollSpeed * CGFloat(delta), _physicsNode.position.y)
        
        for ground in grounds {
            let groundWorldPosition = _physicsNode.convertToWorldSpace(ground.position)
            let groundScreenPosition = self.convertToNodeSpace(groundWorldPosition)
            if groundScreenPosition.x <= (-ground.contentSize.width) {
                ground.position = ccp(ground.position.x + ground.contentSize.width * 2, ground.position.y)
            }
        }
        
        let velocityY = clampf(Float(_hero.physicsBody.velocity.y), -Float(CGFloat.max), 200)
        _hero.physicsBody.velocity = ccp(0, CGFloat(velocityY))
        
        sinceTouch += delta
        _hero.rotation = clampf(_hero.rotation, -30,90)
        if (_hero.physicsBody.allowsRotation) {
            let angularVelocity = clampf(Float(_hero.physicsBody.angularVelocity),2,-1)
            _hero.physicsBody.angularVelocity = CGFloat(angularVelocity)
        }
        if (sinceTouch > 0.5) {
            let impulse  = -20000 * delta
            _hero.physicsBody.applyAngularImpulse(CGFloat(impulse))
        }
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event:CCTouchEvent!) {
        _hero.physicsBody.applyImpulse(ccp(0,400))
        _hero.physicsBody.applyAngularImpulse(10000)
        sinceTouch = 0
    }
}
