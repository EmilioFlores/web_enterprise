$(function(){
    if ($('#promotoria-fields').is(':checked')){
        $('.promotoria-fields').show();
    }
    if ($('#company-fields').is(':checked')){
        $('.company-fields').show();
    }
	$('#promotoria-fields').change(function(event) {
        debugger
		checkbox = event.target
    if($(checkbox).is(":checked")) {
    	$('.promotoria-fields').show();
    } else {
    	$('.promotoria-fields').hide();
    	$('input', $('.promotoria-fields')).val('');
    }
	});
    $('#company-fields').change(function(event) {
        checkbox = event.target
    if($(checkbox).is(":checked")) {
        $('.company-fields').show();
    } else {
        $('.company-fields').hide();
        $('input', $('.company-fields')).val('');
    }
    });

})