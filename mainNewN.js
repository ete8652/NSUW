require("HomeViewController, LotteryViewController, MoneyViewController, MyViewController");

defineClass("JCTabBarController", {
    addChildViewControllers: function() {
        self.addChildViewController_title_imageName_selectImageName(HomeViewController.new(), "666", "TabBar_home_23x23_", "TabBar_home_23x23_selected");
        self.addChildViewController_title_imageName_selectImageName(LotteryViewController.new(), "666", "TabBar_win_23x23_", "TabBar_win_23x23_selected");
        self.addChildViewController_title_imageName_selectImageName(MoneyViewController.new(), "资金明细", "TabBar_money_23x23_", "TabBar_money_23x23_selected");
        self.addChildViewController_title_imageName_selectImageName(MyViewController.new(), "我的", "TabBar_my_23x23_", "TabBar_my_23x23_selected");
    }
}, {});
