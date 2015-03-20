$(document).ready(function(){
	
	$("#add").on('submit',function(e){
		var message=null;
		var postData=$(this).serializeArray();
		var formUrl=$(this).attr("action");
		$.ajax({
			url    :formUrl,
			type   :"POST",
			data   :postData,
			success:function(data,textStatus,jXHR){
				message=data;
				console.log(message);
				if(data=="Employee is already present cannot be registered again"){
					$("#ajax").empty();
					$("#ajax").replaceWith(data);
					$('#loaction').val("--Select--");
					  $('#domain').val("--Select--");
					  $('#tech').val("--Select--");
					  $('#role').val("--Select--");
					  $('#date').val(" ");
					  $('#e_id').val("");
					  $('#emp_name').val("");
					  $('#password').val("");
					  $('#emailid').val("");
					  
				}
				else{
					console.log(data);
					$("#ajax").empty();
					$("#ajax").replaceWith(data);
					$('#loaction').val("--Select--");
					  $('#domain').val("--Select--");
					  $('#tech').val("--Select--");
					  $('#role').val("--Select--");
					  $('#date').val(" ");
					  $('#e_id').val("");
					  $('#emp_name').val("");
					  $('#password').val("");
					  $('#emailid').val("");
					
				}
				
				
			} ,
			error:function(data,textStatus,JXHR){
				console.log("error");
			}
			
			
		});
		
		e.preventDefault();
	});
	

});