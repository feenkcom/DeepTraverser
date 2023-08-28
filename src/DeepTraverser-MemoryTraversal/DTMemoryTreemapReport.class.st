Class {
	#name : #DTMemoryTreemapReport,
	#superclass : #Object,
	#instVars : [
		'object',
		'visitedObjects'
	],
	#category : #'DeepTraverser-MemoryTraversal-Treemap'
}

{ #category : #'gt-extension' }
DTMemoryTreemapReport >> gtTreeFor: aView [
	<gtView>

	^ aView forward
		title: 'Tree';
		priority: 6;
		object: [ self root ];
		view: #gtTreeFor:
]

{ #category : #'memory report' }
DTMemoryTreemapReport >> includeFromObject: aFromObject to: aToObject [
	| aSlotObject |

	aSlotObject := visitedObjects at: aToObject.
	(visitedObjects at: aFromObject) addSlotObject: aSlotObject asObjectReference
]

{ #category : #'memory report' }
DTMemoryTreemapReport >> includeObject: anObject [
	| aReportObject |

	aReportObject := DTMemoryTreemapReportObject new object: anObject.
	visitedObjects at: anObject put: aReportObject.
	object ifNil: [ object := aReportObject increaseReferenceCount ]
]

{ #category : #initialization }
DTMemoryTreemapReport >> initialize [
	super initialize.
	
	visitedObjects := OrderedIdentityDictionary new
]

{ #category : #accessing }
DTMemoryTreemapReport >> root [
	<return: #DTMemoryTreemapReportObject>

	^ object
]

{ #category : #accessing }
DTMemoryTreemapReport >> root: aReportObject [
	object := aReportObject
]
