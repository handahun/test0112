<%@ page language="Java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<body>
<h2>Hello World!wwww</h2>
</body>
<script src="https://cunning-fox-komlbd-dev-ed.my.salesforce.com/lightning/lightning.out.js"></script>
<div id="LcDisplayId"></div>

 <script>
      // Here 'VfApp' Is Lightning Application Name
    $Lightning.use("c:VfApp", function() {
      /* 'LcForVf' is Lightning Component Name which we are Displaying In Vf Page
       * syntax for create lightning component dynamically :
       * $Lightning.createComponent(String type, Object attributes, String locator, function callback) */
    $Lightning.createComponent("c:LcForVf",
    {
      // Set Lightning Component Attributes Property before creating Lightning Component In Visualforce page
        textColor : "Red",
        currentUserName : '{!$User.FirstName} {!$User.LastName}'
 	},
   "LcDisplayId",
    function(component) {
        // create component Callback, Lightning Component has been Created,
        // Now you can set more lightning Component attributes here,
        // and do more cool stuff here
        component.set("v.accId" , '{!$CurrentPage.parameters.recId}');
    });
 });
 </script>
    <style type='text/css'>
	.embeddedServiceHelpButton .helpButton .uiButton {
		background-color: #F98D28;
		font-family: "Arial", sans-serif;
	}
	.embeddedServiceHelpButton .helpButton .uiButton:focus {
		outline: 1px solid #F98D28;
	}
</style>

<script type='text/javascript' src='https://service.force.com/embeddedservice/5.0/esw.min.js'></script>
<script type='text/javascript'>
	var initESW = function(gslbBaseURL) {
		embedded_svc.settings.displayHelpButton = true; //または false
		embedded_svc.settings.language = ''; //たとえば、「en」または「en-US」を入力します

		//embedded_svc.settings.defaultMinimizedText = '...'; //(エキスパートとチャットにデフォルト設定)
		//embedded_svc.settings.disabledMinimizedText = '...'; //(エージェントがオフラインにデフォルト設定)

		//embedded_svc.settings.loadingText = ''; //(読み込み中にデフォルト設定)
		//embedded_svc.settings.storageDomain = 'yourdomain.com'; //(リリースのドメインを設定して、訪問者がチャットセッション中にサブドメインを移動できるようにします)

		// チャット の設定
		//embedded_svc.settings.directToButtonRouting = function(prechatFormData) {
			// Dynamically changes the button ID based on what the visitor enters in the pre-chat form.
			// Returns a valid button ID.
		//};
		//embedded_svc.settings.prepopulatedPrechatFields = {}; //事前チャットフォームの項目の自動入力を設定
		//embedded_svc.settings.fallbackRouting = []; //ボタン ID、ユーザ ID、または userId_buttonId の配列
		//embedded_svc.settings.offlineSupportMinimizedText = '...'; //(デフォルトは [お問い合わせ])

		embedded_svc.settings.enabledFeatures = ['LiveAgent'];
		embedded_svc.settings.entryFeature = 'LiveAgent';

		embedded_svc.init(
			'https://ropping--test.my.salesforce.com',
			'https://test-roppingbot.cs113.force.com/liveAgentSetupFlow',
			gslbBaseURL,
			'00D1s0000008lxF',
			'Web_Chat_Bot',
			{
				baseLiveAgentContentURL: 'https://c.la2-c1cs-hnd.salesforceliveagent.com/content',
				deploymentId: '5722w000000chF1',
				buttonId: '5732w000000cjuH',
				baseLiveAgentURL: 'https://d.la2-c1cs-hnd.salesforceliveagent.com/chat',
				eswLiveAgentDevName: 'Web_Chat_Bot',
				isOfflineSupportEnabled: false
			}
		);
	};

	if (!window.embedded_svc) {
		var s = document.createElement('script');
		s.setAttribute('src', 'https://ropping--test.my.salesforce.com/embeddedservice/5.0/esw.min.js');
		s.onload = function() {
			initESW(null);
		};
		document.body.appendChild(s);
	} else {
		initESW('https://service.force.com');
	}
</script>
</html>
