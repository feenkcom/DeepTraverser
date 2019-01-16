Class {
	#name : #DTObjectTraversalSymbolsFilter,
	#superclass : #DTMemoryTraversalObjectFilter,
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #testing }
DTObjectTraversalSymbolsFilter >> matches: anObject [
	^ anObject isKindOf: Symbol
]
