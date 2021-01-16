Class {
	#name : #DTMemoryReportClassGroupDetails,
	#superclass : #DTMemoryReportGroupDetails,
	#category : #'DeepTraverser-MemoryTraversal-Group'
}

{ #category : #accessing }
DTMemoryReportClassGroupDetails >> classesDetails [
	^ self entitiesDetails
]

{ #category : #ui }
DTMemoryReportClassGroupDetails >> gtDetailsListName [
	^ 'Classes' 
]

{ #category : #actions }
DTMemoryReportClassGroupDetails >> includeObject: anObject [
	| classDetails |
	classDetails := self classesDetails
		at: anObject class name 
		ifAbsentPut: [ DTMemoryReportClassDetails new 
			report: self report;
			name: anObject class name ].
	classDetails includeObject: anObject.
	
	"Maintain also a local cache with the total details from all classes."
	instancesCount := instancesCount + 1.
	instancesSize := instancesSize + anObject sizeInMemory.
]
