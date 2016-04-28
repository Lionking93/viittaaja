/**
 * Created by antti on 27.4.2016.
 */
$( window ).load(function(){

    var fuzzyOptions = {
        searchClass: "fuzzy-search",
        location: 0,
        distance: 0,
        treshold: 0.0,
            multisearch: false
    };

    var options = {
        valueNames: [ 'reference_type', 'citation_key', 'reference_type', 'year', 'publisher', 'journal', 'author', 'editor', 'title', 'booktitle', 'address', 'pages', 'volume', 'edition', 'organization', 'key', 'month', 'series', 'note', 'tag' ],
        plugins: [ ListFuzzySearch() ]
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
