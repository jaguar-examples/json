# json

Examples to demonstrate how to implement JSON routes using Jaguar web framework.

## Parsing JSON request

`Context` object provides `bodyAsJson`, `bodyAsJsonMap` and `bodyAsJsonList` methods to deserialize JSON requests into
built-in Dart objects. `convert` parameters of `bodyAsJson` and `bodyAsJsonList` can be further used to convert
built-in Dart object into desired Dart object.

```dart
  server.post('/addition', (Context ctx) async {
    AddInput input = await ctx.bodyAsJson(convert: AddInput.fromMap);
    return input.a + input.b;
  });
```

## Writing JSON response

JSON variants of HTTP methods like `getJson`, `postJson`, `putJson` and `deleteJson` automatically serializes the returned
result into JSON.

```dart
  server.postJson('/all', (Context ctx) async {
    AddInput inp = await ctx.bodyAsJson(convert: AddInput.fromMap);
    return AllResults(addition: inp.a + inp.b, subtraction: inp.a - inp.b);
  });
```
 
In `Controller`s use `GetJson`, `PostJson`, `DeleteJson` and `PutJson` annotations instead.

## Client

The example also includes a client to test run the server.

> $> dart bin/client.dart  
> 25  
> {addition: 25, subtraction: 5}  

## Postman collection

The example also includes a Postman collection to test run the server.
