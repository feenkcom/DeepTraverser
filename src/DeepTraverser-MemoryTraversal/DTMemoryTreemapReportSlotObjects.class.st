Class {
	#name : #DTMemoryTreemapReportSlotObjects,
	#superclass : #DTMemoryTreemapReportEntity,
	#instVars : [
		'objects'
	],
	#category : #'DeepTraverser-MemoryTraversal-Treemap'
}

{ #category : #adding }
DTMemoryTreemapReportSlotObjects >> addSlotObject: aMemoryReportEntity [
	objects add: aMemoryReportEntity
]

{ #category : #accessing }
DTMemoryTreemapReportSlotObjects >> children [
	^ objects
]

{ #category : #accessing }
DTMemoryTreemapReportSlotObjects >> groups [
	^ objects
]

{ #category : #initialization }
DTMemoryTreemapReportSlotObjects >> initialize [
	super initialize.
	
	objects := OrderedCollection new
]

{ #category : #testing }
DTMemoryTreemapReportSlotObjects >> isNotEmpty [
	^ objects isNotEmpty
]

{ #category : #accessing }
DTMemoryTreemapReportSlotObjects >> leaves [
	^ {  }
]

{ #category : #accessing }
DTMemoryTreemapReportSlotObjects >> objects [
	^ objects
]

{ #category : #printing }
DTMemoryTreemapReportSlotObjects >> printOn: aStream [
	aStream
		nextPutAll: 'Referenced objects'
]

{ #category : #accessing }
DTMemoryTreemapReportSlotObjects >> totalSizeInMemory [
	^ objects inject: 0 into: [ :sum :each | sum + each totalSizeInMemory ]
]
