<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<%-- <%@ include file="/commons/basejs.jsp" %> --%>
<!DOCTYPE html>
<html>

<body>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
         <form id="dictAddForm" method="post">
            <table class="grid" style="width:100%;height:90px">
                <tr>
                    <td>字典ID</td>
                    <td><input name="dicttypeid" id="dicttypeid" type="text" placeholder="请输入字典ID" class="easyui-validatebox" data-options="required:true" value=""></td>
                    <td>字典名称</td>
                    <td><input name="dicttypename" id="dicttypename" type="text" placeholder="请输入字典名称" class="easyui-validatebox" data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>字典编码</td>
                    <td><input name="dicttypecode" id="dicttypecode" type="text" placeholder="请输入字典编码" class="easyui-validatebox" data-options="required:true" value=""></td>
                    <td>序号</td>
                    <td>
                        <input name="seqno" id="seqno" type="text" placeholder="请输入姓名" class="easyui-validatebox" data-options="required:true" value="">
                    </td>
                </tr>
                <tr>
                    <td>等级</td>
                    <td><input type="text" name="rank" id="rank" class="easyui-numberbox" value=""/></td>
                    <td></td>
                    <td>
                    </td>
                </tr>
            </table>
        </form>
       <br> 
     
       <!--  <table id="dataGrid" data-options="fit:true,border:false"></table> -->
        <table id="dataGrid" class="easyui-datagrid" title="" style="width:100%;height:auto"  
        data-options="
                
                singleSelect: true,
                toolbar: '#toolbar'"
                >
        <thead>
            <tr>
                <th data-options="field:'dicttypeid',width:80,editor:'text'">编号</th>
                <th data-options="field:'dictname',width:80,editor:'text'">名称</th>
                <th data-options="field:'dictcode',width:80,editor:'text'">编码</th>
                <th data-options="field:'value',width:80,align:'right',editor:'numberbox'">值</th>
                <th data-options="field:'seqno',width:80,editor:'text'">序号</th>
                <th data-options="field:'rank',width:80,editor:'text'">排序</th>
            </tr>
           
        </thead>
    </table>
     
     
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="append()">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delDictEntry()">删除</a>
    </div>
      <a href="javascript:void(0)" id="submitButtom" class="easyui-linkbutton" onclick="save()" style="display:none">保存</a>
    </div>
</div>


<script type="text/javascript">

var dataGrid;


    $(function() {

   /*  	 dataGrid = $('#dataGrid').datagrid({
             url : '',
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
                 field : 'dictname'
                
             },{
                 width : '80',
                 title : '编码',
                 field : 'dictcode',
             },{
                 width : '80',
                 title : '值',
                 field : 'value'
             },{
                 width : '80',
                 title : '序号',
                 field : 'seqno'
                 
             },  
            
             {
                 width : '40',
                 title : '排序',
                 field : 'rank'
                 
             } 
               ] ],
             onLoadSuccess:function(data){
               
             } ,
           
             toolbar : '#toolbar'
         }); */
    
        $('#userAddForm').form({
            url : '',
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

    var editIndex = undefined;
    function endEditing(){
        if (editIndex == undefined){return true}
        if ($('#dataGrid').datagrid('validateRow', editIndex)){
            $('#dataGrid').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }   
    
    
    function append(){
        if (endEditing()){
            $('#dataGrid').datagrid('appendRow',{});
            editIndex = $('#dataGrid').datagrid('getRows').length-1;
            $('#dataGrid').datagrid('selectRow', editIndex)
                    .datagrid('beginEdit', editIndex);
        }
    }   
    
    
 function newDictEntry(){
	 
	/*  $('#dataGrid').datagrid('insertRow',{
			index: 1,	// index start with 0
			row: {
				
			}
		});  */
		
	 var row = $('#dataGrid').datagrid('getSelected');
		if (row){
			var index = $('#dataGrid').datagrid('getRowIndex', row);
		} else {
			index = 0;
		}
		$('#dataGrid').datagrid('insertRow', {
			index: index,
			row:{
				
			}
		});
		$('#dataGrid').datagrid('selectRow',index);
		$('#dataGrid').datagrid('beginEdit',index);	
		
	
 }  
    
function delDictEntry(){
	 var editIndex = undefined;	
	/*  $('#dataGrid').datagrid('deleteRow',{
			index: 1,	// index start with 0
			row: {
				
			}
		});  */
	
	var selectRow = $('#dataGrid').datagrid("getSelections");
    if (selectRow.length == 0) {
           alert("当前未选中记录");
           return;
    }	
	
   
		
     editIndex =  $('#dataGrid').datagrid("getRowIndex", selectRow[0]);
    
	 if (editIndex == undefined){return}
     $('#dataGrid').datagrid('deleteRow', editIndex);
     editIndex = undefined;
}  
  
function save(){
		
	var submitData = {};
	
    var rows = $('#dataGrid').datagrid('getChanges');
    
    submitData.dicttypeid = $('#dicttypeid').val();
    submitData.dicttypename = $('#dicttypename').val();
    submitData.dicttypecode = $('#dicttypecode').val();
    submitData.seqno = $('#seqno').val();
    submitData.rank = $('#rank').val();
    submitData.dictEntry = rows;
    progressLoad();
	$.ajax({
		   type: "POST",
		   url: "${path }/dictType/add",
		   data:submitData,
		   async: false,
		   success: function(result){
	

			   if(result){
				  
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

			   
			   
		   },
		   error:function(){
			  progressClose();
			  $.messager.progress('close');
			  $.messager.alert('发送失败！', result.msg, 'error');
		   }
	});
    
} 


</script>

</body>
</html>
