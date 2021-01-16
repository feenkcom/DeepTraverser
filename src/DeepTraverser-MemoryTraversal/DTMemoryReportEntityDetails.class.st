Class {
	#name : #DTMemoryReportEntityDetails,
	#superclass : #Object,
	#instVars : [
		'instancesCount',
		'instancesSize',
		'report'
	],
	#category : #'DeepTraverser-MemoryTraversal-Group'
}

{ #category : #accessing }
DTMemoryReportEntityDetails >> countPercentInReport [
	^ (self instancesCount / self report instancesCount) * 100
]

{ #category : #initialization }
DTMemoryReportEntityDetails >> initialize [
	super initialize.
	instancesCount := 0.
	instancesSize := 0.
]

{ #category : #accessing }
DTMemoryReportEntityDetails >> instancesCount [
	^ instancesCount
]

{ #category : #accessing }
DTMemoryReportEntityDetails >> instancesSize [
	^ instancesSize
]

{ #category : #printing }
DTMemoryReportEntityDetails >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: '(';
		nextPutAll: ((self instancesSize / 1024) asFloat printShowingDecimalPlaces: 2);
		nextPutAll: 'KB';
		nextPutAll: ' in ', self instancesCount asString, ' objects)'
]

{ #category : #accessing }
DTMemoryReportEntityDetails >> report [
	^ report
]

{ #category : #accessing }
DTMemoryReportEntityDetails >> report: aMemoryReport [
	report := aMemoryReport
]

{ #category : #accessing }
DTMemoryReportEntityDetails >> sizePercentInReport [
	^ (self instancesSize / self report instancesSize) * 100
]
