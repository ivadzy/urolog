#  Urolog

Urolog is a true object-oriented logging framework for iOS and MacOS platforms.
Also Urolog is the simplest and easy to extend solution.**Elegant Objects** principles 
are respected here. 

The framework support console and file logging, you can define your own endpoints easily.

The project is insiperd by [LogKit](https://github.com/logkit/logkit)

```
Urolog(
    endpoints: [ConsoleEndpoint(format: DetailedFormat())]
)
```

More complex example with multiple endpoints:
```
let file = LogFileAtPath(logFileURL)

if let fileEndpoint = 
    try? AsyncFileEndpoint(
        format: DetailedFormat()
        , file: file
    )
{
    Urolog(
        endpoints: 
            [
                ConsoleEndpoint(format: DetailedFormat())
                , fileEndpoint
            ]
    )
}
```

## TODO

- [ ] DispatchQueue abstraction
- [ ] Flush 
- [ ] Rotating endpoint
- [ ] Support sending logs via email

