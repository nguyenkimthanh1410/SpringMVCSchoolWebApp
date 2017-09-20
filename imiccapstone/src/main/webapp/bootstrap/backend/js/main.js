$ = jQuery;
(function($) {
	$("#myHref").on('click', function() {
		if ($("#myHref").attr("aria-expanded") == "true") {
			$("#image").attr('src', '/images/10.png');
		} else {
			$("#image").attr('src', '/images/9.png');
		}
		// alert ("inside onclick");
	});


})(jQuery);

/* role permission */
function myFunction(id) {
	var id2 = id.substring(0, id.lastIndexOf("_") + 1);
	console.log(id2);
	if (id.endsWith('_VIEW')) {
		console.log(id.endsWith('_VIEW'));
		if (document.getElementById(id).checked == false) {
			var inputs = document.getElementsByTagName("input");
			console.log(inputs);
			for (var i = 0; i < inputs.length; i++) {
				if (inputs[i].id.indexOf(id2) == 0) {
					inputs[i].checked = false;
				}
			}
		}
	} else {
		if (document.getElementById(id).checked == true) {
			try {
				document.getElementById(id2 + 'VIEW').checked = true;
			} catch (err) {
			}
		}
	}
}
