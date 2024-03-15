Extension { #name : #TGtGroup }

{ #category : #'*DeepTraverser-private' }
TGtGroup >> dtRawTraverseUsing: aStream [
	self do: [ :each | aStream traverse: each ]
]

{ #category : #'*DeepTraverser-private' }
TGtGroup >> dtTraverseStartUsing: aStream [
	self do: [ :each | each dtTraverseStartUsing: aStream ]
]

{ #category : #'*DeepTraverser-private' }
TGtGroup >> dtTraverseUsing: aStream [
	self do: [ :each | each dtTraverseUsing: aStream ]
]
