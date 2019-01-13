Class {
	#name : #DTObjectTraversalBehaviorFilter,
	#superclass : #DTMemoryTraversalObjectFilter,
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #testing }
DTObjectTraversalBehaviorFilter >> matches: anObject [
	^ anObject isKindOf: Behavior
]
