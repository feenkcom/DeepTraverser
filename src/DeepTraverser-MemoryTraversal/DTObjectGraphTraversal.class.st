Class {
	#name : #DTObjectGraphTraversal,
	#superclass : #DeepTraverserRaw,
	#instVars : [
		'filters',
		'onStateTraverse'
	],
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #memory }
DTObjectGraphTraversal >> computeMemoryFor: targetObject [
	| memoryReport |
	memoryReport := DTMemoryReport new.
	self 
		onNodeAction: [ :anObject | memoryReport includeObject: anObject ];
		on: targetObject startWith: targetObject.
	self run.
	^ memoryReport
]

{ #category : #memory }
DTObjectGraphTraversal >> computeMemoryForCollection: targetCollection [
	| memorySize |
	memorySize := 0.
	self 
		onNodeAction: [ :anObject |
			memorySize := memorySize + anObject sizeInMemory ];
		on: targetCollection startWith: targetCollection anyOne.
	self run.
	^ memorySize
]

{ #category : #memory }
DTObjectGraphTraversal >> computeMemorySizeFor: targetObject [
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

{ #category : #accessing }
DTObjectGraphTraversal >> onStateTraverse [
	^ onStateTraverse
]

{ #category : #accessing }
DTObjectGraphTraversal >> onStateTraverse: aBloc [
	onStateTraverse := aBloc
]

{ #category : #filtering }
DTObjectGraphTraversal >> skipBehaviors [
	filters add: DTObjectTraversalBehaviorFilter new
]

{ #category : #filtering }
DTObjectGraphTraversal >> skipBooleans [
	filters add: DTObjectTraversalBooleanFilter new
]

{ #category : #'filtering - utils' }
DTObjectGraphTraversal >> skipCodeEntities [
	self
		skipMethods;
		skipBehaviors
]

{ #category : #filtering }
DTObjectGraphTraversal >> skipGlobalColors [
	filters add: DTObjectTraversalGlobalColorsFilter new
]

{ #category : #'filtering - utils' }
DTObjectGraphTraversal >> skipGlobalState [
	self
		skipBooleans;
		skipNil;
		skipGlobals
]

{ #category : #filtering }
DTObjectGraphTraversal >> skipGlobals [
	filters add: (DTObjectTraversalGlobalObjectFilter new)
]

{ #category : #filtering }
DTObjectGraphTraversal >> skipImmediateInstances [
	filters add: DTObjectTraversalImmediateBehavioursFilter new
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
DTObjectGraphTraversal >> skipNil [
	filters add: DTObjectTraversalNilFilter new
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

{ #category : #private }
DTObjectGraphTraversal >> stateToVisitForObject: anObject [
	| startIndex |
	startIndex := (anObject isKindOf: CompiledCode) 
		ifTrue: [ anObject initialPC ] "Indexed variables for ompiled methods start from the initial PC"
		ifFalse: [ 1 ].
	^ (anObject class allSlots 
		collect: [ :aSlot |
			aSlot read: anObject ]), 
		((startIndex to: anObject basicSize) collect: [ :index |
			anObject at: index ])
]

{ #category : #'filtering - utils' }
DTObjectGraphTraversal >> withDefaultFilters [
	self
		skipCodeEntities;
		skipGlobalState;
		skipImmediateInstances
]
