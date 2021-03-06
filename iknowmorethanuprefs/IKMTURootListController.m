#include "IKMTURootListController.h"
#include <spawn.h>

@implementation IKMTURootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}
-(void)openGithub {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://github.com/PopsicleTreehouse/IKnowMoreThanU"] options:@{} completionHandler:nil];
}
-(void)openTwitter {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://Twitter.com/ahoynodnarb"] options:@{} completionHandler:nil];
}
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	UIBarButtonItem *applyButton = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(applyChanges)];
	self.navigationItem.rightBarButtonItem = applyButton;
}
-(void)applyChanges {
	pid_t pid;
	const char *argv[] = {"killall", "backboardd", NULL};
	posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)argv, NULL);
}
@end
