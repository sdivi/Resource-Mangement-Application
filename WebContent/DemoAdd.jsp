<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Demo Add</title>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script>

$(document).ready(function(){
	
	var maxFields=10;
	var x=1;
	  $('#toto').click(function(){
		  console.log("Clicked");
		  if(0<x && x<=maxFields){
			  $('.one').append('<div id="'+x+'" ><br><select name="role'+x+'" id="role'+x+'"><option value="">--Select--</option><option value="Role1">Role1</option><option value="Role2">Role2</option><option value="Role3">Role3</option><option value="Role4">Role4</option><option value="Role5">Role5</option><option value="Role6">Role6</option><option value="Role7">Role7</option><option value="Role8">Role8</option><option value="Role9">Role9</option><option value="Role10">Role10</option></select><input type="number" name="rolecount'+x+'" id="rolecount'+x+'" placeholder="Number of Associates" value="0"/><input type="button" id="save'+x+'" value="Save"/><input type="button" class="btn btn-small btn-default" id="remove'+x+'" value="Delete"/></div>');
		     $('#toto').attr("disabled","disabled");// Disable Add member until Save or Remove Clicked
		       console.log("div id" +$("#"+x+"").attr('id'));
               var y=x;
                var z=[];
             // var z[0]=$("#"+1+" option:selected").val();
		      //to delete the option from dropdown
		           if(x>1 && y>0){
                       for(var a=0;a<x;a++){
                            
                               var p=$("#"+ --y +" option:selected").val();
                               z.push(p);
                               // var z[x-1]=$("#"+ --y +" option:selected").val();
							   console.log(p);
                               console.log("y"+y);
	 			               $("#"+ x +" select option[value="+z[a]+"]").hide();
                           
                         }
                    
		          }
              x++;
              var val = x;
				if (x <= 11) {
					$("#x_value").val(--val);

					console.log("hai "+ $("#x_value").val());
				}

          }
         
          var c= x-1;
           console.log(c);
          console.log("save of div added  "+$("#"+c ).attr('id'));
          console.log("X increased after adding div"+x);
          $("#"+c).on("change","#role"+c ,function(){
        	  if($("#role"+c+" option:selected").val()!=""){
              $('.one').on("click", "#save"+c,function(){
                  
                  $(this).attr("disabled","disabled");
			      $('#toto').removeAttr("disabled");    
                  $("#"+c).find("#remove"+c).attr("disabled","disabled");//remove of previous                   
				  //$("#"+c).find("#role"+c).attr("disabled","disabled");
                  //$("#"+c).find("#rolecount"+c).attr("disabled","disabled");
             
	          });
        	  }
          });
         
         $('#'+c).on("click", "#remove"+c,function(){
			  $('#toto').removeAttr("disabled");
			  var y=$("#role"+c+" option:selected").val();
			  console.log(y+"in remove");
			  $("#"+ c +" select option[value="+y+"]").show();	
	    	  $(this).parent('div').remove();
	    	  x--;
	    	  console.log("x= "+x);
	    	  
	    	  var val = x;
				if (x <= 11) {
					$("#x_value").val(--val);

					console.log("hai "+ $("#x_value").val());
				}

	    	  
	      });
         
         console.log("final" + x);
	
   });	
	
	
	
	
	
	
	
});
</script>

</head>
<body>
	<form action="/RmgAllocation/DemoAdd" method="post">
		<button id="toto" value=" Add Member "
			class="btn btn-small btn-info addButton">
			<b class='glyphicon glyphicon-plus'></b> Add Member
		</button>
		<div class="one"></div>
	
		<br />
		<br /> <input type="text" name="x_value" id="x_value" value="0" /> <input
			type="submit" name="Submit" />

	</form>
</body>
</html>