Class {
	#name : #DTMemoryTreemapReportObjectReference,
	#superclass : #DTMemoryTreemapReportEntity,
	#instVars : [
		'object',
		'reusedReportObject',
		'slotName'
	],
	#category : #'DeepTraverser-MemoryTraversal-Treemap'
}

{ #category : #accessing }
DTMemoryTreemapReportObjectReference >> children [
	^ #()
]

{ #category : #accessing }
DTMemoryTreemapReportObjectReference >> groups [
	^ {  }
]

{ #category : #accessing }
DTMemoryTreemapReportObjectReference >> leaves [
	^ {  }
]

{ #category : #accessing }
DTMemoryTreemapReportObjectReference >> object [
	^ object
]

{ #category : #accessing }
DTMemoryTreemapReportObjectReference >> object: anObject [
	object := anObject
]

{ #category : #'as yet unclassified' }
DTMemoryTreemapReportObjectReference >> objectClassName [
	^ self object class name
]

{ #category : #accessing }
DTMemoryTreemapReportObjectReference >> objectInstance [
	^ self
]

{ #category : #accessing }
DTMemoryTreemapReportObjectReference >> objectSlots [
	^ {  }
]

{ #category : #printing }
DTMemoryTreemapReportObjectReference >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	aStream print: object; space; nextPutAll: '(reused)'
]

{ #category : #accessing }
DTMemoryTreemapReportObjectReference >> reusedReportObject [
	^ reusedReportObject
]

{ #category : #accessing }
DTMemoryTreemapReportObjectReference >> reusedReportObject: anObject [
	reusedReportObject := anObject
]

{ #category : #accessing }
DTMemoryTreemapReportObjectReference >> slotName [
	^ slotName
]

{ #category : #accessing }
DTMemoryTreemapReportObjectReference >> slotName: anObject [
	slotName := anObject
]

{ #category : #'memory usage' }
DTMemoryTreemapReportObjectReference >> totalSizeInMemory [
	"Just a reference"
	
	"fits in the slot"
	^ 0
]
