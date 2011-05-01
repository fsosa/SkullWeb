// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
	$(".my_row").click(function(){
		// CHECKMARK CHANGE CODE
		var myElement = $(this);
		var classes = myElement.attr('class').split(/\s+/);
		for(var i = 0; i < classes.length; i++){
			if (classes[i] == "done"){
				classes[i] = "undone";
				var strike = $(this).children("#my_job").css("text-decoration");
				strike="none";
				$(this).children("#my_job").css("text-decoration", strike);
				var src = $(this).children().children().children("#check").attr("src");
				src="/images/empty_check.png";
				$(this).children().children().children("#check").attr("src", src);				
			}else if (classes[i] == "undone"){
				classes[i] = "done"
				var strike = $(this).children("#my_job").css("text-decoration");
				 strike="line-through";
				$(this).children("#my_job").css("text-decoration", strike);
				var src = $(this).children().children().children("#check").attr("src");
				src="/images/filled_check.png"
				$(this).children().children().children("#check").attr("src", src);
			}
			else{
			}
		}
		
		myElement.attr('class', classes[0] + " " + classes[1]); 
		

	});		
	
	$(".my_row").bind('click', function(){
		$.ajax({
			url: '/hj/completeJob', 
			data: {"desc":$(this).children("#my_job").html()},
			success: function(){console.log("job changed")},
			});});
			
	
	// RESERVE TABLE REVEAL COMMENTS
	$(".rsvp_table  a").click(function(){		
		$(this).parent().parent().next("tr.ev_info").toggle();
	});

	// WILL NEED TO TAKE THIS OUT LATER
	$("#rr_form").submit(function() {
		$("#rsvp_table_31 > tbody:last").append('<tr><td>Poker<a id="more_info2"><img id="test" src="/images/plus.png" width=20px height=20px/></a></td><td>Chapter Room</td><td>1:00am - 4:00am</td></tr><tr class="ev_info" style="display:none"><td colspan="3">Comments: Playing someHTMLer.<br />Reserved by: Fidel Sosa<br /><a href="room.html">Delete Event</a></tr>');
		document.forms[0].reset();
		$("#more_info2").click(function(){			
			$("#more_info2").parent().parent().next("tr.ev_info").toggle();
		});
		console.log(this);
		alert("You reserved the Chapter room for Poker from 1:00 a.m to 4:00 a.m.");
		return false;
	});		
	
});