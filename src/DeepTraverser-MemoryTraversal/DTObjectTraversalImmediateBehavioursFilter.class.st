Class {
	#name : #DTObjectTraversalImmediateBehavioursFilter,
	#superclass : #DTMemoryTraversalObjectFilter,
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #testing }
DTObjectTraversalImmediateBehavioursFilter >> matches: anObject [
	^ anObject class isImmediateClass
]
