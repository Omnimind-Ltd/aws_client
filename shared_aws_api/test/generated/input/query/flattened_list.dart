// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Flattened list
class FlattenedList {
  final _s.QueryProtocol _protocol;

  FlattenedList({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'FlattenedList',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  Future<void> operationName0({
    List<String>? listArg,
    List<String>? namedListArg,
    String? scalarArg,
  }) async {
    final $request = <String, String>{
      if (listArg != null)
        if (listArg.isEmpty)
          'ListArg': ''
        else
          for (var i1 = 0; i1 < listArg.length; i1++)
            'ListArg.${i1 + 1}': listArg[i1],
      if (namedListArg != null)
        if (namedListArg.isEmpty)
          'NamedListArg': ''
        else
          for (var i1 = 0; i1 < namedListArg.length; i1++)
            'Foo.${i1 + 1}': namedListArg[i1],
      if (scalarArg != null) 'ScalarArg': scalarArg,
    };
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    List<String>? listArg,
    List<String>? namedListArg,
    String? scalarArg,
  }) async {
    final $request = <String, String>{
      if (listArg != null)
        if (listArg.isEmpty)
          'ListArg': ''
        else
          for (var i1 = 0; i1 < listArg.length; i1++)
            'ListArg.${i1 + 1}': listArg[i1],
      if (namedListArg != null)
        if (namedListArg.isEmpty)
          'NamedListArg': ''
        else
          for (var i1 = 0; i1 < namedListArg.length; i1++)
            'Foo.${i1 + 1}': namedListArg[i1],
      if (scalarArg != null) 'ScalarArg': scalarArg,
    };
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
