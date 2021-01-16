Class {
	#name : #DTMemoryGroupReport,
	#superclass : #Object,
	#instVars : [
		'classGroup'
	],
	#category : #'DeepTraverser-MemoryTraversal-Group'
}

{ #category : #ui }
DTMemoryGroupReport >> gtDetailsByClassFor: aView [
	<gtView>
	^ (classGroup gtDetailsListFor: aView)
		priority: 5
]

{ #category : #ui }
DTMemoryGroupReport >> gtDetailsByPackagesFor: aView [
	<gtView>
	| packagesGroup |
	packagesGroup := DTMemoryReportPackageGroupDetails new report: self.
	classGroup classesDetails do: [ :aClassDetails |
		packagesGroup includeClassDetails: aClassDetails ].
	^ (packagesGroup gtDetailsListFor: aView)
		priority: 10
]

{ #category : #actions }
DTMemoryGroupReport >> includeObject: anObject [
	classGroup includeObject: anObject
]

{ #category : #initialization }
DTMemoryGroupReport >> initialize [ 	
	super initialize.
	classGroup := DTMemoryReportClassGroupDetails new
		report: self.
]

{ #category : #accessing }
DTMemoryGroupReport >> instancesCount [
	^ classGroup instancesCount
]

{ #category : #accessing }
DTMemoryGroupReport >> instancesSize [
	^ classGroup instancesSize
]

{ #category : #printing }
DTMemoryGroupReport >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: '(';
		nextPutAll: ((self instancesSize / 1024) asFloat printShowingDecimalPlaces: 2);
		nextPutAll: 'KB';
		nextPutAll: ' in ', self instancesCount asString, ' objects)'
]
