
$(function() {
	$(".navbar-expand-toggle").click(function() {
		$(".side-menu").hover(function() {
			setTopBackGround();
			setBottomBackGround();
		});
		setTopBackGround();
		setBottomBackGround();
		$(".app-container").toggleClass("expanded");
		return $(".navbar-expand-toggle").toggleClass("fa-rotate-90");
	});
	return $(".navbar-right-expand-toggle").click(function() {
		$(".navbar-right").toggleClass("expanded");
		return $(".navbar-right-expand-toggle").toggleClass("fa-rotate-90");

	});
});

$(function() {
	return $(".side-menu .nav .dropdown").on('show.bs.collapse', function() {
		return $(".side-menu .nav .dropdown .collapse").collapse('hide');
	});
});
$(function() {
	$(".side-menu").hover(function() {
		setTopBackGround();
		setBottomBackGround();
	});
});
function setTopBackGround() {
	if ($("#main-menu .navbar-header").hasClass("bg7")) {
		$("#main-menu .navbar-header").removeClass("bg7");
		$("#main-menu .navbar-header").addClass("bg5");
		return;
	}

	if ($("#main-menu .navbar-header").hasClass("bg5")) {
		$("#main-menu .navbar-header").removeClass("bg5");
		$("#main-menu .navbar-header").addClass("bg7");
		return;
	}
}
function setBottomBackGround() {
	if ($(".side-menu").hasClass("bg8")) {
		$(".side-menu").removeClass("bg8");
		$(".side-menu").addClass("bg6");
		return;
	}

	if ($(".side-menu").hasClass("bg6")) {
		$(".side-menu").removeClass("bg6");
		$(".side-menu").addClass("bg8");
		return;
	}
}
