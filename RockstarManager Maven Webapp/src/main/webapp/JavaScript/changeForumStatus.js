/**
 * 
 */
function changeStatus(id,type)
{	
	var aid="select[name='"+id;
	if(type=="ISLOCKED")
		aid+="l']";
	else if(type=="ISDELETE")
		aid+="d']";
	else
		aid+="t']";
	
	var status=$(aid).val();
	$.ajax({
		url:"changeForumStatus?id="+id+"&type="+type+"&status="+status,
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