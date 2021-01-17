"
Object memory is composed out of:
 - object instance
   - slots (each slot is usually = wordSize)
 - slot objects (immidiate objects such as small integers and floats fit their slot)
"
Class {
	#name : #DTMemoryTreemapReportObject,
	#superclass : #DTMemoryTreemapReportEntity,
	#instVars : [
		'sharedCount',
		'objectInstance',
		'slotObjects'
	],
	#category : #'DeepTraverser-MemoryTraversal-Treemap'
}

{ #category : #adding }
DTMemoryTreemapReportObject >> addSlotObject: aReportObject [
	slotObjects addSlotObject: aReportObject
]

{ #category : #converting }
DTMemoryTreemapReportObject >> asObjectReference [
	| isAlreadyReferenced |

	(self class isImmediateObject: self object)
		ifTrue: [ ^ DTMemoryTreemapReportObjectImmediateReference new object: self object ].

	(self class isUniqueInstanceObject: self object)
		ifTrue: [ ^ DTMemoryTreemapReportObjectUniqueInstanceReference new reportObject: self ].

	isAlreadyReferenced := self isAlreadyReferenced.
	self increaseReferenceCount.

	^ isAlreadyReferenced
		ifTrue: [
			DTMemoryTreemapReportObjectReference new
				object: self object;
				reusedReportObject: self ]
		ifFalse: [ ^ self ]
]

{ #category : #accessing }
DTMemoryTreemapReportObject >> children [
	^ Array streamContents: [ :aStream |
		aStream nextPut: objectInstance.
		slotObjects isNotEmpty
			ifTrue: [ aStream nextPut: slotObjects ] ]
]

{ #category : #accessing }
DTMemoryTreemapReportObject >> groups [
	^ { objectInstance . slotObjects }
]

{ #category : #accessing }
DTMemoryTreemapReportObject >> increaseReferenceCount [
	sharedCount := sharedCount + 1
]

{ #category : #initialization }
DTMemoryTreemapReportObject >> initialize [
	super initialize.

	slotObjects := DTMemoryTreemapReportSlotObjects new.
	sharedCount := 0
]

{ #category : #testing }
DTMemoryTreemapReportObject >> isAlreadyReferenced [
	^ sharedCount > 0
]

{ #category : #accessing }
DTMemoryTreemapReportObject >> leaves [
	^ {  }
]

{ #category : #accessing }
DTMemoryTreemapReportObject >> object [
	^ objectInstance object
]

{ #category : #accessing }
DTMemoryTreemapReportObject >> object: anObject [
	objectInstance := DTMemoryTreemapReportObjectInstance new object: anObject
]

{ #category : #accessing }
DTMemoryTreemapReportObject >> objectInstance [
	^ objectInstance
]

{ #category : #accessing }
DTMemoryTreemapReportObject >> objectSlots [
	^ slotObjects objects
]

{ #category : #printing }
DTMemoryTreemapReportObject >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	aStream print: self object
]

{ #category : #accessing }
DTMemoryTreemapReportObject >> sharedCount [
	^ sharedCount
]

{ #category : #accessing }
DTMemoryTreemapReportObject >> sharedCount: anObject [
	sharedCount := anObject
]

{ #category : #accessing }
DTMemoryTreemapReportObject >> slotObjects: anObject [
	slotObjects := anObject
]

{ #category : #'memory usage' }
DTMemoryTreemapReportObject >> totalSizeInMemory [
	^ objectInstance totalSizeInMemory + slotObjects totalSizeInMemory
]
