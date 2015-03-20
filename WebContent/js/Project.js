$(document).ready(function(){
	
	$("#myform").on('submit',function(e){
		//alert("in ajax");
		var message = null;
		var postData=$(this).serializeArray();
		var formURL=$(this).attr("action");
		$.ajax({
			url      : formURL,
			type     :"POST",
			data     : postData,
			datatype : 'text',
			success  :function(data,textStatus,jXHR){
				message=data;
	             //alert(message);
				console.log(message);
				if(message=="success"){
					
					$("#success").empty();
					$("#success").replaceWith("Succesfully Registered");
					
					 $('.one').empty();
					  $('#dropbox2').val("--Select--");
					  $('#dropbox1').val("--Select--");
					  $('#tech').val("--Select--");
					  $('#dropbox3').val("--Select--");
					  $('#p_name').val("");
					
				
					
				}
			},
		    error :function(data,textstatus,jXHR){
		    	
		    alert("error");	
		    }
			
		});
		e.preventDefault();
	});
	
});