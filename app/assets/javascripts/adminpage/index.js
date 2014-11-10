Ext.require(['*']);

    Ext.onReady(function() {

        Ext.QuickTips.init();
        
        Ext.state.Manager.setProvider(Ext.create('Ext.state.CookieProvider'));
        
        //左侧菜单面板
        var menuPanel = new Ext.Panel({
            split : true,
            width : 200,
            minSize : 100,
            maxSize : 400,
            collapsible : true,
            margins : '0 0 5 5',
            bodyboder : true,
            title : '功能导航',
   //         layout : 'accordion',
            region : 'west'
        });
        
                var appointmentManage = new Ext.tree.TreePanel({
            border : false,
            title : '预约管理',
            autoScroll : true,
            rootVisible : false,
            lines : false,
            singleExpand : false,
            useArrows : true,
            root : {
                expanded : true,
                children : [{
                    text : '预约申请管理',
                    hrefTarget : '/admin/appointments',
                    leaf : true
                }, {
                    text : '可预约时间设置',
                    hrefTarget : '/admin/time_periods',
                    leaf : true
                }]
            },
            listeners:{
                itemclick:function(view,rec,item,index,e,eOpts){
                    if(rec.isLeaf())
                        loadPage(rec.data.hrefTarget,rec.data.text);
                }
            }
        });        
        menuPanel.add(appointmentManage);

        var instrumentManage = new Ext.tree.TreePanel({
            border : false,
            title : '仪器管理',
            autoScroll : true,
            rootVisible : false,
            lines : false,
            singleExpand : false,
            useArrows : true,
            root : {
                expanded : true,
                children : [{
                    text : '仪器信息',
                    hrefTarget : '/admin/instruments',
                    leaf : true
                }, {
                    text : '仪器分类',
                    hrefTarget : '/admin/instruments',
                    leaf : true
                }, {
                    text : '标签管理',
                    hrefTarget : '/admin/a_level_tags',
                    leaf : true
                }]
            },
            listeners:{
                itemclick:function(view,rec,item,index,e,eOpts){
                    if(rec.isLeaf())
                        loadPage(rec.data.hrefTarget,rec.data.text);
                }
            }
        });
        menuPanel.add(instrumentManage);
                
        var userManage = new Ext.tree.TreePanel({
            border : false,
            title : '用户管理',
            autoScroll : true,
            rootVisible : false,
            lines : false,
            singleExpand : false,
            useArrows : true,
            root : {
                expanded : true,
                children : [{
                    text : '帐号管理',
                    hrefTarget : '/admin/users',
                    leaf : true
                }, {
                    text : '群组管理',
                    hrefTarget : '/admin/groups',
                    leaf : true
                }, {
                    text : '区域中心管理',
                    hrefTarget : '/admin/region_centers',
                    leaf : true
                }, {
                    text : '单位管理',
                    hrefTarget : '/admin/institutions',
                    leaf : true
                }]
            },
            listeners:{
                itemclick:function(view,rec,item,index,e,eOpts){
                    if(rec.isLeaf())
                        loadPage(rec.data.hrefTarget,rec.data.text);
                }
            }
        });        
        menuPanel.add(userManage);
        
        var priviligeManage = new Ext.tree.TreePanel({
            border : false,
            title : '权限管理',
            autoScroll : true,
            rootVisible : false,
            lines : false,
            singleExpand : false,
            useArrows : true,
            root : {
                expanded : true,
                children : [{
                    text : '权限列表',
                    hrefTarget : '/admin/priviliges',
                    leaf : true
                }, {
                    text : '角色管理',
                    hrefTarget : '/admin/roles',
                    leaf : true
                }]
            },
            listeners:{
                itemclick:function(view,rec,item,index,e,eOpts){
                    if(rec.isLeaf())
                        loadPage(rec.data.hrefTarget,rec.data.text);
                }
            }
        });        
        menuPanel.add(priviligeManage);
        
        //中部显示面板
        var contentPanel = new Ext.Panel({
        	height:5000,
            layout:'fit',
            //border : false,
            //bodyborder : false,
            autoScroll : false,
            region : 'center',
            contentEl:'center',
            id:'mainContent',
            margins: '0 5 5 0',
            bodyStyle: 'background:#f0f0f0; padding:5px;'
        });
        var viewport = Ext.create('Ext.Viewport', {
            id: 'border-example',
            layout: 'border',
            items: [
            // 定义界面上方
            Ext.create('Ext.Component', {
                region: 'north',
                height: 32,
                autoEl: {
                    tag: 'div',
                    html:'<p>north - generally for menus, toolbars and/or advertisements</p>'
                }
            }),
                menuPanel
                ,contentPanel
                ]
        });
        var curNode=instrumentManage.root;
        if(curNode.children.length>0){
            curNode=curNode.children[0];
        };
        loadPage(curNode.hrefTarget,curNode.text);
        
    });
    
    function loadPage(url,text) {
        Ext.getDom('iframeContent').src=url;
       // Ext.getCmp('mainContent').setTitle(text);
    }