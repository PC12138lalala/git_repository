/**
 * 
 */
function LogIn(account,password)
{
	if( account!= null && account!="" && password!=null && password!="")
	{
		$.ajax({
			url:"http://www.rockstargames.com.cn/UserLogIn?account="+account+"&pwd="+password,
			type : "POST",
		    async:false,
		    dataType : "JSONP",
		    xhrFields: {
                withCredentials: true
	        },
	        crossDomain: true,
		    success : function(data) {
		    },
		    error :function(data){
		    	alert("ajax	1 do not work");
		    }
		});
		
		$.ajax({
			url:"http://www.rockstargames.com.cn:8081/UserLogIn?account="+account+"&pwd="+password,
			type : "GET",
		    async:false,
		    dataType : "JSONP",
		    xhrFields: {
                withCredentials: true
	        },
	        crossDomain: true,
		    success : function(data) {
		    	
		    },
		    error :function(data){
		    	alert("ajax 2 do not work");
		    }
		});
	}
}
