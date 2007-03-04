function goto(theUrl, event) {
	var key;
    	if (event) {
	      if (event.which == 13) {
	        location.href = theUrl;
      	      }
    	}
}