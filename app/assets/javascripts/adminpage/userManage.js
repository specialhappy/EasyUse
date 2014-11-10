Ext.require(['Ext.grid.*', 'Ext.data.*', 'Ext.panel.*']);
Ext.onReady(function() {

//传值时需包括区域中心和单位的id，表单里需要做下拉框，下拉框store，以及下拉框在表格和表单的对应显示
	//定义数据类型
	Ext.define('datamodel', {
		extend : 'Ext.data.Model',
		fields : [{
			name : 'id',
			type : 'int',
		}, {
			name : 'name',
		}, {
			name : 'password',
		}, {
			name : 'sex'
		}, {
			name : 'ID_number',
		}, {
			name : 'phone',
		}, {
			name : 'picture',
		}, {
			name : 'email_address',
		}, {
			name : 'address',
		}, {
			name : 'login_number',
		}, {
			name : 'last_log_time',
		}, {
			name : 'role_id',
		}, {
			name : 'institution',
		}]
	});
	//定义数据源，充当页面表格的数据来源
	var store = Ext.create('Ext.data.Store', {
		model : 'datamodel',
		autoLoad : true,
		proxy : {
			type : 'ajax',
			url : '/instruments/list_manage',
			reader : {
				type : 'json',
				root : 'root',
				totalProperty : 'totalProperty',
				idProperty : 'id'
			}
		}
	});
	var tb = Ext.create('Ext.toolbar.Toolbar', {
		items : [{
			text : '新增',
			icon : '../icons/add.gif',
			handler : add
		}, '-', {
			text : '查看',
			icon : '../icons/information.png',
			handler : display
		}, '-', {
			text : '修改',
			icon : '../icons/edit.png',
			handler : edit
		}, '-', {
			text : '删除',
			icon : '../icons/delete.gif',
			handler : destroy
		}]
	});

   
	var listView = Ext.create('Ext.grid.Panel', {
		//width:'45%',
		//height:'100%',
		collapsible : true,
		title : '仪器列表',
		renderTo : Ext.getBody(),
		store : store,
		multiSelect : true,
		viewConfig : {
			emptyText : 'No images to display'
		},
		tbar : tb,
		columns : [
    	Ext.create('Ext.grid.RowNumberer'),
    	{
			header : 'id',
			dataIndex : 'id',
			hidden:true
		}, {
			header : '姓名',
			dataIndex : 'name'
		}, {
			header : '密码',
			dataIndex : 'password',
			hidden : true
		}, {
			header : '性别',
			dataIndex : 'sex'
		}, {
			header : '身份证号',
			dataIndex : 'ID_number',
		}, {
			header : '手机号码',
			dataIndex : 'phone'
		}, {
			header : '照片',
			dataIndex : 'picture',
			hidden : true
		}, {
			header : '邮件地址',
			dataIndex : 'email_address'
		}, {
			header : '住址',
			dataIndex : 'address'
		}, {
			header : '登陆次数',
			dataIndex : 'login_number'
		}, {
			header : '最后登陆时间',
			dataIndex : 'last_log_time'
		}, {
			header : '角色',
			dataIndex : 'role_id'
		}, {
			header : '单位',
			dataIndex : 'institution'
		}],
		bbar : new Ext.PagingToolbar({
							pageSize : 25,
							store : store,
							displayInfo : true
						}),
	});

	
	/** BEGIN 工具条按钮的调用函数 **/
		// 新增某条记录
	function add() {
		form.form.reset();
		form.isAdd = true;
		win.setTitle("新增");
		win.show();
	};
	// 查看某条记录
	function display() {
		var record = listView.getSelectionModel().getSelection();
		if (record.length == 1) {			
			form.form.reset();
			//	form.isAdd = false;
			win.setTitle("查看");
			win.show();
			form.getForm().loadRecord(record[0]);
		} else {
			failureAlert("请选择一条记录进行查看");
		}
	};	
	var id=0;
	// 修改某条记录
	function edit() {
		var record = listView.getSelectionModel().getSelection();
		if (record.length == 1) {
			id = record[0].get("id");
			form.form.reset();
			form.isAdd = false;
			win.setTitle("修改");
			win.show();
			form.getForm().loadRecord(record[0]);
		} else {
			failureAlert("请选择一条记录进行修改");
		}
	};	
	    // 删除某条数据
    function destroy(){
    	var records=listView.getSelectionModel().getSelection();
    	if(records.length==0){
    		failureAlert("请至少选择一条记录进行删除");
    		return;
    	}
    	Ext.Msg.confirm('提示','您确定要删除吗？',function(btnID){
    		if(btnID=='yes'){
    			destroy_list(records);
    		}
    	});
    };
    /** END 工具条按钮的调用函数 **/

    /** BEGIN 弹出框表格，新建和修改时公用 **/
	var readonly = false;
	var form = Ext.create('Ext.form.Panel', {
		border:false,
		overflowY:'auto',
		bodyPadding: 10,
		bodyStyle : 'background:#dfe9f5',		
		defaults : {
			readOnly : readonly,
			labelWidth:80,
			anchor: '100%',
			xtype : 'textfield',
			allowBlank : true
		},
		items : [{
    		bodyStyle:'background:#dfe9f5',
    		width:145,
            autoHeight:true,
            bodyPadding: '5px',
            html:'<img src="../images/photo.png'+'" width="130" height="160">'
    	},{
            xtype: 'filefield',
            width:200,
            emptyText: '请选择上传图片',
            fieldLabel: '请上传图片',
            name: 'photoImg',
            buttonText: '浏览  ',
            labelAlign:'left'
        },  {
        	fieldLabel: '照片路径',
        	name: 'picture',
        	hidden : true
        },{
			fieldLabel : '姓名',
			name : 'name',
		}, {
			fieldLabel : '密码',
			name : 'password',
		}, {
			fieldLabel : '性别',
			name : 'sex',
		}, {
			fieldLabel : '身份证号',
			name : 'ID_number',
		}, {
			fieldLabel : '手机号码',
			name : 'phone',
		}, {
			fieldLabel : '邮件地址',
			name : 'email_address',
		}, {
			fieldLabel : '住址',
			name : 'address',
		}, {
			fieldLabel : '登陆次数',
			name : 'login_number',
			disabled : true
		}, {
			fieldLabel : '最后登陆时间',
			name : 'last_log_time',
			disabled : true
		}, {
			xtype : 'combo',
			fieldLabel : '角色',
			name : 'role_id',
		}, {
			xtype : 'combo',
			fieldLabel : '所属单位',
			name : 'institution_id',
		}]
	});
/** END 弹出框表格，新建和修改时公用 **/

/** BEGIN 公用弹出窗口 **/
    //表格的容器窗口
	var win = Ext.create('Ext.window.Window', {
		width : 400,
		//height : 300,
		minWidth : 300,
		minHeight : 200,
		layout : 'fit',
		plain : true,
		items : form,
		buttons : [{
			text : '保存',
			handler : submitForm
		}, {
			text : '取消',
			handler : function() {
				win.hide();
			}
		}]
	});
	//错误提示窗口
	function failureAlert(failureInfo) {
				top.Ext.Msg.show({
				title : '错误提示',
				msg :failureInfo,
				icon : Ext.Msg.ERROR,
				buttons : Ext.Msg.OK
			});
	};
	//成功提示窗口
	function successAlert(successInfo){
		top.Ext.Msg.show({
							title : '提示',
							msg : successInfo,
							icon : Ext.Msg.INFO,
							buttons : Ext.Msg.OK
						});
	}
	/** END 公用弹出窗口 **/

/** BEGIN 向后台发送请求 **/

	//新增及修改的请求，由form.isAdd的真值判断是否是新增
	function submitForm() {
		if (form.form.isValid()) {
			if (form.isAdd) {
				form.form.submit({
					waitMsg : '正在提交数据，请稍后...',
					waitTitle : '提示',
					url : '/instruments/create_manage',
					method : 'POST',
					success : function(result,response) {
						if (response.result.info == 'success') {
							win.hide();
							store.reload();
							successAlert("新增成功");
						} else {
							failureAlert(response.result.info);
						}
					},
					failure : function(result,response) {
						failureAlert(result.responseText);
					}
				});
			} else if (form.isAdd == false) {
				form.form.submit({
					waitMsg : '正在提交数据，请稍后...',
					waitTitle : '提示',
					url : '/instruments/'+id+'/update_manage/',
					method : 'POST',										
					success: function(result,response) {
						if (response.result.info == 'success') {
							store.reload();
							successAlert("修改成功");
						} else {
							failureAlert(response.result.info);
						}
					},
	                failure: function(result,response){
	                  failureAlert(result.responseText);
	                }					
				});
			}
		} else {
			alert('验证不通过');
		}
	};
    
	   //删除的请求，可删除多条记录
    function destroy_list (records){
    	var ids=[];
    	for(var i=0;i<records.length;i++){
    		var id=records[i].get('id');
    		ids.push(id);
    	}
    	var keys = Ext.JSON.encode(ids);
    	var msgTip =top.Ext.Msg.show({
    		title:'提示',
    		width:250,
    		msg:'正在删除信息，请稍等...'
    	});
    	Ext.Ajax.request({
    		url:'/instruments/destroy_manage',
    		params:{id:keys},
    		method:'POST',
    		success:function(response,options){
    			msgTip.hide();
    			var result=Ext.JSON.decode(response.responseText);
    			if(result.success&&result.info=='success'){
			    	store.reload();
    				successAlert("删除成功！");
    			}else{
    				failureAlert(resuilt.info);
    			}
    		}
    		
    	});
    };
    /** END 向后台发送请求 **/
    
});

