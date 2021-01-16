Class {
	#name : #DTObjectTraversalBlockFilter,
	#superclass : #DTMemoryTraversalObjectFilter,
	#instVars : [
		'block'
	],
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #accessing }
DTObjectTraversalBlockFilter >> block: aBlock [
	block := aBlock	
]

{ #category : #testing }
DTObjectTraversalBlockFilter >> matches: anObject [
	^ block value: anObject
]
