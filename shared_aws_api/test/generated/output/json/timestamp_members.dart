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

/// Timestamp members
class TimestampMembers {
  final _s.JsonProtocol _protocol;
  TimestampMembers({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'TimestampMembers',
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

  Future<OutputShape> operationName0() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'TimestampMembers.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return OutputShape.fromJson(jsonResponse.body);
  }
}

class OutputShape {
  final TimeContainer? structMember;
  final DateTime? timeArg;
  final DateTime? timeCustom;
  final DateTime? timeFormat;

  OutputShape({
    this.structMember,
    this.timeArg,
    this.timeCustom,
    this.timeFormat,
  });

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      structMember: json['StructMember'] != null
          ? TimeContainer.fromJson(json['StructMember'] as Map<String, dynamic>)
          : null,
      timeArg: timeStampFromJson(json['TimeArg']),
      timeCustom: timeStampFromJson(json['TimeCustom']),
      timeFormat: timeStampFromJson(json['TimeFormat']),
    );
  }
}

class TimeContainer {
  final DateTime? bar;
  final DateTime? foo;

  TimeContainer({
    this.bar,
    this.foo,
  });

  factory TimeContainer.fromJson(Map<String, dynamic> json) {
    return TimeContainer(
      bar: timeStampFromJson(json['bar']),
      foo: timeStampFromJson(json['foo']),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
