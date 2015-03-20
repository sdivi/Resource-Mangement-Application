$(document).ready(function() {
		
		
		//var table = $('#table_id').DataTable();
		
		var left = $("#left");
		var target = $("#target");
		var res =$("#ajaxResponse");
		target.hide();
		res.hide();
		var table = $('#table_id').DataTable();
		
		
		$('#left').find('.btn-primary').click(function(e) {
//			right.hide()
//			left.hide();
			target.slideToggle('slow');
		});
		$("#table_id_filter").find('input').attr('placeholder',"Project search");
		$("#table_id_length").hide();
		$("#ajaxform").on('submit',function(e){
				
				var postData = $(this).serializeArray();
				var formURL = $(this).attr("action");
				$.ajax(
						{
							url : formURL,
							type: "POST",
							data : postData,
							datatype : 'json',
							success:function(data, textStatus, jqXHR) 
							{
								
								var s = res.find('tbody');
								$.each(data, function(key, value){
									
									s.append("<tr><td>"+key +"</td><td>"+value+"</td></tr>");
									

								});
								
								target.hide();
								res.fadeIn('slow');
							},
							error: function(jqXHR, textStatus, errorThrown) 
							{
								// if fails
							}
						});
								e.preventDefault(); // STOP default action
								e.unbind(); // unbind. to stop multiple form
				
			});
		$('#redirect').on('click', function() {
			var url = '/RmgAllocation/jsp/Viewemployee_new.jsp';
			$(location).attr('href', url);
		});
		var check = $("#hide_checks").val();
		if(check=="Allocated"){
			$("#allocated").hide();
		}else if(check=="Available")
	       {
			$('.btn-primary').attr("disabled","disabled");
			//alert("No Projects Allocated for you");
	    }	
		
		
	});