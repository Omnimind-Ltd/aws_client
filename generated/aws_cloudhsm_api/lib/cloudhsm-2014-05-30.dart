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

/// This is documentation for <b>AWS CloudHSM Classic</b>. For more information,
/// see <a href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
/// Classic FAQs</a>, the <a
/// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS CloudHSM
/// Classic User Guide</a>, and the <a
/// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
/// CloudHSM Classic API Reference</a>.
class CloudHSM {
  final _s.JsonProtocol _protocol;
  CloudHSM({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cloudhsm',
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

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Adds or overwrites one or more tags for the specified AWS CloudHSM
  /// resource.
  ///
  /// Each tag consists of a key and a value. Tag keys must be unique to each
  /// resource.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the AWS CloudHSM resource to tag.
  ///
  /// Parameter [tagList] :
  /// One or more tags.
  @Deprecated('This API is deprecated.')
  Future<AddTagsToResourceResponse> addTagsToResource({
    required String resourceArn,
    required List<Tag> tagList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.AddTagsToResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagList': tagList,
      },
    );

    return AddTagsToResourceResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Creates a high-availability partition group. A high-availability partition
  /// group is a group of partitions that spans multiple physical HSMs.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [label] :
  /// The label of the new high-availability partition group.
  @Deprecated('This API is deprecated.')
  Future<CreateHapgResponse> createHapg({
    required String label,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.CreateHapg'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Label': label,
      },
    );

    return CreateHapgResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Creates an uninitialized HSM instance.
  ///
  /// There is an upfront fee charged for each HSM instance that you create with
  /// the <code>CreateHsm</code> operation. If you accidentally provision an HSM
  /// and want to request a refund, delete the instance using the
  /// <a>DeleteHsm</a> operation, go to the <a
  /// href="https://console.aws.amazon.com/support/home">AWS Support Center</a>,
  /// create a new case, and select <b>Account and Billing Support</b>.
  /// <important>
  /// It can take up to 20 minutes to create and provision an HSM. You can
  /// monitor the status of the HSM with the <a>DescribeHsm</a> operation. The
  /// HSM is ready to be initialized when the status changes to
  /// <code>RUNNING</code>.
  /// </important>
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [iamRoleArn] :
  /// The ARN of an IAM role to enable the AWS CloudHSM service to allocate an
  /// ENI on your behalf.
  ///
  /// Parameter [sshKey] :
  /// The SSH public key to install on the HSM.
  ///
  /// Parameter [subnetId] :
  /// The identifier of the subnet in your VPC in which to place the HSM.
  ///
  /// Parameter [clientToken] :
  /// A user-defined token to ensure idempotence. Subsequent calls to this
  /// operation with the same token will be ignored.
  ///
  /// Parameter [eniIp] :
  /// The IP address to assign to the HSM's ENI.
  ///
  /// If an IP address is not specified, an IP address will be randomly chosen
  /// from the CIDR range of the subnet.
  ///
  /// Parameter [externalId] :
  /// The external ID from <code>IamRoleArn</code>, if present.
  ///
  /// Parameter [syslogIp] :
  /// The IP address for the syslog monitoring server. The AWS CloudHSM service
  /// only supports one syslog monitoring server.
  @Deprecated('This API is deprecated.')
  Future<CreateHsmResponse> createHsm({
    required String iamRoleArn,
    required String sshKey,
    required String subnetId,
    required SubscriptionType subscriptionType,
    String? clientToken,
    String? eniIp,
    String? externalId,
    String? syslogIp,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.CreateHsm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IamRoleArn': iamRoleArn,
        'SshKey': sshKey,
        'SubnetId': subnetId,
        'SubscriptionType': subscriptionType.value,
        if (clientToken != null) 'ClientToken': clientToken,
        if (eniIp != null) 'EniIp': eniIp,
        if (externalId != null) 'ExternalId': externalId,
        if (syslogIp != null) 'SyslogIp': syslogIp,
      },
    );

    return CreateHsmResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Creates an HSM client.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [certificate] :
  /// The contents of a Base64-Encoded X.509 v3 certificate to be installed on
  /// the HSMs used by this client.
  ///
  /// Parameter [label] :
  /// The label for the client.
  @Deprecated('This API is deprecated.')
  Future<CreateLunaClientResponse> createLunaClient({
    required String certificate,
    String? label,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.CreateLunaClient'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Certificate': certificate,
        if (label != null) 'Label': label,
      },
    );

    return CreateLunaClientResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Deletes a high-availability partition group.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [hapgArn] :
  /// The ARN of the high-availability partition group to delete.
  @Deprecated('This API is deprecated.')
  Future<DeleteHapgResponse> deleteHapg({
    required String hapgArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.DeleteHapg'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HapgArn': hapgArn,
      },
    );

    return DeleteHapgResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Deletes an HSM. After completion, this operation cannot be undone and your
  /// key material cannot be recovered.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [hsmArn] :
  /// The ARN of the HSM to delete.
  @Deprecated('This API is deprecated.')
  Future<DeleteHsmResponse> deleteHsm({
    required String hsmArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.DeleteHsm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HsmArn': hsmArn,
      },
    );

    return DeleteHsmResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Deletes a client.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clientArn] :
  /// The ARN of the client to delete.
  @Deprecated('This API is deprecated.')
  Future<DeleteLunaClientResponse> deleteLunaClient({
    required String clientArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.DeleteLunaClient'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientArn': clientArn,
      },
    );

    return DeleteLunaClientResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Retrieves information about a high-availability partition group.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [hapgArn] :
  /// The ARN of the high-availability partition group to describe.
  @Deprecated('This API is deprecated.')
  Future<DescribeHapgResponse> describeHapg({
    required String hapgArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.DescribeHapg'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HapgArn': hapgArn,
      },
    );

    return DescribeHapgResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Retrieves information about an HSM. You can identify the HSM by its ARN or
  /// its serial number.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [hsmArn] :
  /// The ARN of the HSM. Either the <code>HsmArn</code> or the
  /// <code>SerialNumber</code> parameter must be specified.
  ///
  /// Parameter [hsmSerialNumber] :
  /// The serial number of the HSM. Either the <code>HsmArn</code> or the
  /// <code>HsmSerialNumber</code> parameter must be specified.
  @Deprecated('This API is deprecated.')
  Future<DescribeHsmResponse> describeHsm({
    String? hsmArn,
    String? hsmSerialNumber,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.DescribeHsm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (hsmArn != null) 'HsmArn': hsmArn,
        if (hsmSerialNumber != null) 'HsmSerialNumber': hsmSerialNumber,
      },
    );

    return DescribeHsmResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Retrieves information about an HSM client.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [certificateFingerprint] :
  /// The certificate fingerprint.
  ///
  /// Parameter [clientArn] :
  /// The ARN of the client.
  @Deprecated('This API is deprecated.')
  Future<DescribeLunaClientResponse> describeLunaClient({
    String? certificateFingerprint,
    String? clientArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.DescribeLunaClient'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (certificateFingerprint != null)
          'CertificateFingerprint': certificateFingerprint,
        if (clientArn != null) 'ClientArn': clientArn,
      },
    );

    return DescribeLunaClientResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Gets the configuration files necessary to connect to all high availability
  /// partition groups the client is associated with.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clientArn] :
  /// The ARN of the client.
  ///
  /// Parameter [clientVersion] :
  /// The client version.
  ///
  /// Parameter [hapgList] :
  /// A list of ARNs that identify the high-availability partition groups that
  /// are associated with the client.
  @Deprecated('This API is deprecated.')
  Future<GetConfigResponse> getConfig({
    required String clientArn,
    required ClientVersion clientVersion,
    required List<String> hapgList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.GetConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientArn': clientArn,
        'ClientVersion': clientVersion.value,
        'HapgList': hapgList,
      },
    );

    return GetConfigResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Lists the Availability Zones that have available AWS CloudHSM capacity.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  @Deprecated('This API is deprecated.')
  Future<ListAvailableZonesResponse> listAvailableZones() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.ListAvailableZones'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return ListAvailableZonesResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Lists the high-availability partition groups for the account.
  ///
  /// This operation supports pagination with the use of the
  /// <code>NextToken</code> member. If more results are available, the
  /// <code>NextToken</code> member of the response contains a token that you
  /// pass in the next call to <code>ListHapgs</code> to retrieve the next set
  /// of items.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [nextToken] :
  /// The <code>NextToken</code> value from a previous call to
  /// <code>ListHapgs</code>. Pass null if this is the first call.
  @Deprecated('This API is deprecated.')
  Future<ListHapgsResponse> listHapgs({
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.ListHapgs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListHapgsResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Retrieves the identifiers of all of the HSMs provisioned for the current
  /// customer.
  ///
  /// This operation supports pagination with the use of the
  /// <code>NextToken</code> member. If more results are available, the
  /// <code>NextToken</code> member of the response contains a token that you
  /// pass in the next call to <code>ListHsms</code> to retrieve the next set of
  /// items.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [nextToken] :
  /// The <code>NextToken</code> value from a previous call to
  /// <code>ListHsms</code>. Pass null if this is the first call.
  @Deprecated('This API is deprecated.')
  Future<ListHsmsResponse> listHsms({
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.ListHsms'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListHsmsResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Lists all of the clients.
  ///
  /// This operation supports pagination with the use of the
  /// <code>NextToken</code> member. If more results are available, the
  /// <code>NextToken</code> member of the response contains a token that you
  /// pass in the next call to <code>ListLunaClients</code> to retrieve the next
  /// set of items.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [nextToken] :
  /// The <code>NextToken</code> value from a previous call to
  /// <code>ListLunaClients</code>. Pass null if this is the first call.
  @Deprecated('This API is deprecated.')
  Future<ListLunaClientsResponse> listLunaClients({
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.ListLunaClients'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListLunaClientsResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Returns a list of all tags for the specified AWS CloudHSM resource.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the AWS CloudHSM resource.
  @Deprecated('This API is deprecated.')
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Modifies an existing high-availability partition group.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [hapgArn] :
  /// The ARN of the high-availability partition group to modify.
  ///
  /// Parameter [label] :
  /// The new label for the high-availability partition group.
  ///
  /// Parameter [partitionSerialList] :
  /// The list of partition serial numbers to make members of the
  /// high-availability partition group.
  @Deprecated('This API is deprecated.')
  Future<ModifyHapgResponse> modifyHapg({
    required String hapgArn,
    String? label,
    List<String>? partitionSerialList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.ModifyHapg'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HapgArn': hapgArn,
        if (label != null) 'Label': label,
        if (partitionSerialList != null)
          'PartitionSerialList': partitionSerialList,
      },
    );

    return ModifyHapgResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Modifies an HSM.
  /// <important>
  /// This operation can result in the HSM being offline for up to 15 minutes
  /// while the AWS CloudHSM service is reconfigured. If you are modifying a
  /// production HSM, you should ensure that your AWS CloudHSM service is
  /// configured for high availability, and consider executing this operation
  /// during a maintenance window.
  /// </important>
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [hsmArn] :
  /// The ARN of the HSM to modify.
  ///
  /// Parameter [eniIp] :
  /// The new IP address for the elastic network interface (ENI) attached to the
  /// HSM.
  ///
  /// If the HSM is moved to a different subnet, and an IP address is not
  /// specified, an IP address will be randomly chosen from the CIDR range of
  /// the new subnet.
  ///
  /// Parameter [externalId] :
  /// The new external ID.
  ///
  /// Parameter [iamRoleArn] :
  /// The new IAM role ARN.
  ///
  /// Parameter [subnetId] :
  /// The new identifier of the subnet that the HSM is in. The new subnet must
  /// be in the same Availability Zone as the current subnet.
  ///
  /// Parameter [syslogIp] :
  /// The new IP address for the syslog monitoring server. The AWS CloudHSM
  /// service only supports one syslog monitoring server.
  @Deprecated('This API is deprecated.')
  Future<ModifyHsmResponse> modifyHsm({
    required String hsmArn,
    String? eniIp,
    String? externalId,
    String? iamRoleArn,
    String? subnetId,
    String? syslogIp,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.ModifyHsm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HsmArn': hsmArn,
        if (eniIp != null) 'EniIp': eniIp,
        if (externalId != null) 'ExternalId': externalId,
        if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
        if (subnetId != null) 'SubnetId': subnetId,
        if (syslogIp != null) 'SyslogIp': syslogIp,
      },
    );

    return ModifyHsmResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Modifies the certificate used by the client.
  ///
  /// This action can potentially start a workflow to install the new
  /// certificate on the client's HSMs.
  ///
  /// May throw [CloudHsmServiceException].
  ///
  /// Parameter [certificate] :
  /// The new certificate for the client.
  ///
  /// Parameter [clientArn] :
  /// The ARN of the client.
  @Deprecated('This API is deprecated.')
  Future<ModifyLunaClientResponse> modifyLunaClient({
    required String certificate,
    required String clientArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.ModifyLunaClient'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Certificate': certificate,
        'ClientArn': clientArn,
      },
    );

    return ModifyLunaClientResponse.fromJson(jsonResponse.body);
  }

  /// This is documentation for <b>AWS CloudHSM Classic</b>. For more
  /// information, see <a
  /// href="http://aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM Classic
  /// FAQs</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
  /// CloudHSM Classic User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS
  /// CloudHSM Classic API Reference</a>.
  ///
  /// <b>For information about the current version of AWS CloudHSM</b>, see <a
  /// href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM</a>, the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM
  /// User Guide</a>, and the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS
  /// CloudHSM API Reference</a>.
  ///
  /// Removes one or more tags from the specified AWS CloudHSM resource.
  ///
  /// To remove a tag, specify only the tag key to remove (not the value). To
  /// overwrite the value for an existing tag, use <a>AddTagsToResource</a>.
  ///
  /// May throw [CloudHsmServiceException].
  /// May throw [CloudHsmInternalException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the AWS CloudHSM resource.
  ///
  /// Parameter [tagKeyList] :
  /// The tag key or keys to remove.
  ///
  /// Specify only the tag key to remove (not the value). To overwrite the value
  /// for an existing tag, use <a>AddTagsToResource</a>.
  @Deprecated('This API is deprecated.')
  Future<RemoveTagsFromResourceResponse> removeTagsFromResource({
    required String resourceArn,
    required List<String> tagKeyList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CloudHsmFrontendService.RemoveTagsFromResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeyList': tagKeyList,
      },
    );

    return RemoveTagsFromResourceResponse.fromJson(jsonResponse.body);
  }
}

class AddTagsToResourceResponse {
  /// The status of the operation.
  final String status;

  AddTagsToResourceResponse({
    required this.status,
  });

  factory AddTagsToResourceResponse.fromJson(Map<String, dynamic> json) {
    return AddTagsToResourceResponse(
      status: json['Status'] as String,
    );
  }
}

enum ClientVersion {
  $5_1('5.1'),
  $5_3('5.3'),
  ;

  final String value;

  const ClientVersion(this.value);

  static ClientVersion fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ClientVersion'));
}

enum CloudHsmObjectState {
  ready('READY'),
  updating('UPDATING'),
  degraded('DEGRADED'),
  ;

  final String value;

  const CloudHsmObjectState(this.value);

  static CloudHsmObjectState fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum CloudHsmObjectState'));
}

/// Contains the output of the <a>CreateHAPartitionGroup</a> action.
class CreateHapgResponse {
  /// The ARN of the high-availability partition group.
  final String? hapgArn;

  CreateHapgResponse({
    this.hapgArn,
  });

  factory CreateHapgResponse.fromJson(Map<String, dynamic> json) {
    return CreateHapgResponse(
      hapgArn: json['HapgArn'] as String?,
    );
  }
}

/// Contains the output of the <code>CreateHsm</code> operation.
class CreateHsmResponse {
  /// The ARN of the HSM.
  final String? hsmArn;

  CreateHsmResponse({
    this.hsmArn,
  });

  factory CreateHsmResponse.fromJson(Map<String, dynamic> json) {
    return CreateHsmResponse(
      hsmArn: json['HsmArn'] as String?,
    );
  }
}

/// Contains the output of the <a>CreateLunaClient</a> action.
class CreateLunaClientResponse {
  /// The ARN of the client.
  final String? clientArn;

  CreateLunaClientResponse({
    this.clientArn,
  });

  factory CreateLunaClientResponse.fromJson(Map<String, dynamic> json) {
    return CreateLunaClientResponse(
      clientArn: json['ClientArn'] as String?,
    );
  }
}

/// Contains the output of the <a>DeleteHapg</a> action.
class DeleteHapgResponse {
  /// The status of the action.
  final String status;

  DeleteHapgResponse({
    required this.status,
  });

  factory DeleteHapgResponse.fromJson(Map<String, dynamic> json) {
    return DeleteHapgResponse(
      status: json['Status'] as String,
    );
  }
}

/// Contains the output of the <a>DeleteHsm</a> operation.
class DeleteHsmResponse {
  /// The status of the operation.
  final String status;

  DeleteHsmResponse({
    required this.status,
  });

  factory DeleteHsmResponse.fromJson(Map<String, dynamic> json) {
    return DeleteHsmResponse(
      status: json['Status'] as String,
    );
  }
}

class DeleteLunaClientResponse {
  /// The status of the action.
  final String status;

  DeleteLunaClientResponse({
    required this.status,
  });

  factory DeleteLunaClientResponse.fromJson(Map<String, dynamic> json) {
    return DeleteLunaClientResponse(
      status: json['Status'] as String,
    );
  }
}

/// Contains the output of the <a>DescribeHapg</a> action.
class DescribeHapgResponse {
  /// The ARN of the high-availability partition group.
  final String? hapgArn;

  /// The serial number of the high-availability partition group.
  final String? hapgSerial;

  /// <p/>
  final List<String>? hsmsLastActionFailed;

  /// <p/>
  final List<String>? hsmsPendingDeletion;

  /// <p/>
  final List<String>? hsmsPendingRegistration;

  /// The label for the high-availability partition group.
  final String? label;

  /// The date and time the high-availability partition group was last modified.
  final String? lastModifiedTimestamp;

  /// The list of partition serial numbers that belong to the high-availability
  /// partition group.
  final List<String>? partitionSerialList;

  /// The state of the high-availability partition group.
  final CloudHsmObjectState? state;

  DescribeHapgResponse({
    this.hapgArn,
    this.hapgSerial,
    this.hsmsLastActionFailed,
    this.hsmsPendingDeletion,
    this.hsmsPendingRegistration,
    this.label,
    this.lastModifiedTimestamp,
    this.partitionSerialList,
    this.state,
  });

  factory DescribeHapgResponse.fromJson(Map<String, dynamic> json) {
    return DescribeHapgResponse(
      hapgArn: json['HapgArn'] as String?,
      hapgSerial: json['HapgSerial'] as String?,
      hsmsLastActionFailed: (json['HsmsLastActionFailed'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      hsmsPendingDeletion: (json['HsmsPendingDeletion'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      hsmsPendingRegistration: (json['HsmsPendingRegistration'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      label: json['Label'] as String?,
      lastModifiedTimestamp: json['LastModifiedTimestamp'] as String?,
      partitionSerialList: (json['PartitionSerialList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      state: (json['State'] as String?)?.let(CloudHsmObjectState.fromString),
    );
  }
}

/// Contains the output of the <a>DescribeHsm</a> operation.
class DescribeHsmResponse {
  /// The Availability Zone that the HSM is in.
  final String? availabilityZone;

  /// The identifier of the elastic network interface (ENI) attached to the HSM.
  final String? eniId;

  /// The IP address assigned to the HSM's ENI.
  final String? eniIp;

  /// The ARN of the HSM.
  final String? hsmArn;

  /// The HSM model type.
  final String? hsmType;

  /// The ARN of the IAM role assigned to the HSM.
  final String? iamRoleArn;

  /// The list of partitions on the HSM.
  final List<String>? partitions;

  /// The serial number of the HSM.
  final String? serialNumber;

  /// The date and time that the server certificate was last updated.
  final String? serverCertLastUpdated;

  /// The URI of the certificate server.
  final String? serverCertUri;

  /// The HSM software version.
  final String? softwareVersion;

  /// The date and time that the SSH key was last updated.
  final String? sshKeyLastUpdated;

  /// The public SSH key.
  final String? sshPublicKey;

  /// The status of the HSM.
  final HsmStatus? status;

  /// Contains additional information about the status of the HSM.
  final String? statusDetails;

  /// The identifier of the subnet that the HSM is in.
  final String? subnetId;

  /// The subscription end date.
  final String? subscriptionEndDate;

  /// The subscription start date.
  final String? subscriptionStartDate;
  final SubscriptionType? subscriptionType;

  /// The name of the HSM vendor.
  final String? vendorName;

  /// The identifier of the VPC that the HSM is in.
  final String? vpcId;

  DescribeHsmResponse({
    this.availabilityZone,
    this.eniId,
    this.eniIp,
    this.hsmArn,
    this.hsmType,
    this.iamRoleArn,
    this.partitions,
    this.serialNumber,
    this.serverCertLastUpdated,
    this.serverCertUri,
    this.softwareVersion,
    this.sshKeyLastUpdated,
    this.sshPublicKey,
    this.status,
    this.statusDetails,
    this.subnetId,
    this.subscriptionEndDate,
    this.subscriptionStartDate,
    this.subscriptionType,
    this.vendorName,
    this.vpcId,
  });

  factory DescribeHsmResponse.fromJson(Map<String, dynamic> json) {
    return DescribeHsmResponse(
      availabilityZone: json['AvailabilityZone'] as String?,
      eniId: json['EniId'] as String?,
      eniIp: json['EniIp'] as String?,
      hsmArn: json['HsmArn'] as String?,
      hsmType: json['HsmType'] as String?,
      iamRoleArn: json['IamRoleArn'] as String?,
      partitions: (json['Partitions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      serialNumber: json['SerialNumber'] as String?,
      serverCertLastUpdated: json['ServerCertLastUpdated'] as String?,
      serverCertUri: json['ServerCertUri'] as String?,
      softwareVersion: json['SoftwareVersion'] as String?,
      sshKeyLastUpdated: json['SshKeyLastUpdated'] as String?,
      sshPublicKey: json['SshPublicKey'] as String?,
      status: (json['Status'] as String?)?.let(HsmStatus.fromString),
      statusDetails: json['StatusDetails'] as String?,
      subnetId: json['SubnetId'] as String?,
      subscriptionEndDate: json['SubscriptionEndDate'] as String?,
      subscriptionStartDate: json['SubscriptionStartDate'] as String?,
      subscriptionType: (json['SubscriptionType'] as String?)
          ?.let(SubscriptionType.fromString),
      vendorName: json['VendorName'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }
}

class DescribeLunaClientResponse {
  /// The certificate installed on the HSMs used by this client.
  final String? certificate;

  /// The certificate fingerprint.
  final String? certificateFingerprint;

  /// The ARN of the client.
  final String? clientArn;

  /// The label of the client.
  final String? label;

  /// The date and time the client was last modified.
  final String? lastModifiedTimestamp;

  DescribeLunaClientResponse({
    this.certificate,
    this.certificateFingerprint,
    this.clientArn,
    this.label,
    this.lastModifiedTimestamp,
  });

  factory DescribeLunaClientResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLunaClientResponse(
      certificate: json['Certificate'] as String?,
      certificateFingerprint: json['CertificateFingerprint'] as String?,
      clientArn: json['ClientArn'] as String?,
      label: json['Label'] as String?,
      lastModifiedTimestamp: json['LastModifiedTimestamp'] as String?,
    );
  }
}

class GetConfigResponse {
  /// The certificate file containing the server.pem files of the HSMs.
  final String? configCred;

  /// The chrystoki.conf configuration file.
  final String? configFile;

  /// The type of credentials.
  final String? configType;

  GetConfigResponse({
    this.configCred,
    this.configFile,
    this.configType,
  });

  factory GetConfigResponse.fromJson(Map<String, dynamic> json) {
    return GetConfigResponse(
      configCred: json['ConfigCred'] as String?,
      configFile: json['ConfigFile'] as String?,
      configType: json['ConfigType'] as String?,
    );
  }
}

enum HsmStatus {
  pending('PENDING'),
  running('RUNNING'),
  updating('UPDATING'),
  suspended('SUSPENDED'),
  terminating('TERMINATING'),
  terminated('TERMINATED'),
  degraded('DEGRADED'),
  ;

  final String value;

  const HsmStatus(this.value);

  static HsmStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum HsmStatus'));
}

class ListAvailableZonesResponse {
  /// The list of Availability Zones that have available AWS CloudHSM capacity.
  final List<String>? aZList;

  ListAvailableZonesResponse({
    this.aZList,
  });

  factory ListAvailableZonesResponse.fromJson(Map<String, dynamic> json) {
    return ListAvailableZonesResponse(
      aZList:
          (json['AZList'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }
}

class ListHapgsResponse {
  /// The list of high-availability partition groups.
  final List<String> hapgList;

  /// If not null, more results are available. Pass this value to
  /// <code>ListHapgs</code> to retrieve the next set of items.
  final String? nextToken;

  ListHapgsResponse({
    required this.hapgList,
    this.nextToken,
  });

  factory ListHapgsResponse.fromJson(Map<String, dynamic> json) {
    return ListHapgsResponse(
      hapgList:
          (json['HapgList'] as List).nonNulls.map((e) => e as String).toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

/// Contains the output of the <code>ListHsms</code> operation.
class ListHsmsResponse {
  /// The list of ARNs that identify the HSMs.
  final List<String>? hsmList;

  /// If not null, more results are available. Pass this value to
  /// <code>ListHsms</code> to retrieve the next set of items.
  final String? nextToken;

  ListHsmsResponse({
    this.hsmList,
    this.nextToken,
  });

  factory ListHsmsResponse.fromJson(Map<String, dynamic> json) {
    return ListHsmsResponse(
      hsmList:
          (json['HsmList'] as List?)?.nonNulls.map((e) => e as String).toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListLunaClientsResponse {
  /// The list of clients.
  final List<String> clientList;

  /// If not null, more results are available. Pass this to
  /// <code>ListLunaClients</code> to retrieve the next set of items.
  final String? nextToken;

  ListLunaClientsResponse({
    required this.clientList,
    this.nextToken,
  });

  factory ListLunaClientsResponse.fromJson(Map<String, dynamic> json) {
    return ListLunaClientsResponse(
      clientList: (json['ClientList'] as List)
          .nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListTagsForResourceResponse {
  /// One or more tags.
  final List<Tag> tagList;

  ListTagsForResourceResponse({
    required this.tagList,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tagList: (json['TagList'] as List)
          .nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ModifyHapgResponse {
  /// The ARN of the high-availability partition group.
  final String? hapgArn;

  ModifyHapgResponse({
    this.hapgArn,
  });

  factory ModifyHapgResponse.fromJson(Map<String, dynamic> json) {
    return ModifyHapgResponse(
      hapgArn: json['HapgArn'] as String?,
    );
  }
}

/// Contains the output of the <a>ModifyHsm</a> operation.
class ModifyHsmResponse {
  /// The ARN of the HSM.
  final String? hsmArn;

  ModifyHsmResponse({
    this.hsmArn,
  });

  factory ModifyHsmResponse.fromJson(Map<String, dynamic> json) {
    return ModifyHsmResponse(
      hsmArn: json['HsmArn'] as String?,
    );
  }
}

class ModifyLunaClientResponse {
  /// The ARN of the client.
  final String? clientArn;

  ModifyLunaClientResponse({
    this.clientArn,
  });

  factory ModifyLunaClientResponse.fromJson(Map<String, dynamic> json) {
    return ModifyLunaClientResponse(
      clientArn: json['ClientArn'] as String?,
    );
  }
}

class RemoveTagsFromResourceResponse {
  /// The status of the operation.
  final String status;

  RemoveTagsFromResourceResponse({
    required this.status,
  });

  factory RemoveTagsFromResourceResponse.fromJson(Map<String, dynamic> json) {
    return RemoveTagsFromResourceResponse(
      status: json['Status'] as String,
    );
  }
}

/// Specifies the type of subscription for the HSM.
///
/// <ul>
/// <li>
/// <b>PRODUCTION</b> - The HSM is being used in a production environment.
/// </li>
/// <li>
/// <b>TRIAL</b> - The HSM is being used in a product trial.
/// </li>
/// </ul>
enum SubscriptionType {
  production('PRODUCTION'),
  ;

  final String value;

  const SubscriptionType(this.value);

  static SubscriptionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum SubscriptionType'));
}

/// A key-value pair that identifies or specifies metadata about an AWS CloudHSM
/// resource.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

class CloudHsmInternalException extends _s.GenericAwsException {
  CloudHsmInternalException({String? type, String? message})
      : super(type: type, code: 'CloudHsmInternalException', message: message);
}

class CloudHsmServiceException extends _s.GenericAwsException {
  CloudHsmServiceException({String? type, String? message})
      : super(type: type, code: 'CloudHsmServiceException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CloudHsmInternalException': (type, message) =>
      CloudHsmInternalException(type: type, message: message),
  'CloudHsmServiceException': (type, message) =>
      CloudHsmServiceException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
};
