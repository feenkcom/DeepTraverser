Class {
	#name : #DTMemoryTreemapReportObjectSlot,
	#superclass : #DTMemoryTreemapReportEntity,
	#instVars : [
		'name'
	],
	#category : #'DeepTraverser-MemoryTraversal-Treemap'
}

{ #category : #accessing }
DTMemoryTreemapReportObjectSlot >> children [
	^ {  }
]

{ #category : #accessing }
DTMemoryTreemapReportObjectSlot >> groups [
	^ {  }
]

{ #category : #testing }
DTMemoryTreemapReportObjectSlot >> isOccupiedBySlot [
	^ true
]

{ #category : #accessing }
DTMemoryTreemapReportObjectSlot >> leaves [
	^ { }
]

{ #category : #accessing }
DTMemoryTreemapReportObjectSlot >> name [
	^ name
]

{ #category : #accessing }
DTMemoryTreemapReportObjectSlot >> name: anObject [
	name := anObject
]

{ #category : #printing }
DTMemoryTreemapReportObjectSlot >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	aStream print: name
]

{ #category : #accessing }
DTMemoryTreemapReportObjectSlot >> totalSizeInMemory [
	^ Smalltalk wordSize
]
