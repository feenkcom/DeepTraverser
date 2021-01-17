Class {
	#name : #DTMemoryTreemapReportObjectHeader,
	#superclass : #DTMemoryTreemapReportEntity,
	#instVars : [
		'object'
	],
	#category : #'DeepTraverser-MemoryTraversal-Treemap'
}

{ #category : #accessing }
DTMemoryTreemapReportObjectHeader >> children [
	^ {  }
]

{ #category : #testing }
DTMemoryTreemapReportObjectHeader >> exists [
	(self object class isImmediateClass)
		ifTrue: [ ^ false ].
		
	(self object class isVariable)
		ifTrue: [ ^ false ].
		
	^ true
]

{ #category : #accessing }
DTMemoryTreemapReportObjectHeader >> groups [
	^ { }
]

{ #category : #testing }
DTMemoryTreemapReportObjectHeader >> isObjectHeader [
	^ true
]

{ #category : #accessing }
DTMemoryTreemapReportObjectHeader >> leaves [
	^ { }
]

{ #category : #accessing }
DTMemoryTreemapReportObjectHeader >> object [
	^ object
]

{ #category : #accessing }
DTMemoryTreemapReportObjectHeader >> object: anObject [
	object := anObject
]

{ #category : #printing }
DTMemoryTreemapReportObjectHeader >> printOn: aStream [
	aStream
		nextPutAll: 'Object header of ';
		print: self object class
]

{ #category : #accessing }
DTMemoryTreemapReportObjectHeader >> totalSizeInMemory [
	self exists
		ifFalse: [ ^ 0 ].

	^ Smalltalk wordSize
]
