/**
 * Created by antti on 27.4.2016.
 */
$( window ).load(function(){

    var options = {
        valueNames: [ 'citation_key', 'reference_type', 'year', 'publisher', 'journal', 'author', 'editor', 'title', 'booktitle', 'address', 'pages', 'volume', 'edition', 'organization', 'key', 'month', 'series', 'note', 'tag' ]
    };

    var referenceList = new List('references', options);

});
$( window ).load(function(){
    $('#search').on('input', function(){
        if(!$('#search').val() || $('#search').val() == "Search"){
            $('#showOptional').show();
        }else {
            $('#showOptional').hide();
            $('.optional').show();
        }
    });
});
