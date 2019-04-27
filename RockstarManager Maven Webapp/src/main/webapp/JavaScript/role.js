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

function del(role)
{
	$.ajax({
		url:"manager/delRole?unique="+role,
		type : "POST",
	    async:false,
	    dataType : "JSON",
	    success : function(data) {
	    	var id="#"+role;
	    	$(id).remove();
	    	sAlert("change success", "alert","")
	    },
	    error :function(data){
	    	sAlert("ajax do not work,change faile", "alert","")	    
	    }
	});
}