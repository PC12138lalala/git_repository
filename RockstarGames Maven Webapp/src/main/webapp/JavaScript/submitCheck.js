function SignIncheck()
{
	var email=document.f1.email.value;
	var pwd1=document.f1.password1.value;
	var pwd2=document.f1.password2.value;
	var phone=document.f1.phone.value;
			
	reg=/^1[3578][0-9]{9}$/;
	if(!reg.test(phone))
	{
		sAlert("PHONE NUM ERROR","alert","");
		return false;
	}
	reg=/^[A-Za-z0-9@.]{1,20}$/;
	if(!reg.test(pwd1))
	{
		sAlert("PASSWORD ERROR","alert","");
		return false;
	}
	if(pwd1!=pwd2)
	{
		sAlert("PASSWORD ERROR","alert","");
		return false;
	}
	reg=/^[A-Za-z0-9@.]{1,30}$/;
	if(!reg.test(email))
	{
		sAlert("invalid E-main","alert","");
		return false;
	}
	reg=/^[A-Za-z][A-Za-z0-9]+@[A-Za-z0-9]+.com$/;
	if(!reg.test(email))
	{
		sAlert("invalid E-mail address","alert","");
		return false;
	}
	return true;
}
function SignInload()
{
	document.f1.username.focus();
}
function change(num)
{
	if(num==4)
	{
		document.getElementById("1").innerHTML="";
		tr=document.createElement("input");
		tr.setAttribute("type", "search");
		tr.setAttribute("placeholder", "8 ~ 20 word");
		tr.setAttribute("id", "7");
		tr.setAttribute("name", "username");
		document.getElementById("1").appendChild(tr);
		document.getElementById("submit").disabled=false;
		document.getElementById("reset").disabled=false;
		document.getElementById("7").focus();
	}
	else if(num==5)
	{
		document.getElementById("2").innerHTML="";
		tr=document.createElement("input");
		tr.setAttribute("type", "search");
		tr.setAttribute("placeholder", "11 word");
		tr.setAttribute("id", "8");
		tr.setAttribute("name", "phone");
		document.getElementById("2").appendChild(tr);
		document.getElementById("submit").disabled=false;
		document.getElementById("reset").disabled=false;
		document.getElementById("8").focus();
	}	
	else if(num==6)
	{
		document.getElementById("3").innerHTML="";
		tr=document.createElement("input");
		tr.setAttribute("type", "search");
		tr.setAttribute("placeholder", "less than 30 word");
		tr.setAttribute("id", "9");
		tr.setAttribute("name", "email");
		document.getElementById("3").appendChild(tr);
		document.getElementById("submit").disabled=false;
		document.getElementById("reset").disabled=false;
		document.getElementById("9").focus();
	}
	else
	{
		document.getElementById("10").innerHTML="";
		tr=document.createElement("input");
		tr.setAttribute("type", "password");
		tr.setAttribute("id", "12");
		tr.setAttribute("name", "password");
		document.getElementById("10").appendChild(tr);
		document.getElementById("submit").disabled=false;
		document.getElementById("reset").disabled=false;
		document.getElementById("12").focus();
	}
}