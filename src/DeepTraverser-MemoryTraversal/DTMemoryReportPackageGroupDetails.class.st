Class {
	#name : #DTMemoryReportPackageGroupDetails,
	#superclass : #DTMemoryReportGroupDetails,
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #ui }
DTMemoryReportPackageGroupDetails >> gtDetailsListName [
	^ 'Packages' 
]

{ #category : #actions }
DTMemoryReportPackageGroupDetails >> includeClassDetails: classDetails [
	| packageDetails |
	packageDetails := self packagesDetails 
		at: classDetails package name 
		ifAbsentPut: [ DTMemoryReportPackageDetails new
			report: self report;
			packageName: classDetails package name ].
	packageDetails includeClassDetails: classDetails.
	
	"Maintain also a local cache with the total details from all packages."
	instancesCount := instancesCount + classDetails instancesCount.
	instancesSize := instancesSize + classDetails instancesSize.
]

{ #category : #accessing }
DTMemoryReportPackageGroupDetails >> packagesDetails [
	^ self entitiesDetails
]
