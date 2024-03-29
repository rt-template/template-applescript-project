(*
	Checks the config-system.plist then adds this project key and path if it is not yet registered.
	
	@Plist:
		config-user.plist
		
	@Plist Keys
		Work Key - Just an example.
		
	@Uninstall:
		plutil -remove 'Domain Key' ~/applescript-core/config-user.plist
*)
set infoKey to "Domain Key" -- e.g. apple

set std to script "std"
set logger to std's import("logger")'s new("enter-user-info")
set plutil to std's import("plutil")'s new()

set textUtil to std's import("string")
set listUtil to std's import("list")

set configUser to plutil's new("config-user")

(*
if configUser's hasValue(infoKey) then
	logger's infof("The detail: {} is already present with the value: {}", {infoKey, configUser's getValue(infoKey)})
	return
end if
*)

set existingValue to ""
if configUser's hasValue(infoKey) then set existingValue to configUser's getValue(infoKey)

set userInput to display dialog "Enter a new value value for: " & infoKey default answer existingValue
set inputText to text returned of userInput
logger's debugf("inputText: {}", inputText)

configUser's setValue(infoKey, inputText)
logger's infof("The detail: {} is now saved for {}", {inputText, infoKey})



