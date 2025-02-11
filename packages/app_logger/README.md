## Features

This package represents logger for application

## Usage
Here is example how to use logger:
1. You need to include package at your `pubspec.yaml` file

```yaml
  taw_logger:
    path: ../taw_logger
```   
2. Now you can freely type any of given logger fuctions to log your message

```
    logger.d('Here is message');
    logger.v('Here is verbose message');
    logger.i('Here is info message');
    logger.w('Here is warning message');
    logger.e('Here is error message');
```

And output look like this:
```
 ┌─────────────────────────────────────────────────
 │ 🐛 Here is message
 └─────────────────────────────────────────────────
 ┌─────────────────────────────────────────────────
 │ Here is verbose message
 └─────────────────────────────────────────────────
 ┌─────────────────────────────────────────────────
 │ 💡 Here is info message
 └─────────────────────────────────────────────────
 ┌─────────────────────────────────────────────────
 │ ⚠️ Here is warning message
 └─────────────────────────────────────────────────
 ┌─────────────────────────────────────────────────
 │ ⛔ Here is error message
 └─────────────────────────────────────────────────
```
