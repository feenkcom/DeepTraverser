Class {
	#name : #DTMemoryTreemapReportEntity,
	#superclass : #Object,
	#category : #'DeepTraverser-MemoryTraversal-Treemap'
}

{ #category : #testing }
DTMemoryTreemapReportEntity class >> isImmediateObject: anObject [
	anObject class isImmediateClass
		ifTrue: [ ^ true ].
		
	anObject == nil
		ifTrue: [ ^ true ].
		
	^ false
]

{ #category : #testing }
DTMemoryTreemapReportEntity class >> isUniqueInstanceObject: anObject [
	((anObject class respondsTo: #uniqueInstance)
		and: [ anObject == anObject class uniqueInstance ])
			ifTrue: [ ^ true ].
			
	^ false
]

{ #category : #accessing }
DTMemoryTreemapReportEntity >> children [
	^ self subclassResponsibility
]

{ #category : #accessing }
DTMemoryTreemapReportEntity >> groups [
	^ self subclassResponsibility
]

{ #category : #'gt-extension' }
DTMemoryTreemapReportEntity >> gtTreeFor: aView [
	<gtView> 
	^ aView tree
		title: 'Tree';
		priority: 5;
		items: [ { self } ];
		children: #children;
		itemText: [ :each | each printString, ' (', each totalSizeInMemory asString, ' bytes)' ];
		expandUpTo: 3
]

{ #category : #testing }
DTMemoryTreemapReportEntity >> isObjectHeader [
	^ false
]

{ #category : #testing }
DTMemoryTreemapReportEntity >> isOccupiedBySlot [
	^ false
]

{ #category : #testing }
DTMemoryTreemapReportEntity >> isUniqueInstance [
	^ false
]

{ #category : #accessing }
DTMemoryTreemapReportEntity >> leaves [
	^ self subclassResponsibility
]

{ #category : #accessing }
DTMemoryTreemapReportEntity >> object [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
DTMemoryTreemapReportEntity >> objectClassName [
	^ self object class name
]

{ #category : #accessing }
DTMemoryTreemapReportEntity >> totalSizeInMemory [
	^ self subclassResponsibility
]
