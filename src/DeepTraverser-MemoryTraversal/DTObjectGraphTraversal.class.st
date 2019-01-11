Class {
	#name : #DTObjectGraphTraversal,
	#superclass : #DeepTraverserRaw,
	#instVars : [
		'filters',
		'onStateTraverse'
	],
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #accessing }
DTObjectGraphTraversal >> filters [
	^ filters
]

{ #category : #accessing }
DTObjectGraphTraversal >> filters: aCollection [
	filters := aCollection
]

{ #category : #initialization }
DTObjectGraphTraversal >> initialize [
	super initialize.
	filters := OrderedCollection new.
	onStateTraverse := [ :anObject | self stateToVisitForObject: anObject ].
	onNodeTraverse := [ :anObject |
		(self onStateTraverse value: anObject) reject: [ :relatedObject |
			(self filters anySatisfy: [ :aFilter | aFilter matches: relatedObject ]) ] ].
]

{ #category : #memory }
DTObjectGraphTraversal >> memoryForObject: targetObject [
	| memorySize |
	memorySize := 0.
	self 
		onNodeAction: [ :anObject |
			memorySize := memorySize + anObject sizeInMemory ];
		on: targetObject startWith: targetObject.
	self run.
	^ memorySize
]

{ #category : #accessing }
DTObjectGraphTraversal >> onStateTraverse [
	^ onStateTraverse
]

{ #category : #accessing }
DTObjectGraphTraversal >> onStateTraverse: aBloc [
	onStateTraverse := aBloc
]

{ #category : #filtering }
DTObjectGraphTraversal >> skipBehavious [
	filters add: (DTObjectTraversalBehaviourFilter new)
]

{ #category : #filtering }
DTObjectGraphTraversal >> skipGlobals [
	filters add: (DTObjectTraversalGlobalObjectFilter new)
]

{ #category : #filtering }
DTObjectGraphTraversal >> skipInstances: instances [
	filters add: (DTObjectTraversalInstancesFilter new
		instances: instances)
]

{ #category : #filtering }
DTObjectGraphTraversal >> skipMatching: aBlock [
	filters add: (DTObjectTraversalBlocFilter new block: aBlock)
]

{ #category : #filtering }
DTObjectGraphTraversal >> skipMethods [
	filters add: (DTObjectTraversalMethodEntitiesFilter new)
]

{ #category : #filtering }
DTObjectGraphTraversal >> skipSymbols [
	self skipMatching: [ :anObject | anObject isSymbol ]
]

{ #category : #filtering }
DTObjectGraphTraversal >> skipTypes: classes [
	filters add: (DTObjectTraversalInstanceTypesFilter new
		classes: classes)
]

{ #category : #'as yet unclassified' }
DTObjectGraphTraversal >> stateToVisitForObject: anObject [
	^ (anObject class allSlots 
		collect: [ :aSlot |
			aSlot read: anObject ]), 
		((1 to: anObject basicSize) collect: [ :index |
			anObject at: index ])
]
