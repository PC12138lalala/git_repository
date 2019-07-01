/**
 * 
 */


function change(num)
{
	if(num==1)
	{
		document.getElementById("hp").innerHTML="";
		tr=document.createElement("input");
		tr.setAttribute("type", "file");
		tr.setAttribute("name", "photo");
		tr.setAttribute("id", "photo");
		document.getElementById("hp").appendChild(tr);
		document.getElementById("submit").disabled=false;
	}
}