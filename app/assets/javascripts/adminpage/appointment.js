Ext.require(['Ext.grid.*', 'Ext.data.*', 'Ext.panel.*']);
Ext.onReady(function() {

	/**BEGIN 数据类型和数据源**/
	//定义数据类型
	Ext.define('datamodel', {
		extend : 'Ext.data.Model',
		fields : [{
			name : 'id',
			type : 'int',
		}, {
			name : 'start_time',
			type : 'datetime'
		}, {
			name : 'end_time',
			type : 'datetime'
		}, {
			name : 'price_paid',
		}, {
			name : 'fee',
			type : 'decimal'
		}, {
			name : 'submit_time',
		}, {
			name : 'status'
		}, {
			name : 'instrument_id',
		}, {
			name : 'group_id',
		}, {
			name : 'user_id',
		}]
	});
	//定义数据源，充当页面表格的数据来源
	var store = Ext.create('Ext.data.Store', {
		model : 'datamodel',
		autoLoad : true,
		proxy : {
			type : 'ajax',
			url : '/admin/appointments/list',
			reader : {
				type : 'json',
				root : 'root',
				totalProperty : 'totalProperty',
				idProperty : 'id'
			}
		}
	});
	// 定义数据类型，用于下拉列表
	Ext.define('combomodel', {
				extend : 'Ext.data.Model',
				fields : [{
							name : 'id'
						}, {
							name : 'name'
						}]
			});
	//定义仪器数据源，充当下拉框的数据来源
	var Mstore = Ext.create('Ext.data.Store', {
		model : 'combomodel',
		autoLoad : true,
		proxy : {
			type : 'ajax',
			url : '/admin/instruments/list',
			reader : {
				type : 'json',
				root : 'root',
				totalProperty : 'totalProperty',
				idProperty : 'id'
			}
		}
	});
	//定义用户数据源，充当下拉框的数据来源
	var Ustore = Ext.create('Ext.data.Store', {
		model : 'combomodel',
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
	//定义群组数据源，充当下拉框的数据来源
	var Gstore = Ext.create('Ext.data.Store', {
		model : 'combomodel',
		autoLoad : true,
		proxy : {
			type : 'ajax',
			url : '/admin/groups/list',
			reader : {
				type : 'json',
				root : 'root',
				totalProperty : 'totalProperty',
				idProperty : 'id'
			}
		}
	});
	var paidStore = new Ext.data.Store({
				fields : ['id', 'name'],
				data : [{
							'id' : 1,
							'name' : '可支付'
						}, {
							'id' : 2,
							'name' : '未支付'
						}, {
							'id' : 3,
							'name' : '待退款'
						}, {
							'id' : 4,
							'name' : '已退款'
						}]
			});
	var statusStore = new Ext.data.Store({
				fields : ['id', 'name'],
				data : [{
							'id' : 1,
							'name' : '待审核'
						}, {
							'id' : 2,
							'name' : '审核通过'
						}, {
							'id' : 3,
							'name' : '审核未通过'
						}, {
							'id' : 4,
							'name' : '用户已取消'
						}]
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
			header : '预约人',
			dataIndex : 'user_id'
		}, {
			header : '预约仪器',
			dataIndex : 'instrument_id'
		}, {
			header : '预约开始时间',
			dataIndex : 'start_time',
			renderer: Ext.util.Format.dateRenderer('Y-m-d')
		}, {
			header : '预约结束时间',
			dataIndex : 'end_time',
			renderer: Ext.util.Format.dateRenderer('Y-m-d')
		}, {
			header : '费用',
			dataIndex : 'fee'
		}, {
			header : '使用群组',
			dataIndex : 'group_id'
		}, {
			header : '支付状态',
			dataIndex : 'price_paid'
		}, {
			header : '预约提交时间',
			dataIndex : 'submit_time',
			renderer: Ext.util.Format.dateRenderer('Y-m-d')
		}, {
			header : '审核状态',
			dataIndex : 'status',
			renderer:function(value){  
            if(value=='待审核'){  
                return "<span style='color:blue;font-weight:bold';>待审核</span>";  
            } else if(value=='未开始') {  
                return "<span style='color:green;font-weight:bold';>审核通过</span>";  
            }else if(value=='进行中') {  
                return "<span style='color:green;font-weight:bold';>审核通过</span>";  
            }else if(value=='已结束') {  
                return "<span style='color:green;font-weight:bold';>审核通过</span>";  
            }else if(value=='审核未通过') {  
                return "<span style='color:red;font-weight:bold';>审核未通过</span>";  
            }else if(value=='用户已取消') {  
                return "<span style='color:black;font-weight:bold';>用户已取消</span>";  
            }  
            }
		}, {
			xtype:"actioncolumn",
			header : '查看预约表单',
			items:[
		    {icon:'../icons/information.png',tooltip:"下载",handler:function(grid,rindex,cindex){
		     var record=grid.getStore().getAt(rindex);
		     var id=record.get("id");
		     show_application_form(id);
		    }}
		   ]
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
/** END表格的组件 **/
    
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
    
    function show_application_form(id){
    	alert(id);
} 
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
			fieldLabel : '预约开始时间',
			xtype : 'datefield',
			name : 'start_time',
		}, {
			fieldLabel : '预约结束时间',
			xtype : 'datefield',
			name : 'end_time',
		}, {
			xtype : 'combo',
			fieldLabel : '审核状态',
			name : 'status',
			store: statusStore,
			valueField:'name',
			displayField:'name'
		}, {
			xtype : 'combo',
			fieldLabel : '支付状态',
			name : 'price_paid',
			store: paidStore,
			valueField:'name',
			displayField:'name'
		}, {
			fieldLabel : '费用',
			name : 'fee',
		}, {
			fieldLabel : '预约提交时间',
			name : 'submit_time',
			xtype : 'datefield',
		}, {
			xtype : 'combo',
			fieldLabel : '预约人',
			name : 'user_id',
			store: Ustore,
			valueField:'id',
			displayField:'name'
		}, {
			xtype : 'combo',
			fieldLabel : '预约仪器',
			name : 'instrument_id',
			store: Mstore,
			valueField:'id',
			displayField:'name'
		}, {
			xtype : 'combo',
			fieldLabel : '使用群组',
			name : 'group_id',
			store: Gstore,
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

/** BEGIN 向后台发送请求 **/

	//新增及修改的请求，由form.isAdd的真值判断是否是新增
	function submitForm() {
		if (form.form.isValid()) {
			if (form.isAdd) {
				form.form.submit({
					waitMsg : '正在提交数据，请稍后...',
					waitTitle : '提示',
					url : '/admin/appointments',
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
					url : '/admin/appointments/'+id+'/modify',
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
    		url:'/admin/appointments/delete',
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

