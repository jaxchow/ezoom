//
//  ItemViewController.m
//  @rigoneri
//  
//  Copyright 2010 Rodrigo Neri
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "ItemViewController.h"
@interface ItemViewController ()

@end
@implementation ItemViewController

-(void)viewDidLoad
{
	self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:2/255.0 green:100/255.0 blue:162/255.0 alpha:1];
	[self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
	
//	UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//	btn.frame = CGRectMake(20, 20, 100, 40);
//	btn.backgroundColor = [UIColor clearColor];
//	[btn setTitle:@"Item" forState:UIControlStateNormal];
//	[btn addTarget:self action:@selector(openView) forControlEvents:UIControlEventTouchUpInside];
//	[self.view addSubview:btn];
}

-(void)openView
{
	UIViewController *targetViewController = [[ItemViewController alloc] init];
    [self.navigationController pushViewController:targetViewController animated:YES];
}

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload 
{
    [super viewDidUnload];
}

@end
