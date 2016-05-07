$(function(){

	var action = $('body').data().action;

	if (action == 'index') {

		$('#faggot_calendar').fullCalendar({
			events: function(start, end, timezone, callback) {
		        $.ajax({
					method: 'GET',
					dataType: 'json',
					url: '/calendar.json',
		            success: function(data) {
		            	console.log(data);
		            	var clean_data = []
		            	for (var i = data.policies.length - 1; i >= 0; i--) {
		            		if (data.policies[i].date) {
		            			clean_data.push(data.policies[i]);
		            		}
		            	};
		            	for (var i = data.birth_dates.length - 1; i >= 0; i--) {
		            		if (data.birth_dates[i].date) {
		            			clean_data.push(data.birth_dates[i]);
		            		}
		            	};

		            	console.log(data);
		                callback(clean_data);
		            }
		        });
		    },
	        eventClick: function(calEvent, jsEvent, view) {
	        	console.log(calEvent);
	        	if (calEvent.link) {
	        		window.location = calEvent.link;
	        		calEvent.preventDefault();	        		
		            return false;
	        	};
		        // change the border color just for fun
		        // $(this).css('background-color', 'black');
		    },
		    height: 650,
			color: 'yellow',
		    textColor: 'black'
		});




	};

});
