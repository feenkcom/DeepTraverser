Class {
	#name : #DTObjectTraversalInstancesFilter,
	#superclass : #DTMemoryTraversalObjectFilter,
	#instVars : [
		'instances'
	],
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #accessing }
DTObjectTraversalInstancesFilter >> instances: aCollectionOfObjects [
	instances := aCollectionOfObjects
]

{ #category : #testing }
DTObjectTraversalInstancesFilter >> matches: anObject [
	^ instances anySatisfy: [ :anotherObject | anObject == anotherObject ]
]
