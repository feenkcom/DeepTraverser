"
I explicitly traverse all objects returned by the traversal logic. My superclass does not explicitly traverse collection objects: when a collection is encountered only the content of the collection is explicitly passed to the traversal logic. The intent of my superclass was to cover only domain objects by transparentely handling collection. However, for some tasks like computing the memory of an object graph, all objects including collections need to be visited. 
"
Class {
	#name : #DeepTraverserRaw,
	#superclass : #DeepTraverser,
	#category : #DeepTraverser
}

{ #category : #private }
DeepTraverserRaw >> doNodeTraverse [
	"I traverse exactly the objects returned by the traversal logic without skipping colection objects."
	
	onNodeTraverse dtRawTraverse: current using: self.
]
