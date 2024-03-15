"
Baseline to load the project DeepTraverser
"
Class {
	#name : #BaselineOfDeepTraverser,
	#superclass : #BaselineOf,
	#category : #BaselineOfDeepTraverser
}

{ #category : #baseline }
BaselineOfDeepTraverser class >> gtDependencyAnalysisPreloadedBaselines [
	"For extension to TGtGroup"

	^ super gtDependencyAnalysisPreloadedBaselines
		copyWith: BaselineOfGToolkitFileUtility
]

{ #category : #baseline }
BaselineOfDeepTraverser >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'GToolkitExamplesEngine' with: [
				spec repository: 'github://feenkcom/gtoolkit-examples:main/src' ].
		spec 
			package: 'DeepTraverser';
			package: 'DeepTraverser-MemoryTraversal' with: [
				spec requires: #('DeepTraverser' ). ];
			package: 'DeepTraverser-Examples' with: [
				spec requires: #('DeepTraverser' 'GToolkitExamplesEngine' ). ];
			package: 'DeepTraverser-Tests' with: [
				spec requires: #('DeepTraverser' ). ]. ].

]
