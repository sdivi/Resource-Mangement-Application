$(document).ready(
		function() {
			$(".table-hover").css({'cursor': 'pointer','text-align':'center'});
			var table = $('#table_id').DataTable();
			var t1 = $(".table-hover");
			var t2 = $("#datatable");
			var t3 = $("#ajaxResponse");
			t3.hide();
			t2.hide();

			$('.one,.two,.three,.four,.five').on('click',function(e){
				console.log($(this).text());
				if($(this).text()=="0"){
					console.log($(this).text());
					alert("Requirement fullfilled already");
				}
				else{

					t1.hide();
					t2.fadeIn("slow");

				}


			});


			// filtering values from the table
			$('.one').on(
					'click',
					function() {

						var sup = $(this).data('one');
						console.log(sup);
						table.column(6).search( sup ).draw();
						$("#hidden_pid").val($(this).parent().children().eq(0).text());
						$("#hidden_role_id").val(sup);
						console.log($('#hidden_pid').val());


					});
			$('.two').on(
					'click',
					function() {

						var sup = $(this).data('two');
						table.column(6).search(sup).draw();
						$("#hidden_pid").val($(this).parent().children().eq(0).text());
						$("#hidden_role_id").val(sup);
						console.log($('#hidden_pid').val());

					});
			$('.three').on(
					'click',
					function() {

						var sup = $(this).data('three');
						table.column(6).search(sup).draw();
						$("#hidden_pid").val($(this).parent().children().eq(0).text());
						$("#hidden_role_id").val(sup);
						console.log($('#hidden_pid').val());

					});
			$('.four').on(
					'click',
					function() {

						var sup = $(this).data('four');
						table.column(6).search(sup).draw();
						$("#hidden_pid").val($(this).parent().children().eq(0).text());
						$("#hidden_role_id").val(sup);
						console.log($('#hidden_pid').val());
					});
			$('.five').on(
					'click',
					function() {

						var sup = $(this).data('five');
						table.column(6).search(sup).draw();
						$("#hidden_pid").val($(this).parent().children().eq(0).text());
						$("#hidden_role_id").val(sup);
						console.log($('#hidden_pid').val());

					});

			// callback handler for form submit
			$("#ajaxform").submit(function(e)
					{
				console.log("ajax");
				t2.hide();
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
								console.log("response");
								var s = $("#ajaxResponse").find('tbody');
								$.each(data, function(key, value){
									console.log(key + value);
									s.append("<tr><td>"+key +"</td><td>"+value+"</td></tr>");
									

								});
								
								$("#ajaxResponse").fadeIn("slow");
							},
							error: function(jqXHR, textStatus, errorThrown) 
							{
								// if fails
							}
						});
								e.preventDefault(); // STOP default action
								
						
					});


				$('#redirect').on('click', function() {
					var url = '/RmgAllocation/jsp/Allocate_projects.jsp';
					$(location).attr('href', url);
				});

		});