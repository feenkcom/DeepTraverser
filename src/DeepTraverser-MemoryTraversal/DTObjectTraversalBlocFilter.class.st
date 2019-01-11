Class {
	#name : #DTObjectTraversalBlocFilter,
	#superclass : #DTMemoryTraversalObjectFilter,
	#instVars : [
		'block'
	],
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #accessing }
DTObjectTraversalBlocFilter >> block: aBlock [
	block := aBlock	
]

{ #category : #testing }
DTObjectTraversalBlocFilter >> matches: anObject [
	^ block value: anObject
]
