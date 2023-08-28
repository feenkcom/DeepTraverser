Class {
	#name : #BaselineOfDeepTraverserUI,
	#superclass : #BaselineOf,
	#category : #BaselineOfDeepTraverserUI
}

{ #category : #baseline }
BaselineOfDeepTraverserUI >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'DeepTraverser' with: [
				spec repository: 'github://feenkcom/DeepTraverser:main/src' ].
		spec baseline: 'GToolkitVisualizer' with: [
				spec repository: 'github://feenkcom/gtoolkit-visualizer:main/src' ].
		spec 
			package: 'DeepTraverser-UI' with: [
				spec requires: #('DeepTraverser' 'GToolkitVisualizer' ). ] ].

]
