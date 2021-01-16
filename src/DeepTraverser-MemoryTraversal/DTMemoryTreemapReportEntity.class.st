Class {
	#name : #DTMemoryTreemapReportEntity,
	#superclass : #Object,
	#category : #'DeepTraverser-MemoryTraversal-Treemap'
}

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
DTMemoryTreemapReportEntity >> isImmediate [
	self object class isImmediateClass
		ifTrue: [ ^ true ].
		
	self object == nil
		ifTrue: [ ^ true ].
		
	^ false
]

{ #category : #testing }
DTMemoryTreemapReportEntity >> isObjectHeader [
	^ false
]

{ #category : #testing }
DTMemoryTreemapReportEntity >> isOccupiedBySlot [
	^ false
]

{ #category : #accessing }
DTMemoryTreemapReportEntity >> leaves [
	^ self subclassResponsibility
]

{ #category : #accessing }
DTMemoryTreemapReportEntity >> totalSizeInMemory [
	^ self subclassResponsibility
]
