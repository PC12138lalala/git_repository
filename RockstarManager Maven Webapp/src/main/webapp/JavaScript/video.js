/**
 * 
 */
function check(){
	
	if($("#video_name").attr("value")=="")
		return false;
	return true;
}

function del(video)
{
	$.ajax({
		url:"manage/delVideo?unique="+video,
		type : "POST",
	    async:false,
	    dataType : "JSON",
	    success : function(data) {
	    	var id="#"+video;
	    	$(id).remove();
	    	sAlert("change success", "alert","")
	    },
	    error :function(data){
	    	sAlert("ajax do not work,change faile", "alert","")
	    }
	});
}