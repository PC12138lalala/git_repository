/**
 * 
 */

function check(){
	var reg=/^(19|20)\d{2}-(0?[123456789]|1[012])-(0?[123456789]|1\d|2\d|3[01]) (0?\d|1\d|2[0123]):([012345]\d):([012345]\d)$/;
	if(!reg.test($("#releaseDate").attr("value")))
	{
		return false;
	}
	if($("#name").attr("value")=="")
		return false;
	return true;
}

function del(game)
{
	$.ajax({
		url:"manage/delGame?unique="+game,
		type : "POST",
	    async:false,
	    dataType : "JSON",
	    success : function(data) {
	    	var id="#"+game;
	    	$(id).remove();
	    	sAlert("change success", "alert","")
	    },
	    error :function(data){
	    	sAlert("ajax do not work,change faile", "alert","")
	    }
	});
}