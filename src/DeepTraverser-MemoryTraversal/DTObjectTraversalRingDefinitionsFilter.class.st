Class {
	#name : #DTObjectTraversalRingDefinitionsFilter,
	#superclass : #DTMemoryTraversalObjectFilter,
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #testing }
DTObjectTraversalRingDefinitionsFilter >> matches: anObject [
	^ anObject isKindOf: RGDefinition
]
