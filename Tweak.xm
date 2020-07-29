static BOOL isEnabled = YES;
static void refreshPrefs() {
	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.popsicletreehouse.iknowmorethanuprefs"];
	isEnabled = [[bundleDefaults objectForKey:@"isEnabled"]boolValue];
}
static void PreferencesChangedCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    refreshPrefs();
}
%hook SBSwitcherAppSuggestionViewController
-(BOOL)showSuggestions {
	if(isEnabled) {
		return NO;
	} else {
		return %orig;
	}
}
-(void)setShowSuggestions:(BOOL)arg1 {
	if(isEnabled) {
		%orig(NO);
	} else {
		%orig;
	}
}
%end

%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) PreferencesChangedCallback, CFSTR("com.popsicletreehouse.iknowmorethanu.prefschanged"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
	refreshPrefs();
}