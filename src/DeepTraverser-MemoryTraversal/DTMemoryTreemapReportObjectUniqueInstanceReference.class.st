Class {
	#name : #DTMemoryTreemapReportObjectUniqueInstanceReference,
	#superclass : #DTMemoryTreemapReportEntity,
	#instVars : [
		'reportObject'
	],
	#category : #'DeepTraverser-MemoryTraversal-Treemap'
}

{ #category : #accessing }
DTMemoryTreemapReportObjectUniqueInstanceReference >> children [
	^ reportObject children
]

{ #category : #accessing }
DTMemoryTreemapReportObjectUniqueInstanceReference >> groups [
	^ reportObject groups
]

{ #category : #testing }
DTMemoryTreemapReportObjectUniqueInstanceReference >> isUniqueInstance [
	^ true
]

{ #category : #accessing }
DTMemoryTreemapReportObjectUniqueInstanceReference >> leaves [
	^ reportObject leaves
]

{ #category : #accessing }
DTMemoryTreemapReportObjectUniqueInstanceReference >> object [
	^ reportObject object
]

{ #category : #printing }
DTMemoryTreemapReportObjectUniqueInstanceReference >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	aStream print: self object
]

{ #category : #accessing }
DTMemoryTreemapReportObjectUniqueInstanceReference >> reportObject: anObject [
	reportObject := anObject
]

{ #category : #'memory usage' }
DTMemoryTreemapReportObjectUniqueInstanceReference >> totalSizeInMemory [
	^ reportObject totalSizeInMemory
]
