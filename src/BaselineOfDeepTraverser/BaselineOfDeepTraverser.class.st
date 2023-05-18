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
		spec
			baseline: 'GToolkitExamplesEngine' with: [
				spec repository: 'github://feenkcom/gtoolkit-examples:v0.8.74/src' ].

		spec package: 'DeepTraverser'.
		spec package: 'DeepTraverser-MemoryTraversal' with: [
			spec requires: #('DeepTraverser') ].
		spec package: 'DeepTraverser-Examples' with: [
			spec requires: #('DeepTraverser' 'GToolkitExamplesEngine') ].
		spec package: 'DeepTraverser-Tests' with: [
			spec requires: #('DeepTraverser') ].
	]
]
