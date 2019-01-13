Class {
	#name : #DTMemoryReport,
	#superclass : #Object,
	#instVars : [
		'classGroup'
	],
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #ui }
DTMemoryReport >> gtDetailsByClassFor: aView [
	<gtView>
	^ classGroup gtDetailsListFor: aView
]

{ #category : #ui }
DTMemoryReport >> gtDetailsByPackagesFor: aView [
	<gtView>
	| packagesGroup |
	packagesGroup := DTMemoryReportPackageGroupDetails new report: self.
	classGroup classesDetails do: [ :aClassDetails |
		packagesGroup includeClassDetails: aClassDetails ].
	^ packagesGroup gtDetailsListFor: aView
]

{ #category : #actions }
DTMemoryReport >> includeObject: anObject [
	classGroup includeObject: anObject
]

{ #category : #initialization }
DTMemoryReport >> initialize [ 	
	super initialize.
	classGroup := DTMemoryReportClassGroupDetails new
		report: self.
]

{ #category : #accessing }
DTMemoryReport >> instancesCount [
	^ classGroup instancesCount
]

{ #category : #accessing }
DTMemoryReport >> instancesSize [
	^ classGroup instancesSize
]

{ #category : #printing }
DTMemoryReport >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: '(';
		nextPutAll: ((self instancesSize / 1024) asFloat printShowingDecimalPlaces: 2);
		nextPutAll: 'KB';
		nextPutAll: ' in ', self instancesCount asString, ' objects)'
]
