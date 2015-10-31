# materialView
Extension for UIView. Class support two type of animation: show (present) and tap (touch).

If you would add animation effect when tapped button, textField etc , you can create new extension for class UIControl, and override method touchesBegan(_: withEvent:) and start animation here. Can look examples (file UIControl+Material.swift).
Just the same manner implemented animation for UITableViewCell.

>'long' view -  the view with aspect ratio is 1:8 or 8:1
>
>For 'long' view animation begin from circle with radius which equal to smaller sides of view. Otherwise - animation begin from point.
