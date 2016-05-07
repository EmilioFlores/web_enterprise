$(function(){
    if ($('#promotoria-fields').is(':checked')){
        $('.promotoria-fields').show();
    }
    if ($('#company-fields').is(':checked')){
        $('.company-fields').show();
    }
	$('#promotoria-fields').change(function(event) {
		checkbox = event.target
		item = $(checkbox).closest('.item')
    if($(checkbox).is(":checked")) {
    	$('.promotoria-fields', item).show();
    } else {
    	$('.promotoria-fields', item).hide();
    	$('input', $('.promotoria-fields', item)).val('');
    }
	});
    $('#company-fields').change(function(event) {
        checkbox = event.target
        item = $(checkbox).closest('.item')
    if($(checkbox).is(":checked")) {
        $('.company-fields', item).show();
    } else {
        $('.company-fields', item).hide();
        $('input', $('.company-fields', item)).val('');
    }
    });

})