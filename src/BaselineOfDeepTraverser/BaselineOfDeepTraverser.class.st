"
Baseline to load the project DeepTraverser
"
Class {
	#name : #BaselineOfDeepTraverser,
	#superclass : #BaselineOf,
	#category : #BaselineOfDeepTraverser
}

{ #category : #baseline }
BaselineOfDeepTraverser >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'GToolkitExamplesEngine' with: [
				spec repository: 'github://feenkcom/gtoolkit-examples:v0.8.22/src' ].
		spec 
			package: 'DeepTraverser';
			package: 'DeepTraverser-MemoryTraversal' with: [
				spec requires: #('DeepTraverser' ). ];
			package: 'DeepTraverser-Examples' with: [
				spec requires: #('DeepTraverser' 'GToolkitExamplesEngine' ). ];
			package: 'DeepTraverser-Tests' with: [
				spec requires: #('DeepTraverser' ). ]. ].

]
