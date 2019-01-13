Class {
	#name : #DTMemoryReportPackageDetails,
	#superclass : #DTMemoryReportGroupDetails,
	#instVars : [
		'packageName'
	],
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #accessing }
DTMemoryReportPackageDetails >> classesDetails [
	^ self entitiesDetails
]

{ #category : #ui }
DTMemoryReportPackageDetails >> gtDetailsListName [
	^ 'Classes' 
]

{ #category : #actions }
DTMemoryReportPackageDetails >> includeClassDetails: classDetails [
	self classesDetails at: classDetails name put: classDetails.
	
	instancesCount := instancesCount + classDetails instancesCount.
	instancesSize := instancesSize + classDetails instancesSize.
]

{ #category : #accessing }
DTMemoryReportPackageDetails >> name [
	^ self packageName
]

{ #category : #accessing }
DTMemoryReportPackageDetails >> packageName [
	^ packageName
]

{ #category : #accessing }
DTMemoryReportPackageDetails >> packageName: aString [
	packageName := aString
]
