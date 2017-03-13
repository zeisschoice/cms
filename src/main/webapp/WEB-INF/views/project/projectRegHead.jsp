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
        columns:  [[ {
            width : '60',
            title : '编号',
            field : 'projectId',
            sortable : true
        },{
            width : '60',
            title : '项目名称',
            field : 'projectName',
            sortable : true
        },{
            width : '60',
            title : '项目类型',
            field : 'projectType',
            sortable : true
        },{
            width : '60',
            title : '建设架构',
            field : 'buildOrg',
            sortable : true
        },{
            width : '60',
            title : '联系人',
            field : 'contactPerson',
            sortable : true
        },{
            width : '60',
            title : '联系地址',
            field : 'contactsAddress',
            sortable : true
        },{
            width : '60',
            title : '联系电话',
            field : 'contactCall',
            sortable : true
        },{
            width : '60',
            title : '手机',
            field : 'contactTel',
            sortable : true
        },{
            width : '60',
            title : '传真',
            field : 'contactFax',
            sortable : true
        },{
            width : '60',
            title : '详细内容',
            field : 'workDetail',
            sortable : true
        },{
            width : '60',
            title : '业务类型',
            field : 'businessType',
            sortable : true
        },{
            width : '60',
            title : '审批部门',
            field : 'aproveDepartment',
            sortable : true
        },{
            width : '60',
            title : '是否xx',
            field : 'isContract',
            sortable : true,
            formatter : function(value, row, index) {
                switch (value) {
                case 0:
                    return '正常';
                case 1:
                    return '停用';
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
            title : '项目率',
            field : 'projectPunishRate',
            sortable : true
        },{
            width : '60',
            title : 'xx原因',
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
            title : '记录室',
            field : 'recordRoom',
            sortable : true
        },{
            width : '60',
            title : '分支xx',
            field : 'brancheDean',
            sortable : true
        },{
            width : '60',
            title : '填单人',
            field : 'fillPerson',
            sortable : true
        },{
            width : '60',
            title : '项目组领导',
            field : 'projectGroupLeader',
            sortable : true
        },{
            width : '60',
            title : '部门领导',
            field : 'departmentCharger',
            sortable : true
        },{
            width : '60',
            title : '项目组领导',
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
        width : 700,
        height : 600,
        href : '${path }/project/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = projectRegHeadDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#projectRegHeadAddForm');
                f.submit();
            }
        } ]
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
        width : 700,
        height : 600,
        href :  '${path }/project/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = projectRegHeadDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#projectRegHeadEditForm');
                f.submit();
            }
        } ]
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
     parent.$.messager.confirm('询问', '您是否要删除当前角色？', function(b) {
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
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="projectRegHeadSearchForm">
            <table>
                <tr>
                    <th>名称:</th>
                    <td><input name="name" placeholder="搜索条件"/></td>
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