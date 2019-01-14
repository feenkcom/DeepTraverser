Class {
	#name : #DTObjectTraversalGlobalColorsFilter,
	#superclass : #DTMemoryTraversalObjectFilter,
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #testing }
DTObjectTraversalGlobalColorsFilter >> matches: anObject [
	^ (anObject isKindOf: Color) and: [ 
		(Color indexedColors includes: anObject) or: [ 
			(Color registeredNameOf: anObject) ~= #unnamed ] ]
]
