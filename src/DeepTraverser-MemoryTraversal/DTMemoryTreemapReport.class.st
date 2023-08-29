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

{ #category : #'gt-extension' }
DTMemoryTreemapReport >> gtTreemapFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Treemap';
		priority: 5;
		stencil: [
		GtNestedRectangleTreeMap new
			root: self root;
			leaves: [ :anObject | anObject leaves ];
			leavesSize: [ :anObject | anObject totalSizeInMemory ];
			deep: [ :anObject | anObject groups ];
			containerElement: [ :anElement :aNodeContext | 
				anElement padding: BlInsets empty.
				anElement margin: BlInsets empty.
				anElement border: BlBorder empty.

				anElement border: (BlBorder paint: (Color gray alpha: 0.7 / aNodeContext level) width: 1).

				aNodeContext model isUniqueInstance
					ifTrue: [ anElement background: (Color green alpha: 0.3) ].
				
				(aNodeContext level = 3 or: [ aNodeContext model isUniqueInstance ]) ifTrue: [
						anElement border: (BlBorder paint: Color gray width: 1).
						anElement addChild: (BrLabel new
							zIndex: 10;
							beTinySize;
							text: (aNodeContext model objectClassName); 
							aptitude: (BrGlamorousLabelAptitude new foreground: Color darkGray); 
							constraintsDo: [ :c | c ignoreByLayout. ];
							when: BlClickEvent do: [ :anEvent |
								anEvent consumed: true.
								anEvent currentTarget phlow spawnObject: aNodeContext model ])] ];
			leafElement: [ :anElement :aLeafContext | 
				anElement background: (Color blue alpha: 0.2).
				anElement padding: BlInsets empty.
				anElement margin: BlInsets empty.
			
				aLeafContext model isOccupiedBySlot
					ifTrue: [
						anElement addChild: (BrLabel new 
							beTinySize;
							text: (aLeafContext  model name printString); 
							aptitude: (BrGlamorousLabelAptitude new foreground: Color gray); 
							constraintsDo: [ :c |
								c ignoreByLayout.
								c ignored horizontal alignCenter.
								c ignored vertical alignCenter ])].
				aLeafContext model isObjectHeader
					ifTrue: [
						anElement background: (Color gray alpha: 0.2).
						anElement addChild: (BrLabel new
							beTinySize;
							text: 'Header'; 
							aptitude: (BrGlamorousLabelAptitude new foreground: Color gray); 
							constraintsDo: [ :c |
								c ignoreByLayout.
								c ignored horizontal alignCenter.
								c ignored vertical alignCenter ])] ]
				]
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
