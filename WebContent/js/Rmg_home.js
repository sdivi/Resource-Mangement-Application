

$(document).ready(function() {
	
	
	
	/*	Main Page Routing */
	$('#employee').on('click', function() {
		var url = '/RmgAllocation/jsp/Employee_list.jsp';
		$(location).attr('href', url);
//		$('#populate').load("/RmgAllocation/jsp/Employee_list.jsp #onload");
	});
	$('#project').on('click', function() {
		var url = '/RmgAllocation/jsp/View_projects.jsp';
		$(location).attr('href', url);
//		$('#populate').load("/RmgAllocation/jsp/View_projects.jsp #onload");
	});
	$("#allocate").click(function() {
		var url = '/RmgAllocation/jsp/Allocate_projects.jsp';
		$(location).attr('href', url);
		});
	/* Footer.js */
	
	
	   

});