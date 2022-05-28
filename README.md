# HI Packages

The purpose of this repository is to provide reusable components for Swift. These components come in the form of Classes, Extensions, and Protocols.

# Classes  
`ConfettiView`: Provides a confetti effect to be added to your views.

`DynamicTableViewDataSource`: Allows you to pass in cell proxy objects to an instance of this class and load all of the Table View cells in your projects using one common class.

`PaddingButton`: Provides a UIButton subclass with optional padding around the button label title.

`PaddingLabel`: Provides a UILabel subclass with optional padding around the label.

`StrokeLabel`: Provides a UILabel subclass with stroke around the letters. 


# Extensions
`BinaryInteger`: Provides helper methods for even and odd numbers.

`BundleExtension`: Provides helper methods for accessing app `versionNumber` and `buildNumber`

`CGFloatExtension`: Provides a static var for `statusBarHeight`. This is especially helpful when you need to draw a view under the status bar for an iPhone with and without the notch.

`CollectionExtension`: Provides a safer way to call subscript on a collection.

`DataExtension`: Provides a helper property to convert data to hex string.

`DateExtension`: Provides several helper methods for calculating seconds, minutes, hours, days, weeks, months, years from a given date. It also provides a date formatter with a list of enumerations to choose from. 

`DoubleExtension`: Provides a helper method to format a number into different styles. 

`IntExtension`: Provides a helper method to convert an Integer into a string with comma for the grouping separator. For example, the grouping separator used in the United States is the comma (“10,000”) whereas in France it is the space (“10 000”).

`NSLayoutConstraintExtension`: Provides a helper method to provide the constraint multiplier.

`SequenceExtension`: Provides three important helper methods:
    1. group by: creates an array of items grouped by the provided key.
    2. limit: allows to retrieve the first n items in the Sequence.
    3. unique: eliminates duplicate items without altering the order of the sequence.

`SKStoreReviewController`: Provides a helper method to request review for the app.

`StringExtension`: Provides several helper variables and methods. 
    1. Converting a string to Bool, Double, Int, etc.
    
    2. Returning numbers only, or letters only, or both from a string.
    
    3. Localizing a string, optionally with a language code.
    
    4. Converting a string to a Date if possible.
    
    5. Checking if a string has only numbers.
    
    6. Generating a UUID.
    
    7. Checking if a string has only letters.

`UIAlertControllerExtension`: Provides a helper to add multiple actions instead of one at a time.

`UIColorExtension`: Provides helper methods to convert a hex or a string value to a color.

`UIDeviceExtension`: Provides helper variables and methods such as `modelName`, `hasNotch`, `vibrate the device`, and `play haptics`.

`UILabelExtension`: Provides methods to highlight text as well as setting up a custom font and style.
