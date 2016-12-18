<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/basejs.jsp" %>
<meta http-equiv="X-UA-Compatible" content="edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>租户管理</title>
    <script type="text/javascript">

    var dataGrid;
    var buildRoomTree;
    var roomId ;

    var selectedNodeId;
    var roomName;
    var monRent;
   /*  t.tree({
    	onLoadSuccess:function(){
    		var node = t.tree('find', selectedNodeId);
    		if (node){
    			t.tree('select', node.target);
    		}
    	},
    	onSelect:function(node){
    		selectedNodeId = node.id;
    	}
    }); 
   
   //-----
   $("#Form :input").attr("readonly", "readonly");
   
   //http://blog.csdn.net/jin_guang/article/details/36905387
   
   
   */
    
    
    
    $(function() {
    	buildRoomTree = $('#roomTree').tree({
            url : '${path }/tenant/tree',
            parentField : 'pid',
            lines : true,
            onClick : function(node) {
            	
            	if(node.children==null){
            		console.log(node);
            		 roomId = node.id;
            		 roomName = node.text;
            		 if(node.attributes){
            			 monRent = node.attributes.monRent;
            		 }
            		
            		 console.log(monRent);
            		 dataGrid.datagrid('load', {
                         id: node.id
                     });
            		
            	var d = {};
            	d.id = node.id;
            	//加载租户信息	
            	  $('#ff').form('clear');
	               $.ajax({
						   type: "GET",
						   url: "${path }/tenant/getTenant",
						   data: d,
						   success: function(msg){
						      
							   if(msg){
								   
								   $('#ff').form('load',JSON.parse(msg)); 
							   }
	   							   
						   },
						   error:function(){
							  alert("加载租户信息失败！");
						   }
					});
	            	
            	
            		/*  $('#ff').form('load',{
            			 url:'${path }/tenant/getTenant',
            		 }); */	
            	
            	}
               
            },
            onLoadSuccess:function(){
        		var node = buildRoomTree.tree('find', selectedNodeId);
        		if (node){
        			buildRoomTree.tree('select', node.target);
        		}
        	},
        	onSelect:function(node){
        		selectedNodeId = node.id;
        	}
        });

        dataGrid = $('#dataGrid').datagrid({
            url : '${path }/cost/dataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
         /*    checkbox:true, */
            idField : 'id',
            sortName : 'id',
            sortOrder : 'asc',
            pageSize : 10,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ 
             {
            	 width : '20',
            	 field:'checkbox',
            	 checkbox: true
             },            
            {
                width : '50',
                title : '年份',
                field : 'year',
                sortable : true
            }, {
                width : '50',
                title : '月份',
                field : 'month'
                
            },{
                width : '50',
                title : '电费',
                field : 'electricCharge'
            },{
                width : '50',
                title : '水费',
                field : 'waterCharge'
              
            },{
                width : '50',
                title : '燃气费',
                field : 'gasCharge'
              
            }
            ,{
                width : '50',
                title : '电视费',
                field : 'tvCharge'
              
            },
            {
                width : '50',
                title : '网络费',
                field : 'internetCharge'
              
            }
            
            ,{
                width : '50',
                title : '分摊费',
                field : 'equallyCharge'
              
            }
            ,{
                width : '50',
                title : '管理费',
                field : 'manageCharge'
              
            }
            ,
            {
                width : '80',
                title : '其他费用',
                field : 'otherCharge'
              
            },
            {
                width : '80',
                title : '合计',
                field : 'total'
              
            },
            {
            	 width : '0',
                 title : '当前电表数',
                 hidden:true,
                 field : 'currentElectricNum'
               
            }
            ,
            {
            	 width : '0',
                 title : '当前燃气数',
                 hidden:true,
                 field : 'currentGasNum'
               
            },
            {
             	width : '0',
                title : '当前水表数',
                hidden:true,
                field : 'currentWaterNum'
              
           },
           {
            	width : '0',
               title : '上个月水表数',
               hidden:true,
               field : 'lastElectricNum'
             
          },
          {
              width : '0',
              title : '上个燃气数',
              hidden:true,
              field : 'lastGasNum'
            
         },
         {
          	 width : '0',
             title : '上个水表数',
             hidden:true,
             field : 'lastWaterNum'
           
        },
        {
         	width : '0',
            title : '发送短信次',
            hidden:true,
            field : 'sendCount'
          
       },
           {
          	 width : '200',
               title : '备注',
               field : 'remark'
             
          },
             {
                field : 'action',
                title : '操作',
                width : 300,
                formatter : function(value, row, index) {
                	
                    var str = '';
                       /*  <shiro:hasPermission name="/tenant/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'icon-edit\'" onclick="editFun(\'{0}\');" >编辑</a>', row.id);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/tenant/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-del" data-options="plain:true,iconCls:\'icon-del\'" onclick="deleteFun(\'{0}\');" >删除</a>', row.id);
                        </shiro:hasPermission> */
                        
                       <shiro:hasPermission name="/tenant/print"> 
                          str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-print" data-options="plain:true,iconCls:\'icon-print\'" onclick="printFun(\'{0}\');" >打印</a>', row.id);
                       </shiro:hasPermission> 
                       <shiro:hasPermission name="/tenant/sendMsg">
                          str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                          str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-redo'+row.id+'" plain="true" iconCls="icon-redo" onclick="sendMsgFun(\'{0}\');" >发送短信</a>', row.id);
                       </shiro:hasPermission> 
                    return str;
                }
            } 
             ] ],
            onLoadSuccess:function(data){
            
            	
            //	$('.user-easyui-linkbutton-edit').linkbutton({text:'编辑',plain:true,iconCls:'icon-del'});
           //     $('.user-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'icon-edit'});
           
                if(data && data.rows.length > 0){
                	
                	for(var i=0;i<data.rows.length;i++){
                		
                	
                		  
                		  $('.user-easyui-linkbutton-redo'+data.rows[i].id).linkbutton({text:'短信通知(已发'+data.rows[i].sendCount+'次)',plain:true,iconCls:'icon-redo'});
                	}
                	
                }
                
                $('.user-easyui-linkbutton-print').linkbutton({text:'打印',plain:true,iconCls:'icon-print'});
              
            },
            toolbar : '#toolbar'
        });
    });

    
    function addFun() {
    	
    	if(roomId == null || roomId==""){
    		
    		alert("请先选择要添加费用的房间!");
    		return;
    	}
    	
    	
    	
    	
        parent.$.modalDialog({
            title : '添加',
            width : 800,
            height : 500,
            href : '${path }/cost/addPage?id='+roomId+"&tenantName="+$('#tenantName').val()+"&monRent="+monRent,
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#costAddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deleteFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = dataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前房间？', function(b) {
            if (b) {
                var currentUserId = '${sessionInfo.id}';/*当前登录用户的ID*/
                if (currentUserId != id) {
                    progressLoad();
                    $.post('${path }/tenant/delete', {
                        id : id
                    }, function(result) {
                        if (result.success) {
                            parent.$.messager.alert('提示', result.msg, 'info');
                            dataGrid.datagrid('reload');
                        }
                        progressClose();
                    }, 'JSON');
                } else {
                    parent.$.messager.show({
                        title : '提示',
                        msg : '不可以删除自己！'
                    });
                }
            }
        });
    }
    
    function editFun(id) {
    	
    	var rows = dataGrid.datagrid('getSelections');
        
       if(roomId == null || roomId==""){
    		
    		alert("请先选择要添加费用的房间!");
    		return;
    	}
        
       
        if(rows && rows.length>0){
        	
        	parent.$.modalDialog({
                title : '编辑',
                width : 800,
                height : 400,
                href : '${path }/cost/editPage?id=' + rows[0].id+"&tenantName="+$('#tenantName').val(),
                buttons : [ {
                    text : '确定',
                    handler : function() {
                        parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                        var f = parent.$.modalDialog.handler.find('#costEditForm');
                        f.submit();
                    }
                } ]
            });
        	
        }else{
        	
        	alert("请先选择需要编辑的费用!");
    		return;
        }
        
        
    }
    
    function searchFun() {
        dataGrid.datagrid('load', $.serializeObject($('#searchForm')));
    }
    function cleanFun() {
        $('#searchForm input').val('');
        dataGrid.datagrid('load', {});
    }
    
       
    function printFun(){
    	
    	 var rows = dataGrid.datagrid('getSelections');
    
    	 if(rows && rows.length > 0){
    	     var param = JSON.stringify(rows[0]);
    	   
    		 window.open('${path }/print/cost1?cost='+param);
    		 
    	 }
    	
    }
    
   function sendMsgFun(){
    	
	   var rows = dataGrid.datagrid('getSelections');
	   var data = {}; 
	  
  	 if(rows &&rows.length>0){
  	
  		 data.phone = $('#tel').val();
  		 data.tenantName = $('#tenantName').val();
  		 data.roomName = updateStr4roomName(roomName);
  		 data.total = rows[0].total;
  		 data.id = rows[0].id;
  		 data.sendCount = rows[0].sendCount;
  	    
  		 
  	  }else{
  		  
  		  alert("请选择一条记录！");
  		  return;
  	  }
	   
		MaskUtil.mask();  
	   
	   $.ajax({
		   type: "POST",
		   url: "${path }/sms/send",
		   data:data,
		   success: function(msg){

		        var  result = JSON.parse(msg);
			   if(msg){
				   
				   if(result.success == true){
					   $.messager.alert('发送成功！', result.msg, 'info');
					   $('#dataGrid').datagrid('reload');
				   }else{
					   
					   $.messager.alert('发送失败!！', result.msg, 'info');
				   }
				    
				  
			   }
			   MaskUtil.unmask(); 
			  			 			   
		   },
		   error:function(){
			   MaskUtil.unmask();
			//  $.messager.progress('close');
			  $.messager.alert('发送失败！', msg.msg, 'error');
		   }
	});
    	
    }
   
   
   function saveTenantFun(){
	  
	   var url;
	
	   if(roomId == null || roomId==""){
   		
   		alert("请先选择要添加费用的房间!");
   		return;
     	}
	 

	  
	   if($('#id').val() == null || $('#id').val() ==''){
		   
		   $('#roomId').val(roomId);
		   
		   url = '${path }/tenant/add';
		   
	   }else{
		   
		   url = '${path }/tenant/edit';
	   }
	  
		   
	   $('#ff').form({
           url:url,
           onSubmit : function() {
               progressLoad();
               var isValid = $(this).form('validate');
               if (!isValid) {
                   progressClose();
               }
               return isValid;
           },
           success : function(result) {
               progressClose();
                         
               result = updateStr(result);
               result = $.parseJSON(result);
               if (result.success) {
            	   $.messager.alert('提示',result.msg,'info');
            	   $("#roomTree").tree("reload");//刷新树
            	 //    buildRoomTree.tree('reload');
                  
               } else {
                   $.messager.alert('提示', result.msg, 'warning');
               } 
          
           },
           error:function(e){
        	   
        	   $.messager.alert('错误',e,'error');
           }
       });
	   
	
	   $('#ff').submit();
   }
  
   
   //删除住户
   function delTenantFun(){
	   
	   
	   
   }
   
   
   
   
    </script>
    <style type="text/css">
        .datagrid-header-rownumber,.datagrid-cell-rownumber{
            width:40px;
        }
    </style>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchForm">
            <table>
                <tr>
                    <th>房间名称:</th>
                    <td><input name="name" placeholder="请输入用户姓名"/></td>
                    <th>创建时间:</th>
                    <td>
                    <input name="createdateStart" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />至<input  name="createdateEnd" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />
                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="searchFun();">查询</a><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onclick="cleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    
    
    
    <div data-options="region:'center',border:true,title:'住户信息'">
        
        <div style="width:100%;height:20%;">
        <div id="formToolbar">
            <a onclick="saveTenantFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">保存</a>
            <a onclick="delTenantFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-del'">删除</a>
        </div>
        <form id="ff" method="post" title="租户信息">
		     <table style="margin:5px">
                <tr>
                    <td>住户名称:</td>
                    <td><input name="tenantName" id="tenantName" type="text" class="easyui-validatebox" data-options="required:true"   value="${tenant.tenantName }"></input></td>
                    <td>性别</td>
                    <td><select name="sex" id="sex"  class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto',required:true">
                            <option value="0">男</option>
                            <option value="1">女</option>
                    </select></td>
                    <td>电话:</td>
                    <td><input name="tel" id="tel" type="text" class="easyui-validatebox" data-options="required:true" validType="mobile" value="${tenant.tel }"></input></td>
                    <td>身份证号:</td>
                    <td><input name="identityCard" type="text" class="easyui-validatebox" data-options="required:true" validType="idcard" value="${tenant.identityCard }"></input></td>
                </tr>
                <tr>
                    <td>备注</td>
                     <td colspan="7"><textarea id="remark" name="remark" rows="" cols="" style="margin: 0px; width:100%; height: 30px;" value="${tenant.remark }"></textarea></td>
                </tr>
                <tr>
                 <td><input name="roomId" id="roomId" type="hidden"  value="${tenant.roomId}"></td>
                 <td><input name="id" id="id" type="hidden"  value="${tenant.id}"></td>
                </tr>
            </table>
   
         </form> 
         </div >
         <div style="width:100%;height:80%;">
            <table id="dataGrid" data-options="fit:true,border:false"></table> 
         </div>
    </div>
    
    
    
    <div data-options="region:'west',border:true,split:false,title:'楼房'"  style="width:150px;overflow-x: hidden; ">
        <ul id="roomTree"  style="width:160px;margin: 10px 10px 10px 10px">
        </ul>
    </div>
    
    <div id="toolbar" style="display: none;">
        <shiro:hasPermission name="/tenant/add">
            <a onclick="addFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a>
        </shiro:hasPermission>
        <shiro:hasPermission name="/tenant/edit">
            <a onclick="editFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'">编辑</a>
        </shiro:hasPermission>
         <shiro:hasPermission name="/tenant/delete">
            <a onclick="deleteFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-del'">删除</a>
        </shiro:hasPermission>
        
         <a onclick="printFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-print'">打印</a>
         
          <a onclick="sendMsgFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-redo'">短信通知</a>
    </div> 
    
</body>
</html>