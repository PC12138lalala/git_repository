/**
 * 
 */
function changeStatus(userid,type)
{	
	var id="select[name='"+userid;
	if(type=="ISLOCKED")
		id+="l']";
	else if(type=="ISDELETE")
		id+="d']";
	else
		id+="i']";
	
	var status=$(id).val();
	$.ajax({
		url:"changeStatus?userid="+userid+"&type="+type+"&status="+status,
		type : "POST",
	    async:false,
	    dataType : "JSON",
	    success : function(data) {
	    	sAlert("change success", "alert","")
	    },
	    error :function(data){
	    	sAlert("ajax do not work,change faile", "alert","")
	    }
	});
}