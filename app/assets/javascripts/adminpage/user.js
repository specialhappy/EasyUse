Ext.require(['Ext.grid.*', 'Ext.data.*', 'Ext.panel.*']);
Ext.onReady(function() {

//传值时需包括区域中心和单位的id，表单里需要做下拉框，下拉框store，以及下拉框在表格和表单的对应显示

/**BEGIN 数据类型和数据源**/
	//定义数据类型
	Ext.define('datamodel', {
		extend : 'Ext.data.Model',
		fields : [{
			name : 'id',
			type : 'int',
		}, {
			name : 'name',
		}, {
			name : 'card_number',
		}, {
			name : 'password',
		}, {
			name : 'sex',
		}, {
			name : 'id_number',
		}, {
			name : 'phone',
		}, {
			name : 'picture',
		}, {
			name : 'email',
		}, {
			name : 'address',
		}, {
			name : 'login_number',
		}, {
			name : 'last_login_time',
		}, {
			name : 'status',
		}, {
			name : 'institution_id',
		}]
	});
	//定义数据源，充当页面表格的数据来源
	var store = Ext.create('Ext.data.Store', {
		model : 'datamodel',
		autoLoad : true,
		proxy : {
			type : 'ajax',
			url : '/admin/users/list',
			reader : {
				type : 'json',
				root : 'root',
				totalProperty : 'totalProperty',
				idProperty : 'id'
			}
		}
	});

	
		// 定义部门数据类型，用于下拉列表
	Ext.define('getInstitution', {
				extend : 'Ext.data.Model',
				fields : [{
							name : 'id'
						}, {
							name : 'name'
						}]

			});

	//定义数据源，充当下拉框的数据来源
	var Istore = Ext.create('Ext.data.Store', {
		model : 'getInstitution',
		autoLoad : true,
		proxy : {
			type : 'ajax',
			url : '/admin/institutions/list',
			reader : {
				type : 'json',
				root : 'root',
				totalProperty : 'totalProperty',
				idProperty : 'id'
			}
		}
	});
	
	/**END 数据类型和数据源**/
	
	/** BEGIN 表格的组件 **/
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

    var sm = new Ext.selection.CheckboxModel(); 
    var columns = [  
        Ext.create('Ext.grid.RowNumberer'),
        {
			header : 'id',
			dataIndex : 'id',
			hidden:true
		}, {
			header : '姓名',
			dataIndex : 'name'
		}, {
			header : '卡号',
			dataIndex : 'card_number'
		}, {
			header : '密码',
			dataIndex : 'password',
			hidden:true
		}, {
			header : '性别',
			dataIndex : 'sex'
		}, {
			header : '身份证号',
			dataIndex : 'id_number'
		}, {
			header : '手机号码',
			dataIndex : 'phone',
		}, {
			header : '照片',
			dataIndex : 'picture',
			hidden: true
		}, {
			header : '电子邮箱',
			dataIndex : 'email'
		}, {
			header : '联系地址',
			dataIndex : 'address'
		}, {
			header : '登录次数',
			dataIndex : 'login_number'
		}, {
			header : '最近登录时间',
			dataIndex : 'last_login_time'
		}, {
			header : '状态',
			dataIndex : 'status'
		}, {
			header : '单位',
			dataIndex : 'institution_id'
		}];
		
	var listView = Ext.create('Ext.grid.Panel', {
		//width:'45%',
		//height:'100%',
		collapsible : true,
		title : '列表',
		renderTo : Ext.getBody(),
		store : store,
		multiSelect : true,
		viewConfig : {
			emptyText : '没有记录'
		},
		forceFit: true,
		tbar : tb,
		selModel:sm,
		columns : columns,
		bbar : new Ext.PagingToolbar({
							pageSize : 25,
							store : store,
							displayInfo : true
						}),
	});
	/** END 表格的组件 **/
	
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
            html:'<img src="2.png'+' "width="130" height="160">',
            hidden:true
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
        	hidden:true
        },{
			fieldLabel : '姓名',
			name : 'name',
		}, {
			fieldLabel : '卡号',
			name : 'card_number',
		}, {
			fieldLabel : '密码',
			name : 'password',
		}, {
			xtype : 'combo',
			fieldLabel : '性别',
			name : 'sex',
		}, {
			fieldLabel : '身份证号',
			name : 'id_number',
		}, {
			fieldLabel : '手机号码',
			name : 'phone',
		}, {
			fieldLabel : '电子邮箱',
			name : 'email',
		}, {
			fieldLabel : '联系地址',
			name : 'address',
		}, {
			fieldLabel : '状态',
			name : 'status',
		}, {
			xtype : 'combo',
			fieldLabel : '单位名称',
			name : 'institution_id',
			store: Istore,
			valueField:'id',
			displayField:'name'
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
			form.isAdd = false;
			win.setTitle("查看");
			win.show();
			form.getForm().loadRecord(record[0]);
		} else {
			failureAlert("请选择一条记录进行查看");
		}
	};	
	var id=0;
	// 修改某条记录
	listView.addListener('itemdblclick', edit, this);
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


/** BEGIN 向后台发送请求 **/

	//新增及修改的请求，由form.isAdd的真值判断是否是新增
	function submitForm() {
		if (form.form.isValid()) {
			if (form.isAdd) {
				form.form.submit({
					waitMsg : '正在提交数据，请稍后...',
					waitTitle : '提示',
					url : '/admin/users',
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
					url : '/admin/users/'+id+'/modify',
					method : 'POST',										
					success: function(result,response) {
						if (response.result.info == 'success') {
							win.hide();
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
    		url:'/admin/users/delete',
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

