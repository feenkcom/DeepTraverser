Class {
	#name : #DTObjectTraversalBooleanFilter,
	#superclass : #DTMemoryTraversalObjectFilter,
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #testing }
DTObjectTraversalBooleanFilter >> matches: anObject [
	^ anObject == true or: [ anObject == false ]
]
