$(document).ready(function() {
	$("#tag_field").unbind();

	var tags = [];

	$(window).load(function() {
		if ($('#tag_field').val !== '') {
			tags = $("#tag_field").val().split(/\s+/);
			console.log(tags);
			if (tags.length > 1 || tags[0] !== '') {
            	for (i = 0; i < tags.length; i++) {
            		$("#added_tags").append("<input class='tags btn btn-info' name='tags[]' id='tag' value="+tags[i]+" /> ");
            		$(".tags").autoresize({padding:50,minWidth:40,maxWidth:300});
            		$("#tag_field").val('');
            	}	
        	}
		}
	});

	$('#tag_field').on('input', function() {
    	var options = $('#tag_list')[0].options;
    	for (var i=0;i<options.length;i++) {
       		if (options[i].value == $(this).val()) {
       			var tag_value = $("#tag_field").val();
       			tag_value.trim();
        		$("#added_tags").append("<input class='tags btn btn-info' name='tags[]' id='tag' value="+tag_value+" /> ");
        		$(".tags").autoresize({padding:50,minWidth:40,maxWidth:300});
        		$("#tag_field").val('');
       		}
    	}
	});

	$(document).on('click', '.tags', function(e) {
		$(this).remove();
	});

	$(function() {
        $('#tag_field').keypress(function(e) {
            if(e.which == 13) {
            	e.preventDefault();
            	tags = $("#tag_field").val().split(/\s+/);
            	if (tags.length > 1 || tags[0] !== '') {
            		for (i = 0; i < tags.length; i++) {
            			$("#added_tags").append("<input class='tags btn btn-info' name='tags[]' id='tag' value="+tags[i]+" /> ");
            			$(".tags").autoresize({padding:50,minWidth:40,maxWidth:300});
            			$("#tag_field").val('');
            		}
            	}
            	return false;
            }
        });
    });
});