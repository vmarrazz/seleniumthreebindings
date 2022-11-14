*** Setting ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}		Chrome
${HOVERS2TEST}	http://the-internet.herokuapp.com/hovers
${HOVER_TITLE}	The Internet
${QR2TEST}		https://web.whatsapp.com/
${QR_TITLE}	WhatsApp Web

*** Test Cases ***
Sample QR Code Renew
	[Documentation]	Verify update QR Code timing
	[Setup]	Open Browser To Landing Page		${QR2TEST}		${QR_TITLE}
	${scan_locator}=		Set Variable		//div[@data-testid='qrcode']
	${qr_attribute}=		Set Variable		data-ref
	Wait Until Element Is Visible				${scan_locator}
	${scan_element}=		Get Webelement		${scan_locator}
	${old_code}=		Get Element Attribute		${scan_element}		${qr_attribute}
	FOR		${animal}		IN		cat		dog		fish
		Sleep		60 seconds
		${new_code}=		Get Element Attribute		${scan_element}		${qr_attribute}
		Should Not Be Equal		${new_code}		${old_code}
		...		msg=After waiting time QR Code is not changed!
		${old_code}=		Set Variable		${new_code}
	END
	[Teardown]	Close Browser

Sample Hovers Test
	[Setup]	Open Browser To Landing Page		${HOVERS2TEST}		${HOVER_TITLE}
	Highlight Element	figure	5	red
	Mouse Over	class:figure
	Wait Until Element Is Visible	class:figcaption     
	Highlight Element	figcaption	2	blue
	Element Should Be Visible	class:figcaption    
	[Teardown]	Close Browser

*** Keywords ***
Open Browser To Landing Page
	[Arguments]	${URL2TEST}		${EXPECTED_TITLE}
	Open Browser	${URL2TEST}		${BROWSER}
	Title Should Be	${EXPECTED_TITLE}

Highlight Element
	[Documentation]	This keyword highlight WebElement for requested time.
	[Arguments]	${class_name}	${duration}	${color}
	${locator_find}=	Catenate	SEPARATOR=	class:	${class_name}
	${original_style}=	Get Element Attribute	${locator_find}	style
	${new_style}=	Catenate	border: 2px solid 	${color}	; border-style: dashed;
	Execute Javascript	document.getElementsByClassName('${class_name}')[0].setAttribute('style', '${new_style}')
	Run Keyword If	${duration} > 0	Sleep	${duration}
	Execute Javascript	document.getElementsByClassName("${class_name}")[0].setAttribute('style', '${original_style}')
