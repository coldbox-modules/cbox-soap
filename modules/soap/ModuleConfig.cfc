component {

	// Module Properties
	this.title 				= "soap";
	this.author 			= "Luis Majano";
	this.webURL 			= "http://www.ortussolutions.com";
	this.description 		= "A nice module to help you interact with SOAP web services";
	this.version			= "1.0.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "soap";

	function configure(){

		// settings
		settings = {
			// List all your webservices here that this module can tallk to.
			webservices = {
				// name = WSDL URL
			}
		};

		// Register Custom DSL, don't map it because it is too late, mapping DSLs are only good by the parent app
		controller.getWireBox().registerDSL( namespace="webservice", path="#moduleMapping#.model.WebservicesDSL" );

		// Binder Mappings
		binder.map( "Webservices@soap" )
			.to( "#moduleMapping#.model.Webservices" );

	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){

	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){

	}

}