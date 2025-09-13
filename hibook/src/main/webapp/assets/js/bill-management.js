$(document).ready(function() {
	
	$(document).on("change", ".filter-status", function(){
		let txtStatus = $(this).val();
		
		window.location.href='/hibook/admin/bills?action=filter-status&status=' + txtStatus;
	});
});