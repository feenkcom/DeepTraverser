Class {
	#name : #DTObjectTraversalGlobalObjectFilter,
	#superclass : #DTMemoryTraversalObjectFilter,
	#instVars : [
		'cachedGlobals'
	],
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #testing }
DTObjectTraversalGlobalObjectFilter >> matches: anObject [
	cachedGlobals ifNil: [ cachedGlobals := Smalltalk globals asIdentitySet ].
	^ cachedGlobals includes: anObject
]
