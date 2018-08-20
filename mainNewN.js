defineClass("MyViewController", {
    dataArray: function() {
        if (!_dataArray) {
            _dataArray = [ {
                imageName: "my_user",
                type: "0",
                titleName: "修改了"
            }, {
                imageName: "my_exchangePW",
                type: "1",
                titleName: "登录密码"
            }, {
                imageName: "my_notification",
                type: "2",
                titleName: "消息中心"
            }, {
                imageName: "my_money",
                type: "3",
                titleName: "资金管理"
            }, {
                imageName: "my_moneyPW",
                type: "6",
                titleName: "取款密码"
            }, {
                imageName: "my_bankCard",
                type: "4",
                titleName: "银行卡"
            }, {
                imageName: "my_today",
                type: "7",
                titleName: "今日已结"
            }, {
                imageName: "my_story",
                type: "5",
                titleName: "下注记录"
            }, {
                imageName: "my_kefu",
                type: "8",
                titleName: "客服中心"
            }, {
                imageName: "my_kefu",
                type: "9",
                titleName: "建议反馈"
            } ];
        }
        return _dataArray;
    }
}, {});
