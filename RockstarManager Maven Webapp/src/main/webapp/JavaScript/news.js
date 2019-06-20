/**
 * 
 */
function check(){
	var reg=/^(19|20)\d{2}-(0?[123456789]|1[012])-(0?[123456789]|1\d|2\d|3[01]) (0?\d|1\d|2[0123]):([012345]\d):([012345]\d)$/;
	if(!reg.test($("#create_date").attr("value")))
	{
		alert("create_date error!");
		return false;
	}
	if($("#title_1").attr("value")==""){
		alert("input title-1!");
		return false;
	}	
	if($("#rank").attr("value")==""){
		alert("select rank!");
		return false;
	}
	if($("#content").attr("value")==""){
		alert("input content!");
		return false;
	}
	return true;
};
function del(id)
{
	$.ajax({
		url:"manage/delNews?unique="+id,
		type : "POST",
	    async:false,
	    dataType : "JSON",
	    success : function(data) {
	    	var i="#"+id;
	    	$(i).remove();
	    	sAlert("change success", "alert","")
	    },
	    error :function(data){
	    	sAlert("ajax do not work,change faile", "alert","")
	    }
	});
};
function addTag(tag){
	$("#content").attr("value",$("#content").val()+"<"+tag+">");
};
function addSymbol(symbol){
	if(symbol=="<")
		$("#content").attr("value",$("#content").val()+"&lt;");
	else if (symbol==">")
		$("#content").attr("value",$("#content").val()+"&gt;");
	else if (symbol=="&")
		$("#content").attr("value",$("#content").val()+"&amp;");
	else if (symbol=="'")
		$("#content").attr("value",$("#content").val()+"&apos;");
	else
		$("#content").attr("value",$("#content").val()+"&quot;");
};
function addList(){
	$("#content").attr("value",$("#content").val()+"<ul><li></li><li></li></ul>");
};