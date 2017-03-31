<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<%@ include file="/commons/basejs.jsp" %>
<script type="text/javascript">
    var projectRegHeadDataGrid;
    $(function() {
        projectRegHeadDataGrid = $('#projectRegHeadDataGrid').datagrid({
        url : '${path}/project/dataGrid',
        striped : true,
        rownumbers : true,
        fitColumns:true,
        pagination : true,
        singleSelect : true,
        idField : 'projectId',
        sortName : 'projectId',
        sortOrder : 'asc',
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
        frozenColumns:[[
        	{
                width : '60',
                title : '编号',
                field : 'projectId',
                hidden:'true'
               
            },{
                width : '160',
                title : '项目名称',
                field : 'projectName'
            }
    	]],
        columns:  [[ {
            width : '60',
            title : '项目合同签订方',
            field : 'projectType'
        },{
            width : '60',
            title : '建设单位',
            field : 'buildOrg'
        },{
            width : '60',
            title : '联系人',
            field : 'contactPerson'
        },{
            width : '60',
            title : '联系地址',
            field : 'contactsAddress'
        },{
            width : '60',
            title : '联系电话',
            field : 'contactCall'
        },{
            width : '60',
            title : '手机',
            field : 'contactTel'
        },{
            width : '60',
            title : '传真',
            field : 'contactFax'
        },{
            width : '60',
            title : '工作内容',
            field : 'workDetail'
        },{
            width : '60',
            title : '项目类型',
            field : 'projectType'
        },{
            width : '60',
            title : '行业类别',
            field : 'businessType'
        },{
            width : '60',
            title : '审批机关',
            field : 'aproveDepartment'
        },{
            width : '60',
            title : '有无合同',
            field : 'isContract',
            sortable : true,
            formatter : function(value, row, index) {
                switch (value) {
                case 0:
                    return '无';
                case 1:
                    return '有';
                }
            }
        },{
            width : '60',
            title : '开始时间',
            field : 'startDate',
            sortable : true
        },{
            width : '60',
            title : '结束时间',
            field : 'endDate',
            sortable : true
        },{
            width : '60',
            title : '扣罚比例',
            field : 'projectPunishRate',
            sortable : true
        },{
            width : '60',
            title : '扣罚理由',
            field : 'punishReason',
            sortable : true
        },{
            width : '60',
            title : '业务室',
            field : 'businessRoom',
            sortable : true
        },{
            width : '60',
            title : '项目经理',
            field : 'manager',
            sortable : true
        },{
            width : '60',
            title : '档案室',
            field : 'recordRoom',
            sortable : true
        },{
            width : '60',
            title : '分管院长',
            field : 'brancheDean',
            sortable : true
        },{
            width : '60',
            title : '填单人',
            field : 'fillPerson',
            sortable : true
        },{
            width : '60',
            title : '项目组织',
            field : 'projectGroupLeader',
            sortable : true
        },{
            width : '60',
            title : '部门负责人',
            field : 'departmentCharger',
            sortable : true
        },{
            width : '60',
            title : '主管院长',
            field : 'chargeDean',
            sortable : true
        }, 
        
        {
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
             //   <shiro:hasPermission name="/projectRegHead/edit"> </shiro:hasPermission>
                    str += $.formatString('<a href="javascript:void(0)" class="projectRegHead-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="projectRegHeadEditFun(\'{0}\');" >编辑</a>', row.projectId);
                
              //  <shiro:hasPermission name="/projectRegHead/delete"></shiro:hasPermission>
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="projectRegHead-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="projectRegHeadDeleteFun(\'{0}\');" >删除</a>', row.projectId);
                
                return str;
            }
        } ]],
        onLoadSuccess:function(data){
            $('.projectRegHead-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.projectRegHead-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#projectRegHeadToolbar'
    });
});

/**
 * 添加框
 * @param url
 */
function projectRegHeadAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 1000,
        height : 650,
        maximizable:true,
        href : '${path }/project/addPage',
        toolbar:[{
			text:'保存',
			iconCls:'icon-save',
			handler:function(){
				
	            var f = parent.$.modalDialog.handler.find('#projectRegHeadAddForm');
				var dg1 = parent.$.modalDialog.handler.find('#projectFinanceDataGrid');
				var dg2 = parent.$.modalDialog.handler.find('#projectRegCostDatagrid');
				var dt1 = dg1.datagrid("getRows");
				var dt2 = dg2.datagrid("getRows");

				
				var projectRegVo = {};
					
		
			    projectRegVo["projectRegHead"] = f.form('serialize');
			    projectRegVo["projectFinanceItems"] = dg1.datagrid("getRows");
			    projectRegVo["projectRegItems"] = dg2.datagrid("getRows");
			 //   saveEditData(projectRegVo);
				saveData(projectRegVo);
				parent.$.modalDialog.openner_dataGrid = projectRegHeadDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
			
			}
		},{
			text:'关闭',
			iconCls:'fi-x icon-red',
			handler:function(){
				
				parent.$.modalDialog.handler.dialog('close');
				
			}
		}]
    });
}


/**
 * 编辑
 */
function projectRegHeadEditFun(id) {
	console.log(id);
    if (id == undefined) {
        var rows = projectRegHeadDataGrid.datagrid('getSelections');
        id = rows[0].projectId;
    } else {
        projectRegHeadDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
  
    parent.$.modalDialog({
        title : '编辑',
        width : 1000,
        height : 650,
        href :  '${path }/project/editPage?id=' + id,
        maximizable:true,
        toolbar:[{
			text:'保存',
			iconCls:'icon-save',
			handler:function(){
				
				    var f = parent.$.modalDialog.handler.find('#projectRegHeadEditForm');
					var dg1 = parent.$.modalDialog.handler.find('#projectFinanceDataGrid');
					var dg2 = parent.$.modalDialog.handler.find('#projectRegCostDatagrid');
					var dt1 = dg1.datagrid("getRows");
					var dt2 = dg2.datagrid("getRows");

					
					var projectRegVo = {};
						
			
					projectRegVo["projectRegHead"] = f.form('serialize');
					projectRegVo["projectFinanceItems"] = dg1.datagrid("getRows");
					projectRegVo["projectRegItems"] = dg2.datagrid("getRows");
						
				//	saveData(projectRegVo);
					
					
				    console.log(JSON.stringify(projectRegVo));
				    console.log("=========================");
				   // saveData(JSON.stringify(editInfo));
				    saveEditData(projectRegVo);
					parent.$.modalDialog.openner_dataGrid = projectRegHeadDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					
				
			}
		},{
			text:'关闭',
			iconCls:'fi-x icon-red',
			handler:function(){
				
				parent.$.modalDialog.handler.dialog('close');
				
			}
		}]
    });
}


/**
 * 删除
 */
 function projectRegHeadDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = projectRegHeadDataGrid.datagrid('getSelections');
         id = rows[0].projectId;
     } else {//点击操作里面的删除图标会触发这个
         projectRegHeadDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前项目？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path }/project/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     projectRegHeadDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function projectRegHeadCleanFun() {
    $('#projectRegHeadSearchForm input').val('');
    projectRegHeadDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function projectRegHeadSearchFun() {
     projectRegHeadDataGrid.datagrid('load', $.serializeObject($('#projectRegHeadSearchForm')));
}
//{'projectName':$.serializeObject($('#projectRegHeadSearchForm'))

function saveData(dt){
			   
	$.ajax({
		   type : "POST",
		   contentType : "application/json",
		   url: "${path}/project/add",
		   data:JSON.stringify(dt),
		   dataType : 'json',
		   success: function(msg){
		  parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
          parent.$.modalDialog.handler.dialog('close');
		  $.messager.alert('添加成功！', msg.msg, 'info');   
			   
		   },
		   error:function(msg){
			  
			  $.messager.progress('close');
			  $.messager.alert('获取失败！', msg.msg, 'error');
		   }
	});
	
}

function saveEditData(dt){
	   
	$.ajax({
		   type : "POST",
		   contentType : "application/json",
		   url: "${path}/project/edit",
		   data:JSON.stringify(dt),
		   dataType : 'json',
		   success: function(msg){
			  parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
	          parent.$.modalDialog.handler.dialog('close');
			  $.messager.alert('编辑成功！', msg.msg, 'info');   
			   
		   },
		   error:function(msg){
			  
			  $.messager.progress('close');
			  $.messager.alert('获取失败！', msg.msg, 'error');
		   }
	});
	
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="projectRegHeadSearchForm">
            <table>
                <tr>
                    <th>名称:</th>
                    <td><input name="projectName" placeholder="项目名称"/></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="projectRegHeadSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="projectRegHeadCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false" >
        <table id="projectRegHeadDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="projectRegHeadToolbar" style="display: none;">
   <%--  <shiro:hasPermission name="/projectRegHead/add"> </shiro:hasPermission> --%>
        <a onclick="projectRegHeadAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    
</div>