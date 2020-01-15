#  Urolog

* What are responsibilities of a logger?
    *  **Logs message entries(message itself, date, line, file, additional context)** 
    * **Accept different formats and format messages** / **Maps log entries to string**
    * **Decides whether or not to show(add)  a log entry**
    Additional responsibilities
        Manage files
        * Creates log files
        * Dated log files 
        
What is logger?

Keep in mind that in the real life we don't have a thing such as Logger. This is a purely programming notion.
So it's fishy to say it will follow the EO principles. It won't. Actually, a lot of parts in the logger won't adhere EO style, bc
they're pure fakes.



## Names

* Entry
* Format
* Endpoint
* LogController
