Class {
	#name : #DTMemoryTreemapReportObjectImmediateReference,
	#superclass : #DTMemoryTreemapReportEntity,
	#instVars : [
		'object'
	],
	#category : #'DeepTraverser-MemoryTraversal-Treemap'
}

{ #category : #accessing }
DTMemoryTreemapReportObjectImmediateReference >> children [
	^ {  }
]

{ #category : #accessing }
DTMemoryTreemapReportObjectImmediateReference >> groups [
	^ { }
]

{ #category : #accessing }
DTMemoryTreemapReportObjectImmediateReference >> leaves [
	^ {  }
]

{ #category : #accessing }
DTMemoryTreemapReportObjectImmediateReference >> object [
	^ object
]

{ #category : #accessing }
DTMemoryTreemapReportObjectImmediateReference >> object: anObject [
	object := anObject
]

{ #category : #printing }
DTMemoryTreemapReportObjectImmediateReference >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	aStream print: self object
]

{ #category : #'memory usage' }
DTMemoryTreemapReportObjectImmediateReference >> totalSizeInMemory [
	^ 0
]
