<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#projectFinanceItemEditForm').form({
            url : '${path}/projectFinanceItem/edit',
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
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
        
        $("#editStatus").val('${projectFinanceItem.status}'); 
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="projectFinanceItemEditForm" method="post">
            <table class="grid">
                <tr>
                    <td>商家名称</td>
                    <td><input name="id" type="hidden"  value="${projectFinanceItem.id}">
                    <input name="name" type="text" placeholder="请输入名称" class="easyui-validatebox" data-options="required:true" value="${projectFinanceItem.name}"></td>
                </tr>
                <tr>
                    <td>状态</td>
                    <td >
                        <select id="editStatus" name="status" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0">正常</option>
                            <option value="1">停用</option>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>