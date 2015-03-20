$(document).ready(function(){
      var role=$('#role').val();
      console.log(role);
      
      if(role=="pm")
    	  {
    	 
    	  $('#rmg').on('click', function(e) {
    		 
  			var url = '/RmgAllocation/jsp/ProjectManager_EmployeeView.jsp';
  			console.log(url);
  			$(location).attr('href', url);
  			e.preventDefault();
    	  });
		
		}
      else if(role=="rmg")
    	  {
		$('#project').on('click', function(e) {
		
			var url = '/RmgAllocation/error/accessDenied.jsp';
			$(location).attr('href', url);
			console.log(url);
			e.preventDefault();

		});
    	  }
      else if(role=="employee")
	  {
	$('#project').on('click', function(e) {
	
		var url = '/RmgAllocation/error/accessDenied.jsp';
		$(location).attr('href', url);
		console.log(url);
		e.preventDefault();

	}),
	
	$('#rmg').on('click', function(e) {
		
		var url = '/RmgAllocation/error/accessDenied.jsp';
		$(location).attr('href', url);
		console.log(url);
		e.preventDefault();

	});
	  }
      
	

	});
	