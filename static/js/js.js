$(document).ready(function(){

	var i = 0;
	var year = new Date().getFullYear();
	$('#year').text(year);


	$(window).resize(function(){
		$('#width').text($(window).width());

	});


	var contact = $('body').height();

	$('a[href="contact"]').click(function(e){
		e.preventDefault();
		$('body,html').animate({scrollTop:contact+500});
		if ($('body').width() < 680) {
			close();
		}

		return false;
	});


	function open(){
		if ($('body').width() > 680) {
			$('.menu').stop().animate({
				'margin-left':'80%'
			});
			i = 1;
		}
		else{
			$('.menu').stop().animate({
				'margin-left':'20%'
			});
			i = 1;
		}
		$('.menu-button').addClass('text-blue');

		$(document).keyup(function(e){
			if (e.keyCode == 27) {
				close();
			}
		});
	}

	function close(){
		$('.menu').stop().animate({
			'margin-left':'100%'
		});

		i = 0;
		$('.menu-button').removeClass('text-blue');
	}

	$('.menu-button').click(function(){

		if (i == 1) {
			close();
		}
		else{
			open();
		}

	});

	$('.menu').parent().click(function(){
		if ($('body').width() < 910) {
			close();
		}
	});
});
