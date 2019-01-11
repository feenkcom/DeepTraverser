Class {
	#name : #DTObjectTraversalMethodEntitiesFilter,
	#superclass : #DTMemoryTraversalObjectFilter,
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #testing }
DTObjectTraversalMethodEntitiesFilter >> matches: anObject [
	^ anObject isKindOf: CompiledCode
]
