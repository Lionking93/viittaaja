/**
 * Created by antti on 17.4.2016.
 */

$( window ).load(function(){
    $.fn.hidefields = function() {
        $(".reference_author").hide();
        $(".reference_editor").hide();
        $(".reference_title").hide();
        $(".reference_booktitle").hide();
        $(".reference_publisher").hide();
        $(".reference_year").hide();
        $(".reference_volume").hide();
        $(".reference_series").hide();
        $(".reference_address").hide();
        $(".reference_edition").hide();
        $(".reference_month").hide();
        $(".reference_note").hide();
        $(".reference_key").hide();
        $(".reference_pages").hide();
        $(".reference_organization").hide();
        $(".reference_journal").hide();
        $(".reference_number").hide();
    };
    $.fn.showBook = function() {
        $(".reference_author").show();
        $(".reference_editor").show();
        $(".reference_title").show();
        $(".reference_publisher").show();
        $(".reference_year").show();
        $(".reference_volume").show();
        $(".reference_series").show();
        $(".reference_address").show();
        $(".reference_edition").show();
        $(".reference_month").show();
        $(".reference_note").show();
        $(".reference_key").show();
    };
    $.fn.showInproceeding = function() {
        $(".reference_author").show();
        $(".reference_editor").show();
        $(".reference_title").show();
        $(".reference_booktitle").show();
        $(".reference_publisher").show();
        $(".reference_pages").show();
        $(".reference_series").show();
        $(".reference_volume").show();
        $(".reference_organization").show();
        $(".reference_year").show();
        $(".reference_address").show();
        $(".reference_month").show();
        $(".reference_note").show();
        $(".reference_key").show();
    };
    $.fn.showArticle = function() {
        $(".reference_author").show();
        $(".reference_title").show();
        $(".reference_journal").show();
        $(".reference_pages").show();
        $(".reference_volume").show();
        $(".reference_number").show();
        $(".reference_year").show();
        $(".reference_month").show();
        $(".reference_note").show();
        $(".reference_key").show();
    };
    $( document).hidefields();
    $( document).showBook();

    $( "#reference_reference_type" ).on("change", function() {

        if($("#reference_reference_type").val() == "book"){
            $( document ).hidefields();
            $( document ).showBook();
        };
        if($("#reference_reference_type").val() == "inproceeding"){
            $( document).hidefields();
            $( document).showInproceeding();
        };
        if($("#reference_reference_type").val() == "article"){
            $( document).hidefields();
            $( document).showArticle();
        };
    });
});