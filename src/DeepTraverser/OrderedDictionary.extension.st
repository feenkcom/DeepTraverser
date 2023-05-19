Extension { #name : #OrderedDictionary }

{ #category : #'*DeepTraverser' }
OrderedDictionary >> removeFirst [
	^self removeKey: self orderedKeys first
]
