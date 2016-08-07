defineClass("WeChatTableViewController", {
            tableView_numberOfRowsInSection:function(tableView, section) {
            return self.weChatData().count();
            }
            })