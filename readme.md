## Using Latest tech/tools:-
##### Xcode10
##### Swift 4.2
##### iOS 12


## App can scan/read following types of code:-
- Legacy 1D Symbologies - CodeBar
- Legacy 1D Symbologies - Code 11
- Legacy 1D Symbologies - Code 25
- Legacy 1D Symbologies - MSI Plessey 
- 2D Symbologies - QR Code
- 2D Symbologies - Micro QR Code
- 2D Symbologies - Data Matrix
- 2D Symbologies - PDF417
- 2D Symbologies - PDF417
- 2D Symbologies -MicroPDF417
and [more](https://docs.scandit.com/supported-symbologies.html "more").

## Third party library & SDK
- Scandit SDK (for scanning the codes)
- Alamofire (for handling network request smartly)

## Inspiration for design and flow
- Mishipay iOS App

Note:-
Since You didn't provide any api for fetching product, i used [Barcode Lookup API](https://www.barcodelookup.com/api "Barcode Lookup") (product detail for available here for inetrnational products but very less) for fetching products to showing in product and cart page, it is free for 40 API calls, so after can you generate your API Key from here [Barcode Lookup API](https://www.barcodelookup.com/api "Barcode Lookup")  and can use in the project.
You can change in 

    Project>Configuration>Configuration.swift>API>LookupAPIKey.
