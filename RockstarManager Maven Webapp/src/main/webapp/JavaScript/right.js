/**
 * 
 */
function check(){
	
	if($("#name").attr("value")=="")
		return false;
	if($("#info").attr("value")=="")
		return false;
	return true;
}

function del(nav)
{
	$.ajax({
		url:"manage/delNav?unique="+nav,
		type : "POST",
	    async:false,
	    dataType : "JSON",
	    success : function(data) {
	    	var id="#"+nav;
	    	$(id).remove();
	    	sAlert("change success", "alert","")
	    },
	    error :function(data){
	    	sAlert("ajax do not work,change faile", "alert","")	    
	    }
	});
}