/**
 * Created by antti on 27.4.2016.
 */
$( window ).load(function(){

    var fuzzyOptions = {
        searchClass: "fuzzy-search",
        location: 10,
        distance: 1000,
        treshold: 0.8,
        multisearch: false
    };

    var options = {
        valueNames: [ 'reference_type', 'citation_key', 'reference_type', 'year', 'publisher', 'journal', 'author', 'editor', 'title', 'booktitle', 'address', 'pages', 'volume', 'edition', 'organization', 'key', 'month', 'series', 'note', 'tag' ]
    //    plugins: [ ListFuzzySearch() ]
    };

    var optionsfuzzy = {
        valueNames: [ 'reference_type', 'citation_key', 'reference_type', 'year', 'publisher', 'journal', 'author', 'editor', 'title', 'booktitle', 'address', 'pages', 'volume', 'edition', 'organization', 'key', 'month', 'series', 'note', 'tag' ],
            plugins: [ ListFuzzySearch() ]
    };

    var referenceList = new List('references', options);
    var referenceListfuzzy = new List('references', optionsfuzzy);

    $('#search').on('input', function(){
        if(!$('#search').val() || $('#search').val() == "Search"){
            $('#showOptional').show();
        }else {
            $('#showOptional').hide();
            $('.optional').show();
        }
        if($('#search').val().indexOf(' ') > 0){
            $("#search").css({display: "none"});
            $('#fuzzy-search').css({display: "inline"});
            $('#fuzzy-search').val($('#search').val());
            $('#fuzzy-search').focus();
        }
    });
    $('#fuzzy-search').on('input', function(){
       if($('#fuzzy-search').val().indexOf(' ') <= 0){
           $('#fuzzy-search').css({display: "none"});
           $('#search').css({display: "inline"});
           $('#search').val($('#fuzzy-search').val());
           $('#search').focus();
       }
    });

});
$( document ).ready(function(){
    $('#fuzzy-search').css({display: "none"});
});