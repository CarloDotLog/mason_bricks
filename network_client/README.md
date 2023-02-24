# network_client

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

With the network_client brick, you can generate a fully functional network client with ease - no fuss, no headaches.
Say goodbye to the tedious process of writing boilerplate code for network clients in your Dart/Flutter projects. 

Built using the `http` package, the network_client brick provides a reliable and efficient solution for streamlining your API requests and responses. 
Plus, this brick also generates the test files that cover 100% files of the network_client.

You have the flexibility to generate your network client code anywhere in your codebase, the choice is your.
Only one command to generate your network client and test file, and start building! It's that easy.

## Usage 🚀

```sh
 mason make network_client
```

## Output 📦

Generated `network` folder:

    .
    ├── network
    │   ├── errors
    │   │   └── http_error.dart
    │   ├── network_client.dart
    │   └── network_client_impl.dart
    └── ...

This brick also generates the test classes under the `test` folder.

    test
    ├── commons
    │   └── network
    │       ├── errors
    │       │   └── http_error_test.dart
    │       └── network_client_test.dart
    └── ...

[1]: https://github.com/felangel/mason
