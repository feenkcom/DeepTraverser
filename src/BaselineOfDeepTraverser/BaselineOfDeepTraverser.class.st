"
Baseline to load the project DeepTraverser
"
Class {
	#name : #BaselineOfDeepTraverser,
	#superclass : #BaselineOf,
	#category : #BaselineOfDeepTraverser
}

{ #category : #baselines }
BaselineOfDeepTraverser >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				baseline: 'GToolkitExamplesEngine'
				with: [ spec repository: 'github://feenkcom/gtoolkit-examples/src' ].
			
			"Packages"
			spec
				package: 'DeepTraverser';
				package: 'DeepTraverser-Examples' with: [ spec requires: #('DeepTraverser') ];
				package: 'DeepTraverser-Tests' with: [ spec requires: #('DeepTraverser') ].
				
			"Groups"
			spec
				group: 'default' with: #('Core' 'Tests' 'Examples');
				group: 'Core' with: #('DeepTraverser');
				group: 'Examples' with: #('DeepTraverser-Examples');
				group: 'ExamplesWithGTEngine' with: #('Examples' 'GToolkitExamplesEngine');
				group: 'Tests' with: #('DeepTraverser-Tests') ]
]
