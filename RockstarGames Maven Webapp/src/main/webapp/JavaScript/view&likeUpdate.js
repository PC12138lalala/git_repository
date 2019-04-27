/**
 * 
 */
function UpdateVideoViewTime(str)
{
	$.ajax({
		url:"UpdateViewLike?type=video&name="+str,
		type : "POST",
	    async:true,
	    dataType : "JSON",
	    success : function(data) {
	    	var data1=eval(data);
	    	document.getElementById("viewtime").innerHTML="<img src='CSS/image/play_time.png'>&nbsp;&nbsp;<span >"+data1.view_time+" views</span>";	
	    },
	    error :function(data){
	    	sAlert("ajax do not work","alert","");
	    }
	});
	
}

function UpdateCommentLike(str)
{
	$.ajax({
		url:"UpdateCommentLike?seq="+str,
		type : "POST",
	    async:false,
	    dataType : "JSON",
	    success : function(data) {
	    	var data1=eval(data);
	    	str=('0000000'+str).slice(-8);
	    	document.getElementById(str).innerHTML=data1.likes+" likes";
	    	document.getElementById(str).attributes.removeNamedItem("onclick");
	    },
	    error :function(data){
	    	sAlert("ajax do not work","alert","");
	    }
	});
	
}

function UpdateForumCommentLike(str)
{
	$.ajax({
		url:"UpdateForumCommentLike?seq="+str,
		type : "POST",
	    async:false,
	    dataType : "JSON",
	    success : function(data) {
	    	var data1=eval('('+data+')');
	    	str=('0000000'+str).slice(-8);
	    	document.getElementById(str).innerHTML=data1.likes+" likes";
	    	document.getElementById(str).attributes.removeNamedItem("onclick");
	    },
	    error :function(data){
	    	sAlert("ajax do not work","alert","");
	    }
	});
}

function check(num)
{
	if(num==null)
	{
		
		if(sConfirm("no user sign in,log in?","confirm",function(){
			window.location.href="LogIn";
			return true;
		}))
		{
			return false;
		}
		else
		{
			return false;
		}
	}
	else if($("#newcontent").attr("value")=="")
	{
		sAlert("pls enter content","alert","");
		return false;
	}
	else
	{
		return true;
	}
}

