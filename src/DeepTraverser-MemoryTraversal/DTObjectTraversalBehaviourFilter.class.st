Class {
	#name : #DTObjectTraversalBehaviourFilter,
	#superclass : #DTMemoryTraversalObjectFilter,
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #testing }
DTObjectTraversalBehaviourFilter >> matches: anObject [
	^ anObject isKindOf: Behavior
]
