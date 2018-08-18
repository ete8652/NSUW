require("UIColor");

defineClass("FirstViewController", {
            viewDidLoad: function() {
            self.super().viewDidLoad();
            self.view().setBackgroundColor(UIColor.greenColor());
            },
            viewWillAppear: function(animated) {
            self.super().viewWillAppear(animated);
            NSLog("OK");
            }
            }, {});
