jQuery(document).ready(function($, undefined) {
		
	/* setup */
	var $wrapper=$('#gw-switcher');

	/*if (!$.cookie('switcher')) { 
		$.cookie('switcher',1);
		$.cookie('sticky',1);
	}*/

	/* style switcher link event */
	$('.gw-switcher-tab').delegate('a', 'click', function(e){
		var $this=$(this);
		
		e.preventDefault();
		if ($this.hasClass('gw-switchter-open')) {
			$wrapper.animate({'left':'-142px'},350, function() { $this.removeClass('gw-switchter-open'); });
		} else {
			$wrapper.animate({'left':'-10px'},350, function() { $this.addClass('gw-switchter-open'); });
		};
	});
	
	/* switcher opt events */
	$('.gw-switcher-row').delegate('a', 'click', function(e){
		var $this=$(this);
		
		e.preventDefault();

		/* events */
		if ($this.hasClass('go-switcher-opt-boxed')) {
                if ($this.hasClass('go-switcher-opt-checked')) {
                   
				    $.cookie('is-box',1, { expires: -1 });
					$.cookie('is-wide',1);
					$('body').removeClass("is-box").addClass("is-wide");
					
					$('#layout').removeClass("boxed-layout").addClass("wide-layout");   
                } else {
					$('body').removeClass("is-wide").addClass("is-box");
                   
				  $('#layout').removeClass("wide-layout").addClass("boxed-layout");
                };
                $(window).trigger('resize');
				
		} else if ($this.hasClass('go-switcher-opt-sticky')) { 
			if ($this.hasClass('go-switcher-opt-checked')) {
				$.cookie('navbar-fixed-top',1);
				$('header').addClass('navbar-fixed-top');
				$('window').trigger('scroll');
				$('#home').addClass('fixed-home');
			} else {
				$.cookie('navbar-fixed-top',0);	
				$('header').removeClass('navbar-fixed-top');
				$('#home').removeClass('fixed-home');
				$('window').trigger('scroll');
			};
		};


		/* check & uncheck checkboxes */
		if ($this.hasClass('go-switcher-opt-checked')) {
			$this.removeClass('go-switcher-opt-checked');
		} else {
			$this.addClass('go-switcher-opt-checked');
		};
	});

	if ($.cookie('is-boxed')) { $('.go-switcher-opt-boxed').trigger('click'); };
	//if ($.cookie('nosticky')) { $('.go-switcher-opt-sticky').trigger('click'); };
	
	
	
	
	
	

});












