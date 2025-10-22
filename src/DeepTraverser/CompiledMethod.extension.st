Extension { #name : #CompiledMethod }

{ #category : #'*DeepTraverser' }
CompiledMethod >> deep: aTraversalBlock do: anObjectActionBlock [
	"traverses all objects starting with the receiver using aTraversalBlock, and
	for each triggers anObjectActionBlock.
	
	For example:
	Number
		deep: #subclasses 
		do: [:each | Transcript show: each; cr]"
	
	(DeepTraverserWithoutEdges new 
		onNodeTraverse: aTraversalBlock;
		onNodeAction: anObjectActionBlock;
		on: self startWithout: self;
		yourself) run
]

{ #category : #'*DeepTraverser' }
CompiledMethod >> dtTraverseStartUsing: aStream [
	aStream traverseStart: self
]

{ #category : #'*DeepTraverser' }
CompiledMethod >> dtTraverseUsing: aStream [
	aStream traverse: self
]
