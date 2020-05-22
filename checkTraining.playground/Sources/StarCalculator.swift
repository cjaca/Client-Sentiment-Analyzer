//
// StarCalculator.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
public class StarCalculatorInput : MLFeatureProvider {

    /// Input text as string value
    var text: String

    public var featureNames: Set<String> {
        get {
            return ["text"]
        }
    }
    
    public func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "text") {
            return MLFeatureValue(string: text)
        }
        return nil
    }
    
    init(text: String) {
        self.text = text
    }
}

/// Model Prediction Output Type
@available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
public class StarCalculatorOutput : MLFeatureProvider {

    /// Source provided by CoreML

    private let provider : MLFeatureProvider


    /// Text label as string value
    public lazy var label: String = {
        [unowned self] in return self.provider.featureValue(for: "label")!.stringValue
    }()

    public var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    public func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }

    public init(label: String) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["label" : MLFeatureValue(string: label)])
    }

    public init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
public class StarCalculator {
    var model: MLModel

/// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: StarCalculator.self)
        return bundle.url(forResource: "StarCalculator", withExtension:"mlmodelc")!
    }

    /**
        Construct a model with explicit path to mlmodelc file
        - parameters:
           - url: the file url of the model
           - throws: an NSError object that describes the problem
    */
    public init(contentsOf url: URL) throws {
        self.model = try MLModel(contentsOf: url)
    }

    /// Construct a model that automatically loads the model from the app's bundle
    public convenience init() {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }

    /**
        Construct a model with configuration
        - parameters:
           - configuration: the desired model configuration
           - throws: an NSError object that describes the problem
    */
    public convenience init(configuration: MLModelConfiguration) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct a model with explicit path to mlmodelc file and configuration
        - parameters:
           - url: the file url of the model
           - configuration: the desired model configuration
           - throws: an NSError object that describes the problem
    */
    public init(contentsOf url: URL, configuration: MLModelConfiguration) throws {
        self.model = try MLModel(contentsOf: url, configuration: configuration)
    }

    /**
        Make a prediction using the structured interface
        - parameters:
           - input: the input to the prediction as StarCalculatorInput
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as StarCalculatorOutput
    */
    public func prediction(input: StarCalculatorInput) throws -> StarCalculatorOutput {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface
        - parameters:
           - input: the input to the prediction as StarCalculatorInput
           - options: prediction options
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as StarCalculatorOutput
    */
    public func prediction(input: StarCalculatorInput, options: MLPredictionOptions) throws -> StarCalculatorOutput {
        let outFeatures = try model.prediction(from: input, options:options)
        return StarCalculatorOutput(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface
        - parameters:
            - text: Input text as string value
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as StarCalculatorOutput
    */
    public func prediction(text: String) throws -> StarCalculatorOutput {
        let input_ = StarCalculatorInput(text: text)
        return try self.prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface
        - parameters:
           - inputs: the inputs to the prediction as [StarCalculatorInput]
           - options: prediction options
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as [StarCalculatorOutput]
    */
    public func predictions(inputs: [StarCalculatorInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [StarCalculatorOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [StarCalculatorOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  StarCalculatorOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
