/**
 * 
 */
function upd(str)
{
	var obj=document.getElementsByName("'"+str+"'");
	var s="";
	for(var i=0;i<obj.length;i++)
		if(obj[i].checked)
			s+=obj[i].value + ",";
	$.ajax({
		url:"changePermission?roleid="+str+"&data="+s,
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