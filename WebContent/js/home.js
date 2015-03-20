$(document).ready(function() {

	
	
	$("#loginform").on('submit', function(e) {
		
		var message=null;
		var postData = $(this).serializeArray();
		var formURL = $(this).attr("action");
		 
			$.ajax({
				url : formURL,
				type : "POST",
				data : postData,
				datatype : 'text',
				success : function(data,textStatus,jXHR) {
					message = data;
					console.log(data);
					if(data=="success"){
						
						document.location.href="jsp/Homenew.jsp";
					}else{
					var s = $("#target");
					       s.empty();
					   
						s.replaceWith(data);
					
					}
						
				},
				error : function(data,textStatus,jXHR){
					alert("ajax error");
				}

			});
		
	/*	get_data(function(data) {
			console.log(data);
			var s = $("#target");
			s.html('');
			
			if(data.status=='fail'){
				console.log(data.status);
				e.preventDefault();
				s.html(data.message);
			}

		});*/
		
			e.preventDefault();
			
});
});