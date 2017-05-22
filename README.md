### Value Models

Value models are a concept pioneered in the VisualWorks Smalltalk environment. They are a fantastic mechanism for managing the
complexity of dependence, particularly when working with GUI controls that depend on aspects of an underlying model. They also
do exceptionally well in simplifying the complexities inherent in asynchronous programming 
( particularly if one implements them using DispatchQueues - which this simple implementation does not ).

When I was first exposed to them in VisualWorks they baffled me, but once I figured out how they
worked I was completely enamoured by them. The way they were implemented in Smalltalk 80 translates very well into the
Objective C environment and I have used them in countless macOS and iOS projects, where they literally shaved weeks off
project implementation timelines. One of my colleagues on a particular project even confided in me saying, 
*"we'd never have pulled this off without value models"*. Unfortunately the current limitations of the 
Swift generics system ( specifically the limitations around existentials ) make value models difficult, if not 
impossible, to implement in a generic fashion in Swift ( I can assure you it's
not through lack of trying ). I'm hoping that extensions to the Swift generics system in Swift 4 or Swift 5 will finally allow
me to implement and use value models in Swift, although I have to admit that reactive programming frameworks go some way
towards solving the same problems that value models do.

If you are interested in learning more about how to use value models, see this article by Bobby Wolfe ( I hope it's still there ):-

[Understanding and Using ValueModels](http://c2.com/ppr/vmodels.html)

Enjoy.
