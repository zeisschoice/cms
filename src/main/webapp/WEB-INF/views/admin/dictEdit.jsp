<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">

var dataGrid;


    $(function() {

    	 dataGrid = $('#dataGrid').datagrid({
             url : '${path }/dictType/dictData',
             fit : true,
             striped : true,
             rownumbers : true,
             pagination : true,
             singleSelect : true,
             idField : 'id',
             sortName : 'createTime',
             sortOrder : 'asc',
             pageSize : 20,
             pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
             columns : [ [ {
                 width : '80',
                 title : '编号',
                 field : 'dicttypeid',
                 sortable : true
             }, {
                 width : '80',
                 title : '名称',
                 field : 'dicttypename',
                 sortable : true
             },{
                 width : '80',
                 title : '编码',
                 field : 'dicttypecode',
             },{
                 width : '80',
                 title : '分类',
                 field : 'dictcat'
             },{
                 width : '80',
                 title : '序号',
                 field : 'seqno',
                 sortable : true
             },  
            
             {
                 width : '40',
                 title : '排序',
                 field : 'rank',
                 sortable : true
             } 
               ] ],
             onLoadSuccess:function(data){
               
             },
             toolbar : '#toolbar'
         });
    
    	
    	
    	
        $('#organizationId').combotree({
            url : '${path }/organization/tree',
            parentField : 'pid',
            lines : true,
            panelHeight : 'auto'
        });

        $('#roleIds').combotree({
            url: '${path }/role/tree',
            multiple: true,
            required: true,
            panelHeight : 'auto'
        });

        $('#userAddForm').form({
            url : '${path }/dictType/add',
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
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('提示', result.msg, 'warning');
                }
            }
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
      <!-- -->  <form id="dictAddForm" method="post">
            <table class="grid" style="width:100%;height:90px">
                <tr>
                    <td>字典ID</td>
                    <td><input name="dicttypeid" type="text" placeholder="请输入登录名称" class="easyui-validatebox" data-options="required:true" value=""></td>
                    <td>字典名称</td>
                    <td><input name="dicttypename" type="text" placeholder="请输入姓名" class="easyui-validatebox" data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>字典编码</td>
                    <td><input name="dicttypecode" type="password" placeholder="请输入密码" class="easyui-validatebox" data-options="required:true"></td>
                    <td>序号</td>
                    <td>
                        <input name="seqno" type="text" placeholder="请输入姓名" class="easyui-validatebox" data-options="required:true" value="">
                    </td>
                </tr>
                <tr>
                    <td>等级</td>
                    <td><input type="text" name="rank" class="easyui-numberbox"/></td>
                    <td></td>
                    <td>
                    </td>
                </tr>
            </table>
        </form>
       <br> 
     <div style="width:100%;height:400px">  
     <table id="dataGrid" data-options="fit:true,border:false"></table>
     </div>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="editUser()">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除</a>
    </div>
        
    </div>
</div>