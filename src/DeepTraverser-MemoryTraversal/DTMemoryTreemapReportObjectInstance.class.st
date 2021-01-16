Class {
	#name : #DTMemoryTreemapReportObjectInstance,
	#superclass : #DTMemoryTreemapReportEntity,
	#instVars : [
		'object',
		'header',
		'slots'
	],
	#category : #'DeepTraverser-MemoryTraversal-Treemap'
}

{ #category : #accessing }
DTMemoryTreemapReportObjectInstance >> children [
	^ self leaves
]

{ #category : #accessing }
DTMemoryTreemapReportObjectInstance >> groups [
	^ {  }
]

{ #category : #accessing }
DTMemoryTreemapReportObjectInstance >> leaves [
	^ Array streamContents: [ :aStream |
		header exists
			ifTrue: [ aStream nextPut: header ].
		
		aStream nextPutAll: slots ]
]

{ #category : #accessing }
DTMemoryTreemapReportObjectInstance >> object [
	^ object
]

{ #category : #accessing }
DTMemoryTreemapReportObjectInstance >> object: anObject [
	object := anObject.
	header := DTMemoryTreemapReportObjectHeader new object: anObject.
	slots := self slotsOfObject: anObject
]

{ #category : #printing }
DTMemoryTreemapReportObjectInstance >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	aStream
		nextPutAll: 'Instance of ';
		print: self object class
]

{ #category : #'as yet unclassified' }
DTMemoryTreemapReportObjectInstance >> slotsOfObject: anObject [
	| startIndex |

	startIndex := (anObject isKindOf: CompiledCode) 
		ifTrue: [ anObject initialPC ] "Indexed variables for ompiled methods start from the initial PC"
		ifFalse: [ 1 ].
	^ (anObject class allSlots 
		collect: [ :eachSlot | DTMemoryTreemapReportObjectSlot new name: eachSlot name ]), 
		((startIndex to: anObject basicSize) collect: [ :index | DTMemoryTreemapReportObjectSlot new name: index ])
]

{ #category : #accessing }
DTMemoryTreemapReportObjectInstance >> totalSizeInMemory [
	^ header totalSizeInMemory + (slots inject: 0 into: [ :sum :each | sum + each totalSizeInMemory ])
]
