/**
* My Event Handler Hint
*/
component{


	// Index
	any function index( event,rc, prc ){
		var ws 	= getInstance( "webservices@cbsoap" ).getWSObj( "weatherWS" );
		prc.data = ws.GetWeather( "New York", "United States" );
	}

	// Run on first init
	any function onAppInit( event, rc, prc ){
		// register a webservice
		getInstance( "webservices@cbsoap").registerWS( name="weatherWS", wsdl="http://www.webservicex.com/globalweather.asmx?wsdl" );
	}

}
