var pageName;
$(function(){
	var setting = {
		async: {
			enable: true,
			url:"/itemCat/showZtree",
			autoParam: ["id"]	
		},
		callback: {
			onClick: zTreeOnClick
		}
	};
	$.fn.zTree.init($("#treeDemo"), setting);
})
function child(obj){
	if(obj=='showItem.jsp'){
		pageName = 1;
	}else if(obj="addItem.jsp"){
		pageName = 2;
	}
}
function zTreeOnClick(event, treeId, treeNode) {
	if(pageName==1){
		parent.$("#selectCid").val(treeNode.name);
		parent.$("#cId").val(treeNode.id);
	}else if(pageName ==2){
		parent.$("#addItemSpan").text(treeNode.name);
		parent.$("#addItemId").val(treeNode.id);
		
		
	}
};