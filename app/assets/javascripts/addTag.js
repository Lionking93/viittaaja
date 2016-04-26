$(document).ready(function() {
	$("#reference_tags").unbind();
	$("#reference_tags").change(function() {
		var value = $("#reference_tags").val();
		var option_text = $("#reference_tags option[value='"+ value +"']").text();
		$("#tag_field").val($("#tag_field").val() + " " + option_text);
	});
});