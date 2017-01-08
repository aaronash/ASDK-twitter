# ASDK-twitter
Super simple iOS twitter client built to experiment with [AsyncDisplayKit](https://github.com/facebook/AsyncDisplayKit). I made this in a little over an hour, so the code might not be pretty.

ASDK has a really cool [layout engine](http://asyncdisplaykit.org/docs/layout2-quickstart.html), which makes things like varying height tableview cells super easy to create, as well as super fast. Way faster/better than AutoLayout.

The layout code for a cell looks like this:
```objective-c
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    ASStackLayoutSpec *stack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStretch children:@[_nameNode, _tweetTextNode]];
    stack.style.flexShrink = 1.0;
    
    ASStackLayoutSpec *horizontalStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:10 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[_profilePic, stack]];
    
    ASInsetLayoutSpec *inset = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:horizontalStack];
    
    return inset;
}
```
First, a vertical stack with the username and tweet text is created, then that is put inside a horizontal stack to place the avatar on the left side, and then we set a 10 pixel inset on the whole thing. And that's it, ASDK magically does all the layout, cell heights, and everything. You can easily add tappable links too.

Remote images are also super easy, you just create an image node and set a URL, ASDK does the rest.

Overall, really cool and worth checking out. Wish this was around when I built [Flurry](http://flurryapp.com/) a few years ago, it makes many pain points from the iOS 5 days so much easier.


![Screenshot](https://github.com/aaronash/ASDK-twitter/raw/master/screenshots/screenshot1.png)
