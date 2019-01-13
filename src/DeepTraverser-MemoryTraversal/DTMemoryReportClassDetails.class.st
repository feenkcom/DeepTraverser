Class {
	#name : #DTMemoryReportClassDetails,
	#superclass : #DTMemoryReportEntityDetails,
	#instVars : [
		'className'
	],
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #actions }
DTMemoryReportClassDetails >> includeObject: anObject [
	self assert: [ anObject class name = self name ].
	instancesCount := instancesCount + 1.
	instancesSize := instancesSize + anObject sizeInMemory.
]

{ #category : #accessing }
DTMemoryReportClassDetails >> name [
	^ className
]

{ #category : #accessing }
DTMemoryReportClassDetails >> name: aClassName [
	className := aClassName
]

{ #category : #accessing }
DTMemoryReportClassDetails >> package [
	^ self name asClass package
]
