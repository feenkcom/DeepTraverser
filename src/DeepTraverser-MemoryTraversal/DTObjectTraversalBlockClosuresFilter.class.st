Class {
	#name : #DTObjectTraversalBlockClosuresFilter,
	#superclass : #DTMemoryTraversalObjectFilter,
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #testing }
DTObjectTraversalBlockClosuresFilter >> matches: anObject [
	^ anObject isKindOf: BlockClosure
]
