$(document).ready(function() {
	$("#reference_tags").unbind();
	$("#reference_tags").on('click', function() {
		var value = $("#reference_tags").val();
		var option_text = $("#reference_tags option[value='"+ value +"']").text();
		if ($("#tag_field").val() === '') {
			$("#tag_field").val(option_text);
		} else {
			$("#tag_field").val($("#tag_field").val() + " " + option_text);
		}	
	});
});