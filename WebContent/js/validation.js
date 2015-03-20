
function validate()
{

var uname=document.getElementById("employeeid").value;

if(uname==000000 && uname!="")
	{
	document.getElementById("error").innerHTML="EmployeeId cant be all zeros";
	return false;
	}

}

function recover()
{
	document.getElementById("target").innerHTML="";
	document.getElementById("error").innerHTML="";
	
}