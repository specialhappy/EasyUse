Ext.require(['Ext.tree.*', 'Ext.data.*', 'Ext.panel.*']);
Ext.require(['*']);

    Ext.onReady(function() {

        Ext.QuickTips.init();
        
        Ext.state.Manager.setProvider(Ext.create('Ext.state.CookieProvider'));
        
        var p1=document.getElementById("privilige1").value;
        var p2=document.getElementById("privilige2").value;
        var p3=document.getElementById("privilige3").value;
        var p4=document.getElementById("privilige4").value;
        var privilige={"预约管理":p1,"仪器管理":p2,"用户管理":p3,"权限管理":p4};
        var p_appointment=privilige.预约管理;
        var p_instrument=privilige.仪器管理;
        var p_user=privilige.用户管理;
        var p_privilige=privilige.权限管理;


       // alert(x.value);
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

        var appointmentNode1=({
            text : '预约申请管理',
            hrefTarget : '/admin/appointments',
            leaf:true
        });
        var appointmentNode2=({
            text : '可预约时间设置',
            hrefTarget : '/admin/time_periods',
            leaf:true
        }); 
		var appointmentStore = Ext.create('Ext.data.TreeStore', {
			root : {
				expanded : true,
			}
		});
 	   var appointmentManage = new Ext.tree.TreePanel({
            border : false,
            title : '预约管理',
            autoScroll : true,
            rootVisible : false,
            lines : false,
            singleExpand : false,
            useArrows : true,
            store:appointmentStore,
            listeners:{
                itemclick:function(view,rec,item,index,e,eOpts){
                    if(rec.isLeaf())
                        loadPage(rec.data.hrefTarget,rec.data.text);
                }
            }
        });
        if(p_appointment[0]=='1'){
        	menuPanel.add(appointmentManage); 
        	var a = appointmentStore.getRootNode();
        	if(p_appointment[1]=='1'){
        		a.appendChild(appointmentNode1);
        	}
        	if(p_appointment[2]=='1'){
        		a.appendChild(appointmentNode2);
        	}
        }
               		
        var instrumentNode1=({
            text : '仪器信息',
            hrefTarget : '/admin/instruments',
            leaf:true
        });
        var instrumentNode2=({
            text : '仪器分类',
            hrefTarget : '/admin/instruments',
            leaf:true
        });
        var instrumentNode3=({
            text : '一级标签管理',
            hrefTarget : '/admin/a_level_tags',
            leaf:true
        });
        var instrumentNode4=({
            text : '二级标签管理',
            hrefTarget : '/admin/b_level_tags',
            leaf:true
        });
		var instrumentStore = Ext.create('Ext.data.TreeStore', {
			root : {
				expanded : true,
			}
		});
        var instrumentManage = new Ext.tree.TreePanel({
            border : false,
            title : '仪器管理',
            autoScroll : true,
            rootVisible : false,
            lines : false,
            singleExpand : false,
            useArrows : true,
            store : instrumentStore,
            listeners:{
                itemclick:function(view,rec,item,index,e,eOpts){
                    if(rec.isLeaf())
                        loadPage(rec.data.hrefTarget,rec.data.text);
                }
            }
        });
        if(p_instrument[0]=='1'){
        	menuPanel.add(instrumentManage); 
        	var b = instrumentStore.getRootNode();
        	if(p_instrument[1]=='1'){
        		b.appendChild(instrumentNode1);
        	}
        	if(p_instrument[2]=='1'){
        		b.appendChild(instrumentNode2);
        	}
        	if(p_instrument[3]=='1'){
        		b.appendChild(instrumentNode3);
        	}
        	if(p_instrument[4]=='1'){
        		b.appendChild(instrumentNode4);
        	}
        }

        var userNode1=({
            text : '帐号管理',
            hrefTarget : '/admin/users',
            leaf:true
        });
        var userNode2=({
            text : '群组管理',
            hrefTarget : '/admin/groups',
            leaf:true
        });
        var userNode3=({
            text : '区域中心管理',
            hrefTarget : '/admin/region_centers',
            leaf:true
        });
        var userNode4=({
            text : '单位管理',
            hrefTarget : '/admin/institutions',
            leaf:true
        });
		var userStore = Ext.create('Ext.data.TreeStore', {
			root : {
				expanded : true,
			}
		});                
        var userManage = new Ext.tree.TreePanel({
            border : false,
            title : '用户管理',
            autoScroll : true,
            rootVisible : false,
            lines : false,
            singleExpand : false,
            useArrows : true,
            store : userStore,
            listeners:{
                itemclick:function(view,rec,item,index,e,eOpts){
                    if(rec.isLeaf())
                        loadPage(rec.data.hrefTarget,rec.data.text);
                }
            }
        });
        if(p_user[0]=='1'){
        	menuPanel.add(userManage); 
        	var b = userStore.getRootNode();
        	if(p_user[1]=='1'){
        		b.appendChild(userNode1);
        	}
        	if(p_user[2]=='1'){
        		b.appendChild(userNode2);
        	}
        	if(p_user[3]=='1'){
        		b.appendChild(userNode3);
        	}
        	if(p_user[4]=='1'){
        		b.appendChild(userNode4);
        	}
        }
        
        var priviligeNode1=({
            text : '权限列表',
            hrefTarget : '/admin/priviliges',
            leaf:true
        });
        var priviligeNode2=({
            text : '角色管理',
            hrefTarget : '/admin/roles',
            leaf:true
        });
        var priviligeStore = Ext.create('Ext.data.TreeStore', {
			root : {
				expanded : true,
			}
		}); 
        var priviligeManage = new Ext.tree.TreePanel({
            border : false,
            title : '权限管理',
            autoScroll : true,
            rootVisible : false,
            lines : false,
            singleExpand : false,
            useArrows : true,
            store : priviligeStore,
            listeners:{
                itemclick:function(view,rec,item,index,e,eOpts){
                    if(rec.isLeaf())
                        loadPage(rec.data.hrefTarget,rec.data.text);
                }
            }
        });        
        if(p_privilige[0]=='1'){
        	menuPanel.add(priviligeManage); 
        	var b = priviligeStore.getRootNode();
        	if(p_privilige[1]=='1'){
        		b.appendChild(priviligeNode1);
        	}
        	if(p_privilige[2]=='1'){
        		b.appendChild(priviligeNode2);
        	}
        }
        
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
                margins: '0 15 5 0',
                contentEl:'north'
            }),
                menuPanel,
                contentPanel
                ]
        });

        loadPage('/admin/appointments','预约申请管理');
    });
    
    function loadPage(url,text) {
        Ext.getDom('iframeContent').src=url;
        Ext.getCmp('mainContent').setTitle(text);
    }