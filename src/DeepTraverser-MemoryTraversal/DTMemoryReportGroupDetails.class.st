Class {
	#name : #DTMemoryReportGroupDetails,
	#superclass : #DTMemoryReportEntityDetails,
	#instVars : [
		'entitiesDetails'
	],
	#category : #'DeepTraverser-MemoryTraversal'
}

{ #category : #accessing }
DTMemoryReportGroupDetails >> entitiesDetails [
	^ entitiesDetails
]

{ #category : #ui }
DTMemoryReportGroupDetails >> gtDetailsListFor: aView [
	<gtView>
	^ aView columnedList 	
		title: self gtDetailsListName;
		priority: 5;
		items: [
			self entitiesDetails
				sorted: [ :detail1 :detail2 | detail1 instancesSize > detail2 instancesSize ] ];
		column: 'Name' format: [ :classDetails | classDetails name ];
		column: 'Size (KB)' format: [ :classDetails | (classDetails instancesSize /1024) asFloat ];
		column: 'Size percent' format: [ :classDetails | ((classDetails sizePercentInReport) asFloat printShowingDecimalPlaces: 2), '%' ];
		column: 'Instance count' format:[ :classDetails | classDetails instancesCount ];
		column: 'Instance percent' format:[ :classDetails | ((classDetails countPercentInReport) asFloat printShowingDecimalPlaces: 2), '%' ]
]

{ #category : #ui }
DTMemoryReportGroupDetails >> gtDetailsListName [
	^ 'Details' 
]

{ #category : #initialization }
DTMemoryReportGroupDetails >> initialize [ 	
	super initialize.
	instancesCount := 0.
	instancesSize := 0.
	entitiesDetails := Dictionary new.
]

{ #category : #accessing }
DTMemoryReportGroupDetails >> instancesCount [
	^ instancesCount
]

{ #category : #accessing }
DTMemoryReportGroupDetails >> instancesSize [
	^ instancesSize
]
