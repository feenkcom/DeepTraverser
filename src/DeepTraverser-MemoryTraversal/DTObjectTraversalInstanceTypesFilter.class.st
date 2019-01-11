Class {
	#name : #DTObjectTraversalInstanceTypesFilter,
	#superclass : #DTMemoryTraversalObjectFilter,
	#instVars : [
		'classes'
	],
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #accessing }
DTObjectTraversalInstanceTypesFilter >> classes: aCollectionOfClasses [
	classes := aCollectionOfClasses
]

{ #category : #testing }
DTObjectTraversalInstanceTypesFilter >> matches: anObject [
	^ classes anySatisfy: [ :aClass | anObject isKindOf: aClass ]
]
