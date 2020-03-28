Urolog is a true object-oriented logging framework for iOS and MacOS platforms.
Urolog is simple and an easy to extend solution.[Elegant Objects](https://www.elegantobjects.org/) 
principles 
are respected here. 

The framework support console and file logging, you can define your own endpoints too.

The project is insiperd by [LogKit](https://github.com/logkit/logkit)

```
Urolog(
    endpoints: [EndConsole()]
)
```

More complex example with multiple endpoints:
```
let file = LogFileAtPath(logFileURL)
let fileEndpoint = try! EndAsyncFile(file: file)
fileEndpoint.preferredFormat = FmtDetailed()

Urolog(endpoints: 
    [
        ConsoleEndpoint()
        , fileEndpoint
    ]
)

```

## TODO

- [ ] DispatchQueue abstraction
- [ ] Flush 
- [ ] Rotating endpoint
- [ ] Support collecting logs via email

