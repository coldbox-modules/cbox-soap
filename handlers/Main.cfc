/**
* My Event Handler Hint
*/
component{


	// Index
	any function index( event,rc, prc ){
		var ws 	= getInstance( "webservices@soap" ).getWSObj( "coldboxWS" );
		prc.data = ws.GetUpdateInfo( "1.0.0", "1.0.0" );
	}

	// Run on first init
	any function onAppInit( event, rc, prc ){
		// register a webservice
		getInstance( "webservices@soap").registerWS( name="coldboxWS", wsdl="http://www.coldbox.org/distribution/updatews.cfc?wsdl" );
	}

}