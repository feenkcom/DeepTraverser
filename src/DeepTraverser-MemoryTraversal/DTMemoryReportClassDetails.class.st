Class {
	#name : #DTMemoryReportClassDetails,
	#superclass : #DTMemoryReportEntityDetails,
	#instVars : [
		'className',
		'instances'
	],
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #ui }
DTMemoryReportClassDetails >> gtInstancesViewFor: aView [
	<gtView>
	^ aView list
		title: 'Instances';
		items: [ self instances ]
]

{ #category : #actions }
DTMemoryReportClassDetails >> includeObject: anObject [
	self assert: [ anObject class name = self name ].
	instancesCount := instancesCount + 1.
	instancesSize := instancesSize + anObject sizeInMemory.
	
	self instances add: anObject
]

{ #category : #accessing }
DTMemoryReportClassDetails >> instances [
	^ instances ifNil: [ instances := OrderedCollection new ]
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
