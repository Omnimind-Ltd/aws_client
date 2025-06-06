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

/// Timestamp shapes
class TimestampShapes {
  final _s.RestXmlProtocol _protocol;
  TimestampShapes({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'TimestampShapes',
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
    DateTime? timeArg,
    DateTime? timeArgInHeader,
    DateTime? timeArgInQuery,
    DateTime? timeCustom,
    DateTime? timeCustomInHeader,
    DateTime? timeCustomInQuery,
    DateTime? timeFormat,
    DateTime? timeFormatInHeader,
    DateTime? timeFormatInQuery,
  }) async {
    final headers = <String, String>{
      if (timeArgInHeader != null)
        'x-amz-timearg': _s.rfc822ToJson(timeArgInHeader),
      if (timeCustomInHeader != null)
        'x-amz-timecustom-header':
            _s.unixTimestampToJson(timeCustomInHeader).toString(),
      if (timeFormatInHeader != null)
        'x-amz-timeformat-header':
            _s.unixTimestampToJson(timeFormatInHeader).toString(),
    };
    final $query = <String, List<String>>{
      if (timeArgInQuery != null)
        'TimeQuery': [_s.iso8601ToJson(timeArgInQuery).toString()],
      if (timeCustomInQuery != null)
        'TimeCustomQuery': [
          _s.unixTimestampToJson(timeCustomInQuery).toString().toString()
        ],
      if (timeFormatInQuery != null)
        'TimeFormatQuery': [
          _s.unixTimestampToJson(timeFormatInQuery).toString().toString()
        ],
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/2014-01-01/hostedzone',
      queryParams: $query,
      headers: headers,
      payload: InputShape(
              timeArg: timeArg,
              timeArgInHeader: timeArgInHeader,
              timeArgInQuery: timeArgInQuery,
              timeCustom: timeCustom,
              timeCustomInHeader: timeCustomInHeader,
              timeCustomInQuery: timeCustomInQuery,
              timeFormat: timeFormat,
              timeFormatInHeader: timeFormatInHeader,
              timeFormatInQuery: timeFormatInQuery)
          .toXml(
        'TimestampStructure',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'), 'https://foo/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }
}

class InputShape {
  final DateTime? timeArg;
  final DateTime? timeArgInHeader;
  final DateTime? timeArgInQuery;
  final DateTime? timeCustom;
  final DateTime? timeCustomInHeader;
  final DateTime? timeCustomInQuery;
  final DateTime? timeFormat;
  final DateTime? timeFormatInHeader;
  final DateTime? timeFormatInQuery;

  InputShape({
    this.timeArg,
    this.timeArgInHeader,
    this.timeArgInQuery,
    this.timeCustom,
    this.timeCustomInHeader,
    this.timeCustomInQuery,
    this.timeFormat,
    this.timeFormatInHeader,
    this.timeFormatInQuery,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final timeArg = this.timeArg;
    final timeArgInHeader = this.timeArgInHeader;
    final timeArgInQuery = this.timeArgInQuery;
    final timeCustom = this.timeCustom;
    final timeCustomInHeader = this.timeCustomInHeader;
    final timeCustomInQuery = this.timeCustomInQuery;
    final timeFormat = this.timeFormat;
    final timeFormatInHeader = this.timeFormatInHeader;
    final timeFormatInQuery = this.timeFormatInQuery;
    final $children = <_s.XmlNode>[
      if (timeArg != null) _s.encodeXmlDateTimeValue('TimeArg', timeArg),
      if (timeCustom != null)
        _s.encodeXmlDateTimeValue('TimeCustom', timeCustom,
            formatter: _s.rfc822ToJson),
      if (timeFormat != null)
        _s.encodeXmlDateTimeValue('TimeFormat', timeFormat,
            formatter: _s.rfc822ToJson),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
