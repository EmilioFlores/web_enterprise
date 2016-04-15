$(function(){
	$('body').change('#promotoria-fields',function(event) {
		checkbox = event.target
		item = $(checkbox).closest('.item')
    if($(checkbox).is(":checked")) {
    	$('.promotoria-fields', item).show();
    } else {
    	$('.promotoria-fields', item).hide();
    	$('input', $('.promotoria-fields', item)).val('');
    }
	});
})