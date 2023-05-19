Extension { #name : #OrderedDictionary }

{ #category : #'*DeepTraverser' }
OrderedDictionary >> removeFirst [
	self isEmpty ifTrue: [self errorEmptyCollection].
	^self removeKey: self orderedKeys first
]
