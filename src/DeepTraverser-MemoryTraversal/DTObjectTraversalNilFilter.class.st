Class {
	#name : #DTObjectTraversalNilFilter,
	#superclass : #DTMemoryTraversalObjectFilter,
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #testing }
DTObjectTraversalNilFilter >> matches: anObject [
	^ anObject == nil
]
