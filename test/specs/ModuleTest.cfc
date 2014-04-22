/**
* My BDD Test
*/
component extends="coldbox.system.testing.BaseTestCase" appMapping="/root"{

/*********************************** LIFE CYCLE Methods ***********************************/

	// executes before all suites+specs in the run() method
	function beforeAll(){
		super.beforeAll();
	}

	// executes after all suites+specs in the run() method
	function afterAll(){
		super.afterAll();
	}

/*********************************** BDD SUITES ***********************************/

	function run(){
		// all your suites go here.
		describe( title="Soap Module", body=function(){

			beforeEach(function( currentSpec ){
				setup();
			});

			it( "should register service", function(){
				var loader = getService();
				expect(	loader ).toBeComponent();
			});

			it( "should get a ws object", function(){
				// register a ws
				getController().getSetting( "modules" ).soap.settings.webservices[ "testWS" ] = "http://www.coldbox.org/distribution/updatews.cfc?wsdl";
				var loader = getService();
				expect( isObject( loader.getWSObj( "testWS" ) ) ).toBeTrue();
			});

			it( "should get a wsdl", function(){
				// register a ws
				getController().getSetting( "modules" ).soap.settings.webservices[ "testWS" ] = "http://www.coldbox.org/distribution/updatews.cfc?wsdl";
				var loader = getService();
				expect( loader.getWS( "testWS" ) ).toBe( "http://www.coldbox.org/distribution/updatews.cfc?wsdl" );
			});

			it( "should execute wsdl function", function(){
				var event = execute( event="main.index", renderResults=true );
				var prc = event.getCollection( private=true );
				expect( prc.data ).toBeStruct();
			});

			it( "should retrieve via custom DSL", function(){
				var hello = getWireBox().getInstance( dsl="webservice:coldboxWS" );
				expect( isObject( hello ) ).toBeTrue();
			});
		});
	}

	private function getService(){
		return getWireBox().getInstance( "webservices@soap" );
	}

}