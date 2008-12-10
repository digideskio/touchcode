//
//  CSqliteEnumerator.m
//  sqllitetest
//
//  Created by Jonathan Wight on Tue Apr 27 2004.
//  Copyright (c) 2004 Jonathan Wight
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "CSqliteEnumerator.h"

@interface CSqliteEnumerator ()
@property (readwrite, retain) CSqliteStatement *statement;
@property (readwrite, assign) BOOL resultsAsDictionary;
@end

@implementation CSqliteEnumerator

@synthesize statement;
@synthesize resultsAsDictionary;

- (id)initWithStatement:(CSqliteStatement *)inStatement resultsAsDictionary:(BOOL)inResultsAsDictionary;
{
if ((self = [self init]) != NULL)
	{
	self.statement = inStatement;
	self.resultsAsDictionary = inResultsAsDictionary;
	}
return(self);
}

- (id)initWithStatement:(CSqliteStatement *)inStatement
{
return([self initWithStatement:inStatement resultsAsDictionary:YES]);
}

- (void)dealloc
{
self.statement = NULL;
//
[super dealloc];
}

#pragma mark -

- (id)nextObject
{
[self.statement step:NULL];
if (self.resultsAsDictionary)
	return([self.statement rowDictionary:NULL]);
else
	return([self.statement row:NULL]);
}

@end
