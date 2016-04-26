$(function(){

	var action = $('body').data().action;

	if (action == 'index') {

		$('#faggot_calendar').fullCalendar({

		});


		$.ajax({
			method: 'GET',
			dataType: 'json',
			url: '/calendar.json',
			success: function(data) {
				alert(data);
			}
		});

	};

});
