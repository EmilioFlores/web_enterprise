$(function(){

	var action = $('body').data().action;

	if (action == 'index') {

		$('#my_calendar').fullCalendar({
			events: function(start, end, timezone, callback) {
		        $.ajax({
					method: 'GET',
					dataType: 'json',
					url: '/calendar.json',
		            success: function(data) {
		            	var clean_data = []
		            	birth_dates = JSON.parse(data.birth_dates);
		            	policies = JSON.parse(data.policies);
		            	spouses = JSON.parse(data.spouses);
		            	offspring = JSON.parse(data.offspring);
		            	for (var i = birth_dates.length - 1; i >= 0; i--) {
		            		if (birth_dates[i].date) {
		            			clean_data.push(birth_dates[i]);
		            		}
		            	};
		            	for (var i = policies.length - 1; i >= 0; i--) {
		            		if (policies[i].date) {
		            			clean_data.push(policies[i]);
		            		}
		            	};
		            	for (var i = spouses.length - 1; i >= 0; i--) {
		            		if (spouses[i].date) {
		            			clean_data.push(spouses[i]);
		            		}
		            	};
		            	for (var i = offspring.length - 1; i >= 0; i--) {
		            		if (offspring[i].date) {
		            			clean_data.push(offspring[i]);
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
