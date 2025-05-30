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

/// IoT provides secure, bi-directional communication between Internet-connected
/// devices (such as sensors, actuators, embedded devices, or smart appliances)
/// and the Amazon Web Services cloud. You can discover your custom IoT-Data
/// endpoint to communicate with, configure rules for data processing and
/// integration with other services, organize resources associated with each
/// device (Registry), configure logging, and create and manage policies and
/// credentials to authenticate devices.
class IoT {
  final _s.RestJsonProtocol _protocol;
  IoT({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'iot',
            signingName: 'iot',
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

  /// Accepts a pending certificate transfer. The default state of the
  /// certificate is INACTIVE.
  ///
  /// To check for pending certificate transfers, call <a>ListCertificates</a>
  /// to enumerate your certificates.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">AcceptCertificateTransfer</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TransferAlreadyCompletedException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  ///
  /// Parameter [setAsActive] :
  /// Specifies whether the certificate is active.
  Future<void> acceptCertificateTransfer({
    required String certificateId,
    bool? setAsActive,
  }) async {
    final $query = <String, List<String>>{
      if (setAsActive != null) 'setAsActive': [setAsActive.toString()],
    };
    await _protocol.send(
      payload: null,
      method: 'PATCH',
      requestUri:
          '/accept-certificate-transfer/${Uri.encodeComponent(certificateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds a thing to a billing group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">AddThingToBillingGroup</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billingGroupArn] :
  /// The ARN of the billing group.
  ///
  /// Parameter [billingGroupName] :
  /// The name of the billing group.
  /// <note>
  /// This call is asynchronous. It might take several seconds for the
  /// detachment to propagate.
  /// </note>
  ///
  /// Parameter [thingArn] :
  /// The ARN of the thing to be added to the billing group.
  ///
  /// Parameter [thingName] :
  /// The name of the thing to be added to the billing group.
  Future<void> addThingToBillingGroup({
    String? billingGroupArn,
    String? billingGroupName,
    String? thingArn,
    String? thingName,
  }) async {
    final $payload = <String, dynamic>{
      if (billingGroupArn != null) 'billingGroupArn': billingGroupArn,
      if (billingGroupName != null) 'billingGroupName': billingGroupName,
      if (thingArn != null) 'thingArn': thingArn,
      if (thingName != null) 'thingName': thingName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/billing-groups/addThingToBillingGroup',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds a thing to a thing group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">AddThingToThingGroup</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [overrideDynamicGroups] :
  /// Override dynamic thing groups with static thing groups when 10-group limit
  /// is reached. If a thing belongs to 10 thing groups, and one or more of
  /// those groups are dynamic thing groups, adding a thing to a static group
  /// removes the thing from the last dynamic group.
  ///
  /// Parameter [thingArn] :
  /// The ARN of the thing to add to a group.
  ///
  /// Parameter [thingGroupArn] :
  /// The ARN of the group to which you are adding a thing.
  ///
  /// Parameter [thingGroupName] :
  /// The name of the group to which you are adding a thing.
  ///
  /// Parameter [thingName] :
  /// The name of the thing to add to a group.
  Future<void> addThingToThingGroup({
    bool? overrideDynamicGroups,
    String? thingArn,
    String? thingGroupArn,
    String? thingGroupName,
    String? thingName,
  }) async {
    final $payload = <String, dynamic>{
      if (overrideDynamicGroups != null)
        'overrideDynamicGroups': overrideDynamicGroups,
      if (thingArn != null) 'thingArn': thingArn,
      if (thingGroupArn != null) 'thingGroupArn': thingGroupArn,
      if (thingGroupName != null) 'thingGroupName': thingGroupName,
      if (thingName != null) 'thingName': thingName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/thing-groups/addThingToThingGroup',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a group with a continuous job. The following criteria must be
  /// met:
  ///
  /// <ul>
  /// <li>
  /// The job must have been created with the <code>targetSelection</code> field
  /// set to "CONTINUOUS".
  /// </li>
  /// <li>
  /// The job status must currently be "IN_PROGRESS".
  /// </li>
  /// <li>
  /// The total number of targets associated with a job must not exceed 100.
  /// </li>
  /// </ul>
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">AssociateTargetsWithJob</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier you assigned to this job when it was created.
  ///
  /// Parameter [targets] :
  /// A list of thing group ARNs that define the targets of the job.
  ///
  /// Parameter [comment] :
  /// An optional comment string describing why the job was associated with the
  /// targets.
  ///
  /// Parameter [namespaceId] :
  /// The namespace used to indicate that a job is a customer-managed job.
  ///
  /// When you specify a value for this parameter, Amazon Web Services IoT Core
  /// sends jobs notifications to MQTT topics that contain the value in the
  /// following format.
  ///
  /// <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code>
  /// <note>
  /// The <code>namespaceId</code> feature is only supported by IoT Greengrass
  /// at this time. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/setting-up.html">Setting
  /// up IoT Greengrass core devices.</a>
  /// </note>
  Future<AssociateTargetsWithJobResponse> associateTargetsWithJob({
    required String jobId,
    required List<String> targets,
    String? comment,
    String? namespaceId,
  }) async {
    final $query = <String, List<String>>{
      if (namespaceId != null) 'namespaceId': [namespaceId],
    };
    final $payload = <String, dynamic>{
      'targets': targets,
      if (comment != null) 'comment': comment,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}/targets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AssociateTargetsWithJobResponse.fromJson(response);
  }

  /// Attaches the specified policy to the specified principal (certificate or
  /// other credential).
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">AttachPolicy</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy to attach.
  ///
  /// Parameter [target] :
  /// The <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/security-iam.html">identity</a>
  /// to which the policy is attached. For example, a thing group or a
  /// certificate.
  Future<void> attachPolicy({
    required String policyName,
    required String target,
  }) async {
    final $payload = <String, dynamic>{
      'target': target,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/target-policies/${Uri.encodeComponent(policyName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Attaches the specified policy to the specified principal (certificate or
  /// other credential).
  ///
  /// <b>Note:</b> This action is deprecated and works as expected for backward
  /// compatibility, but we won't add enhancements. Use <a>AttachPolicy</a>
  /// instead.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">AttachPrincipalPolicy</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [policyName] :
  /// The policy name.
  ///
  /// Parameter [principal] :
  /// The principal, which can be a certificate ARN (as returned from the
  /// CreateCertificate operation) or an Amazon Cognito ID.
  @Deprecated('Deprecated')
  Future<void> attachPrincipalPolicy({
    required String policyName,
    required String principal,
  }) async {
    final headers = <String, String>{
      'x-amzn-iot-principal': principal.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/principal-policies/${Uri.encodeComponent(policyName)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a Device Defender security profile with a thing group or this
  /// account. Each thing group or account can have up to five security profiles
  /// associated with it.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">AttachSecurityProfile</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [securityProfileName] :
  /// The security profile that is attached.
  ///
  /// Parameter [securityProfileTargetArn] :
  /// The ARN of the target (thing group) to which the security profile is
  /// attached.
  Future<void> attachSecurityProfile({
    required String securityProfileName,
    required String securityProfileTargetArn,
  }) async {
    final $query = <String, List<String>>{
      'securityProfileTargetArn': [securityProfileTargetArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(securityProfileName)}/targets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Attaches the specified principal to the specified thing. A principal can
  /// be X.509 certificates, Amazon Cognito identities or federated identities.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">AttachThingPrincipal</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [principal] :
  /// The principal, which can be a certificate ARN (as returned from the
  /// CreateCertificate operation) or an Amazon Cognito ID.
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  Future<void> attachThingPrincipal({
    required String principal,
    required String thingName,
  }) async {
    final headers = <String, String>{
      'x-amzn-principal': principal.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/principals',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Cancels a mitigation action task that is in progress. If the task is not
  /// in progress, an InvalidRequestException occurs.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CancelAuditMitigationActionsTask</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [taskId] :
  /// The unique identifier for the task that you want to cancel.
  Future<void> cancelAuditMitigationActionsTask({
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/audit/mitigationactions/tasks/${Uri.encodeComponent(taskId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Cancels an audit that is in progress. The audit can be either scheduled or
  /// on demand. If the audit isn't in progress, an "InvalidRequestException"
  /// occurs.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CancelAuditTask</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [taskId] :
  /// The ID of the audit you want to cancel. You can only cancel an audit that
  /// is "IN_PROGRESS".
  Future<void> cancelAuditTask({
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/audit/tasks/${Uri.encodeComponent(taskId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Cancels a pending transfer for the specified certificate.
  ///
  /// <b>Note</b> Only the transfer source account can use this operation to
  /// cancel a transfer. (Transfer destinations can use
  /// <a>RejectCertificateTransfer</a> instead.) After transfer, IoT returns the
  /// certificate to the source account in the INACTIVE state. After the
  /// destination account has accepted the transfer, the transfer cannot be
  /// cancelled.
  ///
  /// After a certificate transfer is cancelled, the status of the certificate
  /// changes from PENDING_TRANSFER to INACTIVE.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CancelCertificateTransfer</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TransferAlreadyCompletedException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  Future<void> cancelCertificateTransfer({
    required String certificateId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'PATCH',
      requestUri:
          '/cancel-certificate-transfer/${Uri.encodeComponent(certificateId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Cancels a Device Defender ML Detect mitigation action.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CancelDetectMitigationActionsTask</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [taskId] :
  /// The unique identifier of the task.
  Future<void> cancelDetectMitigationActionsTask({
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/detect/mitigationactions/tasks/${Uri.encodeComponent(taskId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Cancels a job.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CancelJob</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier you assigned to this job when it was created.
  ///
  /// Parameter [comment] :
  /// An optional comment string describing why the job was canceled.
  ///
  /// Parameter [force] :
  /// (Optional) If <code>true</code> job executions with status "IN_PROGRESS"
  /// and "QUEUED" are canceled, otherwise only job executions with status
  /// "QUEUED" are canceled. The default is <code>false</code>.
  ///
  /// Canceling a job which is "IN_PROGRESS", will cause a device which is
  /// executing the job to be unable to update the job execution status. Use
  /// caution and ensure that each device executing a job which is canceled is
  /// able to recover to a valid state.
  ///
  /// Parameter [reasonCode] :
  /// (Optional)A reason code string that explains why the job was canceled.
  Future<CancelJobResponse> cancelJob({
    required String jobId,
    String? comment,
    bool? force,
    String? reasonCode,
  }) async {
    final $query = <String, List<String>>{
      if (force != null) 'force': [force.toString()],
    };
    final $payload = <String, dynamic>{
      if (comment != null) 'comment': comment,
      if (reasonCode != null) 'reasonCode': reasonCode,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}/cancel',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CancelJobResponse.fromJson(response);
  }

  /// Cancels the execution of a job for a given thing.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CancelJobExecution</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  /// May throw [VersionConflictException].
  ///
  /// Parameter [jobId] :
  /// The ID of the job to be canceled.
  ///
  /// Parameter [thingName] :
  /// The name of the thing whose execution of the job will be canceled.
  ///
  /// Parameter [expectedVersion] :
  /// (Optional) The expected current version of the job execution. Each time
  /// you update the job execution, its version is incremented. If the version
  /// of the job execution stored in Jobs does not match, the update is rejected
  /// with a VersionMismatch error, and an ErrorResponse that contains the
  /// current job execution status data is returned. (This makes it unnecessary
  /// to perform a separate DescribeJobExecution request in order to obtain the
  /// job execution status data.)
  ///
  /// Parameter [force] :
  /// (Optional) If <code>true</code> the job execution will be canceled if it
  /// has status IN_PROGRESS or QUEUED, otherwise the job execution will be
  /// canceled only if it has status QUEUED. If you attempt to cancel a job
  /// execution that is IN_PROGRESS, and you do not set <code>force</code> to
  /// <code>true</code>, then an <code>InvalidStateTransitionException</code>
  /// will be thrown. The default is <code>false</code>.
  ///
  /// Canceling a job execution which is "IN_PROGRESS", will cause the device to
  /// be unable to update the job execution status. Use caution and ensure that
  /// the device is able to recover to a valid state.
  ///
  /// Parameter [statusDetails] :
  /// A collection of name/value pairs that describe the status of the job
  /// execution. If not specified, the statusDetails are unchanged. You can
  /// specify at most 10 name/value pairs.
  Future<void> cancelJobExecution({
    required String jobId,
    required String thingName,
    int? expectedVersion,
    bool? force,
    Map<String, String>? statusDetails,
  }) async {
    final $query = <String, List<String>>{
      if (force != null) 'force': [force.toString()],
    };
    final $payload = <String, dynamic>{
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
      if (statusDetails != null) 'statusDetails': statusDetails,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/things/${Uri.encodeComponent(thingName)}/jobs/${Uri.encodeComponent(jobId)}/cancel',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Clears the default authorizer.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ClearDefaultAuthorizer</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  Future<void> clearDefaultAuthorizer() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/default-authorizer',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Confirms a topic rule destination. When you create a rule requiring a
  /// destination, IoT sends a confirmation message to the endpoint or base
  /// address you specify. The message includes a token which you pass back when
  /// calling <code>ConfirmTopicRuleDestination</code> to confirm that you own
  /// or have access to the endpoint.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ConfirmTopicRuleDestination</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [confirmationToken] :
  /// The token used to confirm ownership or access to the topic rule
  /// confirmation URL.
  Future<void> confirmTopicRuleDestination({
    required String confirmationToken,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/confirmdestination/${confirmationToken.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a Device Defender audit suppression.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateAuditSuppression</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [clientRequestToken] :
  /// Each audit supression must have a unique client request token. If you try
  /// to create a new audit suppression with the same token as one that already
  /// exists, an exception occurs. If you omit this value, Amazon Web Services
  /// SDKs will automatically generate a unique client request.
  ///
  /// Parameter [description] :
  /// The description of the audit suppression.
  ///
  /// Parameter [expirationDate] :
  /// The epoch timestamp in seconds at which this suppression expires.
  ///
  /// Parameter [suppressIndefinitely] :
  /// Indicates whether a suppression should exist indefinitely or not.
  Future<void> createAuditSuppression({
    required String checkName,
    required ResourceIdentifier resourceIdentifier,
    String? clientRequestToken,
    String? description,
    DateTime? expirationDate,
    bool? suppressIndefinitely,
  }) async {
    final $payload = <String, dynamic>{
      'checkName': checkName,
      'resourceIdentifier': resourceIdentifier,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (expirationDate != null)
        'expirationDate': unixTimestampToJson(expirationDate),
      if (suppressIndefinitely != null)
        'suppressIndefinitely': suppressIndefinitely,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audit/suppressions/create',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an authorizer.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateAuthorizer</a>
  /// action.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [authorizerFunctionArn] :
  /// The ARN of the authorizer's Lambda function.
  ///
  /// Parameter [authorizerName] :
  /// The authorizer name.
  ///
  /// Parameter [enableCachingForHttp] :
  /// When <code>true</code>, the result from the authorizer’s Lambda function
  /// is cached for clients that use persistent HTTP connections. The results
  /// are cached for the time specified by the Lambda function in
  /// <code>refreshAfterInSeconds</code>. This value does not affect
  /// authorization of clients that use MQTT connections.
  ///
  /// The default value is <code>false</code>.
  ///
  /// Parameter [signingDisabled] :
  /// Specifies whether IoT validates the token signature in an authorization
  /// request.
  ///
  /// Parameter [status] :
  /// The status of the create authorizer request.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the custom authorizer.
  /// <note>
  /// For URI Request parameters use format: ...key1=value1&amp;key2=value2...
  ///
  /// For the CLI command-line parameter use format: &amp;&amp;tags
  /// "key1=value1&amp;key2=value2..."
  ///
  /// For the cli-input-json file use format: "tags":
  /// "key1=value1&amp;key2=value2..."
  /// </note>
  ///
  /// Parameter [tokenKeyName] :
  /// The name of the token key used to extract the token from the HTTP headers.
  ///
  /// Parameter [tokenSigningPublicKeys] :
  /// The public keys used to verify the digital signature returned by your
  /// custom authentication service.
  Future<CreateAuthorizerResponse> createAuthorizer({
    required String authorizerFunctionArn,
    required String authorizerName,
    bool? enableCachingForHttp,
    bool? signingDisabled,
    AuthorizerStatus? status,
    List<Tag>? tags,
    String? tokenKeyName,
    Map<String, String>? tokenSigningPublicKeys,
  }) async {
    final $payload = <String, dynamic>{
      'authorizerFunctionArn': authorizerFunctionArn,
      if (enableCachingForHttp != null)
        'enableCachingForHttp': enableCachingForHttp,
      if (signingDisabled != null) 'signingDisabled': signingDisabled,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
      if (tokenKeyName != null) 'tokenKeyName': tokenKeyName,
      if (tokenSigningPublicKeys != null)
        'tokenSigningPublicKeys': tokenSigningPublicKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/authorizer/${Uri.encodeComponent(authorizerName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAuthorizerResponse.fromJson(response);
  }

  /// Creates a billing group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateBillingGroup</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [billingGroupName] :
  /// The name you wish to give to the billing group.
  ///
  /// Parameter [billingGroupProperties] :
  /// The properties of the billing group.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the billing group.
  Future<CreateBillingGroupResponse> createBillingGroup({
    required String billingGroupName,
    BillingGroupProperties? billingGroupProperties,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (billingGroupProperties != null)
        'billingGroupProperties': billingGroupProperties,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/billing-groups/${Uri.encodeComponent(billingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBillingGroupResponse.fromJson(response);
  }

  /// Creates an X.509 certificate using the specified certificate signing
  /// request.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateCertificateFromCsr</a>
  /// action.
  /// <note>
  /// The CSR must include a public key that is either an RSA key with a length
  /// of at least 2048 bits or an ECC key from NIST P-256, NIST P-384, or NIST
  /// P-521 curves. For supported certificates, consult <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/x509-client-certs.html#x509-cert-algorithms">
  /// Certificate signing algorithms supported by IoT</a>.
  /// </note> <note>
  /// Reusing the same certificate signing request (CSR) results in a distinct
  /// certificate.
  /// </note>
  /// You can create multiple certificates in a batch by creating a directory,
  /// copying multiple <code>.csr</code> files into that directory, and then
  /// specifying that directory on the command line. The following commands show
  /// how to create a batch of certificates given a batch of CSRs. In the
  /// following commands, we assume that a set of CSRs are located inside of the
  /// directory my-csr-directory:
  ///
  /// On Linux and OS X, the command is:
  ///
  /// <code>$ ls my-csr-directory/ | xargs -I {} aws iot
  /// create-certificate-from-csr --certificate-signing-request
  /// file://my-csr-directory/{}</code>
  ///
  /// This command lists all of the CSRs in my-csr-directory and pipes each CSR
  /// file name to the <code>aws iot create-certificate-from-csr</code> Amazon
  /// Web Services CLI command to create a certificate for the corresponding
  /// CSR.
  ///
  /// You can also run the <code>aws iot create-certificate-from-csr</code> part
  /// of the command in parallel to speed up the certificate creation process:
  ///
  /// <code>$ ls my-csr-directory/ | xargs -P 10 -I {} aws iot
  /// create-certificate-from-csr --certificate-signing-request
  /// file://my-csr-directory/{} </code>
  ///
  /// On Windows PowerShell, the command to create certificates for all CSRs in
  /// my-csr-directory is:
  ///
  /// <code>&gt; ls -Name my-csr-directory | %{aws iot
  /// create-certificate-from-csr --certificate-signing-request
  /// file://my-csr-directory/$_} </code>
  ///
  /// On a Windows command prompt, the command to create certificates for all
  /// CSRs in my-csr-directory is:
  ///
  /// <code>&gt; forfiles /p my-csr-directory /c "cmd /c aws iot
  /// create-certificate-from-csr --certificate-signing-request file://@path"
  /// </code>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateSigningRequest] :
  /// The certificate signing request (CSR).
  ///
  /// Parameter [setAsActive] :
  /// Specifies whether the certificate is active.
  Future<CreateCertificateFromCsrResponse> createCertificateFromCsr({
    required String certificateSigningRequest,
    bool? setAsActive,
  }) async {
    final $query = <String, List<String>>{
      if (setAsActive != null) 'setAsActive': [setAsActive.toString()],
    };
    final $payload = <String, dynamic>{
      'certificateSigningRequest': certificateSigningRequest,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/certificates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateCertificateFromCsrResponse.fromJson(response);
  }

  /// Creates an Amazon Web Services IoT Core certificate provider. You can use
  /// Amazon Web Services IoT Core certificate provider to customize how to sign
  /// a certificate signing request (CSR) in IoT fleet provisioning. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/provisioning-cert-provider.html">Customizing
  /// certificate signing using Amazon Web Services IoT Core certificate
  /// provider</a> from <i>Amazon Web Services IoT Core Developer Guide</i>.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateCertificateProvider</a>
  /// action.
  /// <important>
  /// After you create a certificate provider, the behavior of <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/fleet-provision-api.html#create-cert-csr">
  /// <code>CreateCertificateFromCsr</code> API for fleet provisioning</a> will
  /// change and all API calls to <code>CreateCertificateFromCsr</code> will
  /// invoke the certificate provider to create the certificates. It can take up
  /// to a few minutes for this behavior to change after a certificate provider
  /// is created.
  /// </important>
  ///
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [accountDefaultForOperations] :
  /// A list of the operations that the certificate provider will use to
  /// generate certificates. Valid value: <code>CreateCertificateFromCsr</code>.
  ///
  /// Parameter [certificateProviderName] :
  /// The name of the certificate provider.
  ///
  /// Parameter [lambdaFunctionArn] :
  /// The ARN of the Lambda function that defines the authentication logic.
  ///
  /// Parameter [clientToken] :
  /// A string that you can optionally pass in the
  /// <code>CreateCertificateProvider</code> request to make sure the request is
  /// idempotent.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the certificate provider.
  Future<CreateCertificateProviderResponse> createCertificateProvider({
    required List<CertificateProviderOperation> accountDefaultForOperations,
    required String certificateProviderName,
    required String lambdaFunctionArn,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'accountDefaultForOperations':
          accountDefaultForOperations.map((e) => e.value).toList(),
      'lambdaFunctionArn': lambdaFunctionArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/certificate-providers/${Uri.encodeComponent(certificateProviderName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCertificateProviderResponse.fromJson(response);
  }

  /// Use this API to define a Custom Metric published by your devices to Device
  /// Defender.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateCustomMetric</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [metricName] :
  /// The name of the custom metric. This will be used in the metric report
  /// submitted from the device/thing. The name can't begin with
  /// <code>aws:</code>. You can't change the name after you define it.
  ///
  /// Parameter [metricType] :
  /// The type of the custom metric.
  /// <important>
  /// The type <code>number</code> only takes a single metric value as an input,
  /// but when you submit the metrics value in the DeviceMetrics report, you
  /// must pass it as an array with a single value.
  /// </important>
  ///
  /// Parameter [clientRequestToken] :
  /// Each custom metric must have a unique client request token. If you try to
  /// create a new custom metric that already exists with a different token, an
  /// exception occurs. If you omit this value, Amazon Web Services SDKs will
  /// automatically generate a unique client request.
  ///
  /// Parameter [displayName] :
  /// The friendly name in the console for the custom metric. This name doesn't
  /// have to be unique. Don't use this name as the metric identifier in the
  /// device metric report. You can update the friendly name after you define
  /// it.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the custom metric.
  Future<CreateCustomMetricResponse> createCustomMetric({
    required String metricName,
    required CustomMetricType metricType,
    String? clientRequestToken,
    String? displayName,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'metricType': metricType.value,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (displayName != null) 'displayName': displayName,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/custom-metric/${Uri.encodeComponent(metricName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCustomMetricResponse.fromJson(response);
  }

  /// Create a dimension that you can use to limit the scope of a metric used in
  /// a security profile for IoT Device Defender. For example, using a
  /// <code>TOPIC_FILTER</code> dimension, you can narrow down the scope of the
  /// metric only to MQTT topics whose name match the pattern specified in the
  /// dimension.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateDimension</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// A unique identifier for the dimension. Choose something that describes the
  /// type and value to make it easy to remember what it does.
  ///
  /// Parameter [stringValues] :
  /// Specifies the value or list of values for the dimension. For
  /// <code>TOPIC_FILTER</code> dimensions, this is a pattern used to match the
  /// MQTT topic (for example, "admin/#").
  ///
  /// Parameter [type] :
  /// Specifies the type of dimension. Supported types:
  /// <code>TOPIC_FILTER.</code>
  ///
  /// Parameter [clientRequestToken] :
  /// Each dimension must have a unique client request token. If you try to
  /// create a new dimension with the same token as a dimension that already
  /// exists, an exception occurs. If you omit this value, Amazon Web Services
  /// SDKs will automatically generate a unique client request.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the dimension.
  Future<CreateDimensionResponse> createDimension({
    required String name,
    required List<String> stringValues,
    required DimensionType type,
    String? clientRequestToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'stringValues': stringValues,
      'type': type.value,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/dimensions/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDimensionResponse.fromJson(response);
  }

  /// Creates a domain configuration.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateDomainConfiguration</a>
  /// action.
  ///
  /// May throw [LimitExceededException].
  /// May throw [CertificateValidationException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainConfigurationName] :
  /// The name of the domain configuration. This value must be unique to a
  /// region.
  ///
  /// Parameter [authorizerConfig] :
  /// An object that specifies the authorization service for a domain.
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [serverCertificateArns] :
  /// The ARNs of the certificates that IoT passes to the device during the TLS
  /// handshake. Currently you can specify only one certificate ARN. This value
  /// is not required for Amazon Web Services-managed domains.
  ///
  /// Parameter [serverCertificateConfig] :
  /// The server certificate configuration.
  ///
  /// Parameter [serviceType] :
  /// The type of service delivered by the endpoint.
  /// <note>
  /// Amazon Web Services IoT Core currently supports only the <code>DATA</code>
  /// service type.
  /// </note>
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the domain configuration.
  /// <note>
  /// For URI Request parameters use format: ...key1=value1&amp;key2=value2...
  ///
  /// For the CLI command-line parameter use format: &amp;&amp;tags
  /// "key1=value1&amp;key2=value2..."
  ///
  /// For the cli-input-json file use format: "tags":
  /// "key1=value1&amp;key2=value2..."
  /// </note>
  ///
  /// Parameter [tlsConfig] :
  /// An object that specifies the TLS configuration for a domain.
  ///
  /// Parameter [validationCertificateArn] :
  /// The certificate used to validate the server certificate and prove domain
  /// name ownership. This certificate must be signed by a public certificate
  /// authority. This value is not required for Amazon Web Services-managed
  /// domains.
  Future<CreateDomainConfigurationResponse> createDomainConfiguration({
    required String domainConfigurationName,
    AuthorizerConfig? authorizerConfig,
    String? domainName,
    List<String>? serverCertificateArns,
    ServerCertificateConfig? serverCertificateConfig,
    ServiceType? serviceType,
    List<Tag>? tags,
    TlsConfig? tlsConfig,
    String? validationCertificateArn,
  }) async {
    final $payload = <String, dynamic>{
      if (authorizerConfig != null) 'authorizerConfig': authorizerConfig,
      if (domainName != null) 'domainName': domainName,
      if (serverCertificateArns != null)
        'serverCertificateArns': serverCertificateArns,
      if (serverCertificateConfig != null)
        'serverCertificateConfig': serverCertificateConfig,
      if (serviceType != null) 'serviceType': serviceType.value,
      if (tags != null) 'tags': tags,
      if (tlsConfig != null) 'tlsConfig': tlsConfig,
      if (validationCertificateArn != null)
        'validationCertificateArn': validationCertificateArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domainConfigurations/${Uri.encodeComponent(domainConfigurationName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDomainConfigurationResponse.fromJson(response);
  }

  /// Creates a dynamic thing group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateDynamicThingGroup</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidQueryException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [queryString] :
  /// The dynamic thing group search query string.
  ///
  /// See <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/query-syntax.html">Query
  /// Syntax</a> for information about query string syntax.
  ///
  /// Parameter [thingGroupName] :
  /// The dynamic thing group name to create.
  ///
  /// Parameter [indexName] :
  /// The dynamic thing group index name.
  /// <note>
  /// Currently one index is supported: <code>AWS_Things</code>.
  /// </note>
  ///
  /// Parameter [queryVersion] :
  /// The dynamic thing group query version.
  /// <note>
  /// Currently one query version is supported: "2017-09-30". If not specified,
  /// the query version defaults to this value.
  /// </note>
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the dynamic thing group.
  ///
  /// Parameter [thingGroupProperties] :
  /// The dynamic thing group properties.
  Future<CreateDynamicThingGroupResponse> createDynamicThingGroup({
    required String queryString,
    required String thingGroupName,
    String? indexName,
    String? queryVersion,
    List<Tag>? tags,
    ThingGroupProperties? thingGroupProperties,
  }) async {
    final $payload = <String, dynamic>{
      'queryString': queryString,
      if (indexName != null) 'indexName': indexName,
      if (queryVersion != null) 'queryVersion': queryVersion,
      if (tags != null) 'tags': tags,
      if (thingGroupProperties != null)
        'thingGroupProperties': thingGroupProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/dynamic-thing-groups/${Uri.encodeComponent(thingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDynamicThingGroupResponse.fromJson(response);
  }

  /// Creates a fleet metric.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateFleetMetric</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidQueryException].
  /// May throw [InvalidAggregationException].
  /// May throw [IndexNotReadyException].
  ///
  /// Parameter [aggregationField] :
  /// The field to aggregate.
  ///
  /// Parameter [aggregationType] :
  /// The type of the aggregation query.
  ///
  /// Parameter [metricName] :
  /// The name of the fleet metric to create.
  ///
  /// Parameter [period] :
  /// The time in seconds between fleet metric emissions. Range [60(1 min),
  /// 86400(1 day)] and must be multiple of 60.
  ///
  /// Parameter [queryString] :
  /// The search query string.
  ///
  /// Parameter [description] :
  /// The fleet metric description.
  ///
  /// Parameter [indexName] :
  /// The name of the index to search.
  ///
  /// Parameter [queryVersion] :
  /// The query version.
  ///
  /// Parameter [tags] :
  /// Metadata, which can be used to manage the fleet metric.
  ///
  /// Parameter [unit] :
  /// Used to support unit transformation such as milliseconds to seconds. The
  /// unit must be supported by <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html">CW
  /// metric</a>. Default to null.
  Future<CreateFleetMetricResponse> createFleetMetric({
    required String aggregationField,
    required AggregationType aggregationType,
    required String metricName,
    required int period,
    required String queryString,
    String? description,
    String? indexName,
    String? queryVersion,
    List<Tag>? tags,
    FleetMetricUnit? unit,
  }) async {
    _s.validateNumRange(
      'period',
      period,
      60,
      86400,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'aggregationField': aggregationField,
      'aggregationType': aggregationType,
      'period': period,
      'queryString': queryString,
      if (description != null) 'description': description,
      if (indexName != null) 'indexName': indexName,
      if (queryVersion != null) 'queryVersion': queryVersion,
      if (tags != null) 'tags': tags,
      if (unit != null) 'unit': unit.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/fleet-metric/${Uri.encodeComponent(metricName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFleetMetricResponse.fromJson(response);
  }

  /// Creates a job.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateJob</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// A job identifier which must be unique for your Amazon Web Services
  /// account. We recommend using a UUID. Alpha-numeric characters, "-" and "_"
  /// are valid for use here.
  ///
  /// Parameter [targets] :
  /// A list of things and thing groups to which the job should be sent.
  ///
  /// Parameter [abortConfig] :
  /// Allows you to create the criteria to abort a job.
  ///
  /// Parameter [description] :
  /// A short text description of the job.
  ///
  /// Parameter [destinationPackageVersions] :
  /// The package version Amazon Resource Names (ARNs) that are installed on the
  /// device when the job successfully completes. The package version must be in
  /// either the Published or Deprecated state when the job deploys. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/preparing-to-use-software-package-catalog.html#package-version-lifecycle">Package
  /// version lifecycle</a>.
  ///
  /// <b>Note:</b>The following Length Constraints relates to a single ARN. Up
  /// to 25 package version ARNs are allowed.
  ///
  /// Parameter [document] :
  /// The job document. Required if you don't specify a value for
  /// <code>documentSource</code>.
  ///
  /// Parameter [documentParameters] :
  /// Parameters of an Amazon Web Services managed template that you can specify
  /// to create the job document.
  /// <note>
  /// <code>documentParameters</code> can only be used when creating jobs from
  /// Amazon Web Services managed templates. This parameter can't be used with
  /// custom job templates or to create jobs from them.
  /// </note>
  ///
  /// Parameter [documentSource] :
  /// An S3 link, or S3 object URL, to the job document. The link is an Amazon
  /// S3 object URL and is required if you don't specify a value for
  /// <code>document</code>.
  ///
  /// For example, <code>--document-source
  /// https://s3.<i>region-code</i>.amazonaws.com/example-firmware/device-firmware.1.0</code>
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-bucket-intro.html">Methods
  /// for accessing a bucket</a>.
  ///
  /// Parameter [jobExecutionsRetryConfig] :
  /// Allows you to create the criteria to retry a job.
  ///
  /// Parameter [jobExecutionsRolloutConfig] :
  /// Allows you to create a staged rollout of the job.
  ///
  /// Parameter [jobTemplateArn] :
  /// The ARN of the job template used to create the job.
  ///
  /// Parameter [namespaceId] :
  /// The namespace used to indicate that a job is a customer-managed job.
  ///
  /// When you specify a value for this parameter, Amazon Web Services IoT Core
  /// sends jobs notifications to MQTT topics that contain the value in the
  /// following format.
  ///
  /// <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code>
  /// <note>
  /// The <code>namespaceId</code> feature is only supported by IoT Greengrass
  /// at this time. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/setting-up.html">Setting
  /// up IoT Greengrass core devices.</a>
  /// </note>
  ///
  /// Parameter [presignedUrlConfig] :
  /// Configuration information for pre-signed S3 URLs.
  ///
  /// Parameter [schedulingConfig] :
  /// The configuration that allows you to schedule a job for a future date and
  /// time in addition to specifying the end behavior for each job execution.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the job.
  ///
  /// Parameter [targetSelection] :
  /// Specifies whether the job will continue to run (CONTINUOUS), or will be
  /// complete after all those things specified as targets have completed the
  /// job (SNAPSHOT). If continuous, the job may also be run on a thing when a
  /// change is detected in a target. For example, a job will run on a thing
  /// when the thing is added to a target group, even after the job was
  /// completed by all things originally in the group.
  /// <note>
  /// We recommend that you use continuous jobs instead of snapshot jobs for
  /// dynamic thing group targets. By using continuous jobs, devices that join
  /// the group receive the job execution even after the job has been created.
  /// </note>
  ///
  /// Parameter [timeoutConfig] :
  /// Specifies the amount of time each device has to finish its execution of
  /// the job. The timer is started when the job execution status is set to
  /// <code>IN_PROGRESS</code>. If the job execution status is not set to
  /// another terminal state before the time expires, it will be automatically
  /// set to <code>TIMED_OUT</code>.
  Future<CreateJobResponse> createJob({
    required String jobId,
    required List<String> targets,
    AbortConfig? abortConfig,
    String? description,
    List<String>? destinationPackageVersions,
    String? document,
    Map<String, String>? documentParameters,
    String? documentSource,
    JobExecutionsRetryConfig? jobExecutionsRetryConfig,
    JobExecutionsRolloutConfig? jobExecutionsRolloutConfig,
    String? jobTemplateArn,
    String? namespaceId,
    PresignedUrlConfig? presignedUrlConfig,
    SchedulingConfig? schedulingConfig,
    List<Tag>? tags,
    TargetSelection? targetSelection,
    TimeoutConfig? timeoutConfig,
  }) async {
    final $payload = <String, dynamic>{
      'targets': targets,
      if (abortConfig != null) 'abortConfig': abortConfig,
      if (description != null) 'description': description,
      if (destinationPackageVersions != null)
        'destinationPackageVersions': destinationPackageVersions,
      if (document != null) 'document': document,
      if (documentParameters != null) 'documentParameters': documentParameters,
      if (documentSource != null) 'documentSource': documentSource,
      if (jobExecutionsRetryConfig != null)
        'jobExecutionsRetryConfig': jobExecutionsRetryConfig,
      if (jobExecutionsRolloutConfig != null)
        'jobExecutionsRolloutConfig': jobExecutionsRolloutConfig,
      if (jobTemplateArn != null) 'jobTemplateArn': jobTemplateArn,
      if (namespaceId != null) 'namespaceId': namespaceId,
      if (presignedUrlConfig != null) 'presignedUrlConfig': presignedUrlConfig,
      if (schedulingConfig != null) 'schedulingConfig': schedulingConfig,
      if (tags != null) 'tags': tags,
      if (targetSelection != null) 'targetSelection': targetSelection.value,
      if (timeoutConfig != null) 'timeoutConfig': timeoutConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobResponse.fromJson(response);
  }

  /// Creates a job template.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateJobTemplate</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [description] :
  /// A description of the job document.
  ///
  /// Parameter [jobTemplateId] :
  /// A unique identifier for the job template. We recommend using a UUID.
  /// Alpha-numeric characters, "-", and "_" are valid for use here.
  ///
  /// Parameter [destinationPackageVersions] :
  /// The package version Amazon Resource Names (ARNs) that are installed on the
  /// device when the job successfully completes. The package version must be in
  /// either the Published or Deprecated state when the job deploys. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/preparing-to-use-software-package-catalog.html#package-version-lifecycle">Package
  /// version lifecycle</a>.
  ///
  /// <b>Note:</b>The following Length Constraints relates to a single ARN. Up
  /// to 25 package version ARNs are allowed.
  ///
  /// Parameter [document] :
  /// The job document. Required if you don't specify a value for
  /// <code>documentSource</code>.
  ///
  /// Parameter [documentSource] :
  /// An S3 link, or S3 object URL, to the job document. The link is an Amazon
  /// S3 object URL and is required if you don't specify a value for
  /// <code>document</code>.
  ///
  /// For example, <code>--document-source
  /// https://s3.<i>region-code</i>.amazonaws.com/example-firmware/device-firmware.1.0</code>
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-bucket-intro.html">Methods
  /// for accessing a bucket</a>.
  ///
  /// Parameter [jobArn] :
  /// The ARN of the job to use as the basis for the job template.
  ///
  /// Parameter [jobExecutionsRetryConfig] :
  /// Allows you to create the criteria to retry a job.
  ///
  /// Parameter [maintenanceWindows] :
  /// Allows you to configure an optional maintenance window for the rollout of
  /// a job document to all devices in the target group for a job.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the job template.
  Future<CreateJobTemplateResponse> createJobTemplate({
    required String description,
    required String jobTemplateId,
    AbortConfig? abortConfig,
    List<String>? destinationPackageVersions,
    String? document,
    String? documentSource,
    String? jobArn,
    JobExecutionsRetryConfig? jobExecutionsRetryConfig,
    JobExecutionsRolloutConfig? jobExecutionsRolloutConfig,
    List<MaintenanceWindow>? maintenanceWindows,
    PresignedUrlConfig? presignedUrlConfig,
    List<Tag>? tags,
    TimeoutConfig? timeoutConfig,
  }) async {
    final $payload = <String, dynamic>{
      'description': description,
      if (abortConfig != null) 'abortConfig': abortConfig,
      if (destinationPackageVersions != null)
        'destinationPackageVersions': destinationPackageVersions,
      if (document != null) 'document': document,
      if (documentSource != null) 'documentSource': documentSource,
      if (jobArn != null) 'jobArn': jobArn,
      if (jobExecutionsRetryConfig != null)
        'jobExecutionsRetryConfig': jobExecutionsRetryConfig,
      if (jobExecutionsRolloutConfig != null)
        'jobExecutionsRolloutConfig': jobExecutionsRolloutConfig,
      if (maintenanceWindows != null) 'maintenanceWindows': maintenanceWindows,
      if (presignedUrlConfig != null) 'presignedUrlConfig': presignedUrlConfig,
      if (tags != null) 'tags': tags,
      if (timeoutConfig != null) 'timeoutConfig': timeoutConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/job-templates/${Uri.encodeComponent(jobTemplateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobTemplateResponse.fromJson(response);
  }

  /// Creates a 2048-bit RSA key pair and issues an X.509 certificate using the
  /// issued public key. You can also call <code>CreateKeysAndCertificate</code>
  /// over MQTT from a device, for more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/provision-wo-cert.html#provision-mqtt-api">Provisioning
  /// MQTT API</a>.
  ///
  /// <b>Note</b> This is the only time IoT issues the private key for this
  /// certificate, so it is important to keep it in a secure location.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateKeysAndCertificate</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [setAsActive] :
  /// Specifies whether the certificate is active.
  Future<CreateKeysAndCertificateResponse> createKeysAndCertificate({
    bool? setAsActive,
  }) async {
    final $query = <String, List<String>>{
      if (setAsActive != null) 'setAsActive': [setAsActive.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/keys-and-certificate',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateKeysAndCertificateResponse.fromJson(response);
  }

  /// Defines an action that can be applied to audit findings by using
  /// StartAuditMitigationActionsTask. Only certain types of mitigation actions
  /// can be applied to specific check names. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/device-defender-mitigation-actions.html">Mitigation
  /// actions</a>. Each mitigation action can apply only one type of change.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateMitigationAction</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [actionName] :
  /// A friendly name for the action. Choose a friendly name that accurately
  /// describes the action (for example, <code>EnableLoggingAction</code>).
  ///
  /// Parameter [actionParams] :
  /// Defines the type of action and the parameters for that action.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role that is used to apply the mitigation action.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the mitigation action.
  Future<CreateMitigationActionResponse> createMitigationAction({
    required String actionName,
    required MitigationActionParams actionParams,
    required String roleArn,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'actionParams': actionParams,
      'roleArn': roleArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/mitigationactions/actions/${Uri.encodeComponent(actionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMitigationActionResponse.fromJson(response);
  }

  /// Creates an IoT OTA update on a target group of things or groups.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateOTAUpdate</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [files] :
  /// The files to be streamed by the OTA update.
  ///
  /// Parameter [otaUpdateId] :
  /// The ID of the OTA update to be created.
  ///
  /// Parameter [roleArn] :
  /// The IAM role that grants Amazon Web Services IoT Core access to the Amazon
  /// S3, IoT jobs and Amazon Web Services Code Signing resources to create an
  /// OTA update job.
  ///
  /// Parameter [targets] :
  /// The devices targeted to receive OTA updates.
  ///
  /// Parameter [additionalParameters] :
  /// A list of additional OTA update parameters, which are name-value pairs.
  /// They won't be sent to devices as a part of the Job document.
  ///
  /// Parameter [awsJobAbortConfig] :
  /// The criteria that determine when and how a job abort takes place.
  ///
  /// Parameter [awsJobExecutionsRolloutConfig] :
  /// Configuration for the rollout of OTA updates.
  ///
  /// Parameter [awsJobPresignedUrlConfig] :
  /// Configuration information for pre-signed URLs.
  ///
  /// Parameter [awsJobTimeoutConfig] :
  /// Specifies the amount of time each device has to finish its execution of
  /// the job. A timer is started when the job execution status is set to
  /// <code>IN_PROGRESS</code>. If the job execution status is not set to
  /// another terminal state before the timer expires, it will be automatically
  /// set to <code>TIMED_OUT</code>.
  ///
  /// Parameter [description] :
  /// The description of the OTA update.
  ///
  /// Parameter [protocols] :
  /// The protocol used to transfer the OTA update image. Valid values are
  /// [HTTP], [MQTT], [HTTP, MQTT]. When both HTTP and MQTT are specified, the
  /// target device can choose the protocol.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage updates.
  ///
  /// Parameter [targetSelection] :
  /// Specifies whether the update will continue to run (CONTINUOUS), or will be
  /// complete after all the things specified as targets have completed the
  /// update (SNAPSHOT). If continuous, the update may also be run on a thing
  /// when a change is detected in a target. For example, an update will run on
  /// a thing when the thing is added to a target group, even after the update
  /// was completed by all things originally in the group. Valid values:
  /// CONTINUOUS | SNAPSHOT.
  Future<CreateOTAUpdateResponse> createOTAUpdate({
    required List<OTAUpdateFile> files,
    required String otaUpdateId,
    required String roleArn,
    required List<String> targets,
    Map<String, String>? additionalParameters,
    AwsJobAbortConfig? awsJobAbortConfig,
    AwsJobExecutionsRolloutConfig? awsJobExecutionsRolloutConfig,
    AwsJobPresignedUrlConfig? awsJobPresignedUrlConfig,
    AwsJobTimeoutConfig? awsJobTimeoutConfig,
    String? description,
    List<Protocol>? protocols,
    List<Tag>? tags,
    TargetSelection? targetSelection,
  }) async {
    final $payload = <String, dynamic>{
      'files': files,
      'roleArn': roleArn,
      'targets': targets,
      if (additionalParameters != null)
        'additionalParameters': additionalParameters,
      if (awsJobAbortConfig != null) 'awsJobAbortConfig': awsJobAbortConfig,
      if (awsJobExecutionsRolloutConfig != null)
        'awsJobExecutionsRolloutConfig': awsJobExecutionsRolloutConfig,
      if (awsJobPresignedUrlConfig != null)
        'awsJobPresignedUrlConfig': awsJobPresignedUrlConfig,
      if (awsJobTimeoutConfig != null)
        'awsJobTimeoutConfig': awsJobTimeoutConfig,
      if (description != null) 'description': description,
      if (protocols != null)
        'protocols': protocols.map((e) => e.value).toList(),
      if (tags != null) 'tags': tags,
      if (targetSelection != null) 'targetSelection': targetSelection.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/otaUpdates/${Uri.encodeComponent(otaUpdateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateOTAUpdateResponse.fromJson(response);
  }

  /// Creates an IoT software package that can be deployed to your fleet.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreatePackage</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetIndexingConfiguration</a>
  /// actions.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [packageName] :
  /// The name of the new software package.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [description] :
  /// A summary of the package being created. This can be used to outline the
  /// package's contents or purpose.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the package.
  Future<CreatePackageResponse> createPackage({
    required String packageName,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/packages/${Uri.encodeComponent(packageName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreatePackageResponse.fromJson(response);
  }

  /// Creates a new version for an existing IoT software package.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreatePackageVersion</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetIndexingConfiguration</a>
  /// actions.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [packageName] :
  /// The name of the associated software package.
  ///
  /// Parameter [versionName] :
  /// The name of the new package version.
  ///
  /// Parameter [attributes] :
  /// Metadata that can be used to define a package version’s configuration. For
  /// example, the S3 file location, configuration options that are being sent
  /// to the device or fleet.
  ///
  /// The combined size of all the attributes on a package version is limited to
  /// 3KB.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [description] :
  /// A summary of the package version being created. This can be used to
  /// outline the package's contents or purpose.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the package version.
  Future<CreatePackageVersionResponse> createPackageVersion({
    required String packageName,
    required String versionName,
    Map<String, String>? attributes,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final $payload = <String, dynamic>{
      if (attributes != null) 'attributes': attributes,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/packages/${Uri.encodeComponent(packageName)}/versions/${Uri.encodeComponent(versionName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreatePackageVersionResponse.fromJson(response);
  }

  /// Creates an IoT policy.
  ///
  /// The created policy is the default version for the policy. This operation
  /// creates a policy version with a version identifier of <b>1</b> and sets
  /// <b>1</b> as the policy's default version.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreatePolicy</a>
  /// action.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [MalformedPolicyException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyDocument] :
  /// The JSON document that describes the policy. <b>policyDocument</b> must
  /// have a minimum length of 1, with a maximum length of 2048, excluding
  /// whitespace.
  ///
  /// Parameter [policyName] :
  /// The policy name.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the policy.
  /// <note>
  /// For URI Request parameters use format: ...key1=value1&amp;key2=value2...
  ///
  /// For the CLI command-line parameter use format: &amp;&amp;tags
  /// "key1=value1&amp;key2=value2..."
  ///
  /// For the cli-input-json file use format: "tags":
  /// "key1=value1&amp;key2=value2..."
  /// </note>
  Future<CreatePolicyResponse> createPolicy({
    required String policyDocument,
    required String policyName,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'policyDocument': policyDocument,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/policies/${Uri.encodeComponent(policyName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePolicyResponse.fromJson(response);
  }

  /// Creates a new version of the specified IoT policy. To update a policy,
  /// create a new policy version. A managed policy can have up to five
  /// versions. If the policy has five versions, you must use
  /// <a>DeletePolicyVersion</a> to delete an existing version before you create
  /// a new one.
  ///
  /// Optionally, you can set the new version as the policy's default version.
  /// The default version is the operative version (that is, the version that is
  /// in effect for the certificates to which the policy is attached).
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreatePolicyVersion</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [MalformedPolicyException].
  /// May throw [VersionsLimitExceededException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyDocument] :
  /// The JSON document that describes the policy. Minimum length of 1. Maximum
  /// length of 2048, excluding whitespace.
  ///
  /// Parameter [policyName] :
  /// The policy name.
  ///
  /// Parameter [setAsDefault] :
  /// Specifies whether the policy version is set as the default. When this
  /// parameter is true, the new policy version becomes the operative version
  /// (that is, the version that is in effect for the certificates to which the
  /// policy is attached).
  Future<CreatePolicyVersionResponse> createPolicyVersion({
    required String policyDocument,
    required String policyName,
    bool? setAsDefault,
  }) async {
    final $query = <String, List<String>>{
      if (setAsDefault != null) 'setAsDefault': [setAsDefault.toString()],
    };
    final $payload = <String, dynamic>{
      'policyDocument': policyDocument,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/policies/${Uri.encodeComponent(policyName)}/version',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreatePolicyVersionResponse.fromJson(response);
  }

  /// Creates a provisioning claim.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateProvisioningClaim</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [templateName] :
  /// The name of the provisioning template to use.
  Future<CreateProvisioningClaimResponse> createProvisioningClaim({
    required String templateName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/provisioning-templates/${Uri.encodeComponent(templateName)}/provisioning-claim',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProvisioningClaimResponse.fromJson(response);
  }

  /// Creates a provisioning template.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateProvisioningTemplate</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [provisioningRoleArn] :
  /// The role ARN for the role associated with the provisioning template. This
  /// IoT role grants permission to provision a device.
  ///
  /// Parameter [templateBody] :
  /// The JSON formatted contents of the provisioning template.
  ///
  /// Parameter [templateName] :
  /// The name of the provisioning template.
  ///
  /// Parameter [description] :
  /// The description of the provisioning template.
  ///
  /// Parameter [enabled] :
  /// True to enable the provisioning template, otherwise false.
  ///
  /// Parameter [preProvisioningHook] :
  /// Creates a pre-provisioning hook template. Only supports template of type
  /// <code>FLEET_PROVISIONING</code>. For more information about provisioning
  /// template types, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_CreateProvisioningTemplate.html#iot-CreateProvisioningTemplate-request-type">type</a>.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the provisioning template.
  /// <note>
  /// For URI Request parameters use format: ...key1=value1&amp;key2=value2...
  ///
  /// For the CLI command-line parameter use format: &amp;&amp;tags
  /// "key1=value1&amp;key2=value2..."
  ///
  /// For the cli-input-json file use format: "tags":
  /// "key1=value1&amp;key2=value2..."
  /// </note>
  ///
  /// Parameter [type] :
  /// The type you define in a provisioning template. You can create a template
  /// with only one type. You can't change the template type after its creation.
  /// The default value is <code>FLEET_PROVISIONING</code>. For more information
  /// about provisioning template, see: <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/provision-template.html">Provisioning
  /// template</a>.
  Future<CreateProvisioningTemplateResponse> createProvisioningTemplate({
    required String provisioningRoleArn,
    required String templateBody,
    required String templateName,
    String? description,
    bool? enabled,
    ProvisioningHook? preProvisioningHook,
    List<Tag>? tags,
    TemplateType? type,
  }) async {
    final $payload = <String, dynamic>{
      'provisioningRoleArn': provisioningRoleArn,
      'templateBody': templateBody,
      'templateName': templateName,
      if (description != null) 'description': description,
      if (enabled != null) 'enabled': enabled,
      if (preProvisioningHook != null)
        'preProvisioningHook': preProvisioningHook,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/provisioning-templates',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProvisioningTemplateResponse.fromJson(response);
  }

  /// Creates a new version of a provisioning template.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateProvisioningTemplateVersion</a>
  /// action.
  ///
  /// May throw [VersionsLimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [templateBody] :
  /// The JSON formatted contents of the provisioning template.
  ///
  /// Parameter [templateName] :
  /// The name of the provisioning template.
  ///
  /// Parameter [setAsDefault] :
  /// Sets a fleet provision template version as the default version.
  Future<CreateProvisioningTemplateVersionResponse>
      createProvisioningTemplateVersion({
    required String templateBody,
    required String templateName,
    bool? setAsDefault,
  }) async {
    final $query = <String, List<String>>{
      if (setAsDefault != null) 'setAsDefault': [setAsDefault.toString()],
    };
    final $payload = <String, dynamic>{
      'templateBody': templateBody,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/provisioning-templates/${Uri.encodeComponent(templateName)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateProvisioningTemplateVersionResponse.fromJson(response);
  }

  /// Creates a role alias.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateRoleAlias</a>
  /// action.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [roleAlias] :
  /// The role alias that points to a role ARN. This allows you to change the
  /// role without having to update the device.
  ///
  /// Parameter [roleArn] :
  /// The role ARN.
  ///
  /// Parameter [credentialDurationSeconds] :
  /// How long (in seconds) the credentials will be valid. The default value is
  /// 3,600 seconds.
  ///
  /// This value must be less than or equal to the maximum session duration of
  /// the IAM role that the role alias references.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the role alias.
  /// <note>
  /// For URI Request parameters use format: ...key1=value1&amp;key2=value2...
  ///
  /// For the CLI command-line parameter use format: &amp;&amp;tags
  /// "key1=value1&amp;key2=value2..."
  ///
  /// For the cli-input-json file use format: "tags":
  /// "key1=value1&amp;key2=value2..."
  /// </note>
  Future<CreateRoleAliasResponse> createRoleAlias({
    required String roleAlias,
    required String roleArn,
    int? credentialDurationSeconds,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'credentialDurationSeconds',
      credentialDurationSeconds,
      900,
      43200,
    );
    final $payload = <String, dynamic>{
      'roleArn': roleArn,
      if (credentialDurationSeconds != null)
        'credentialDurationSeconds': credentialDurationSeconds,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/role-aliases/${Uri.encodeComponent(roleAlias)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRoleAliasResponse.fromJson(response);
  }

  /// Creates a scheduled audit that is run at a specified time interval.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateScheduledAudit</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [frequency] :
  /// How often the scheduled audit takes place, either <code>DAILY</code>,
  /// <code>WEEKLY</code>, <code>BIWEEKLY</code> or <code>MONTHLY</code>. The
  /// start time of each audit is determined by the system.
  ///
  /// Parameter [scheduledAuditName] :
  /// The name you want to give to the scheduled audit. (Max. 128 chars)
  ///
  /// Parameter [targetCheckNames] :
  /// Which checks are performed during the scheduled audit. Checks must be
  /// enabled for your account. (Use
  /// <code>DescribeAccountAuditConfiguration</code> to see the list of all
  /// checks, including those that are enabled or use
  /// <code>UpdateAccountAuditConfiguration</code> to select which checks are
  /// enabled.)
  ///
  /// Parameter [dayOfMonth] :
  /// The day of the month on which the scheduled audit takes place. This can be
  /// "1" through "31" or "LAST". This field is required if the "frequency"
  /// parameter is set to <code>MONTHLY</code>. If days 29 to 31 are specified,
  /// and the month doesn't have that many days, the audit takes place on the
  /// <code>LAST</code> day of the month.
  ///
  /// Parameter [dayOfWeek] :
  /// The day of the week on which the scheduled audit takes place, either
  /// <code>SUN</code>, <code>MON</code>, <code>TUE</code>, <code>WED</code>,
  /// <code>THU</code>, <code>FRI</code>, or <code>SAT</code>. This field is
  /// required if the <code>frequency</code> parameter is set to
  /// <code>WEEKLY</code> or <code>BIWEEKLY</code>.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the scheduled audit.
  Future<CreateScheduledAuditResponse> createScheduledAudit({
    required AuditFrequency frequency,
    required String scheduledAuditName,
    required List<String> targetCheckNames,
    String? dayOfMonth,
    DayOfWeek? dayOfWeek,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'frequency': frequency.value,
      'targetCheckNames': targetCheckNames,
      if (dayOfMonth != null) 'dayOfMonth': dayOfMonth,
      if (dayOfWeek != null) 'dayOfWeek': dayOfWeek.value,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/audit/scheduledaudits/${Uri.encodeComponent(scheduledAuditName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateScheduledAuditResponse.fromJson(response);
  }

  /// Creates a Device Defender security profile.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateSecurityProfile</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [securityProfileName] :
  /// The name you are giving to the security profile.
  ///
  /// Parameter [additionalMetricsToRetain] :
  /// <i>Please use
  /// <a>CreateSecurityProfileRequest$additionalMetricsToRetainV2</a>
  /// instead.</i>
  ///
  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the profile's <code>behaviors</code>, but
  /// it is also retained for any metric specified here. Can be used with custom
  /// metrics; cannot be used with dimensions.
  ///
  /// Parameter [additionalMetricsToRetainV2] :
  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the profile's <code>behaviors</code>, but
  /// it is also retained for any metric specified here. Can be used with custom
  /// metrics; cannot be used with dimensions.
  ///
  /// Parameter [alertTargets] :
  /// Specifies the destinations to which alerts are sent. (Alerts are always
  /// sent to the console.) Alerts are generated when a device (thing) violates
  /// a behavior.
  ///
  /// Parameter [behaviors] :
  /// Specifies the behaviors that, when violated by a device (thing), cause an
  /// alert.
  ///
  /// Parameter [metricsExportConfig] :
  /// Specifies the MQTT topic and role ARN required for metric export.
  ///
  /// Parameter [securityProfileDescription] :
  /// A description of the security profile.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the security profile.
  Future<CreateSecurityProfileResponse> createSecurityProfile({
    required String securityProfileName,
    List<String>? additionalMetricsToRetain,
    List<MetricToRetain>? additionalMetricsToRetainV2,
    Map<AlertTargetType, AlertTarget>? alertTargets,
    List<Behavior>? behaviors,
    MetricsExportConfig? metricsExportConfig,
    String? securityProfileDescription,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (additionalMetricsToRetain != null)
        'additionalMetricsToRetain': additionalMetricsToRetain,
      if (additionalMetricsToRetainV2 != null)
        'additionalMetricsToRetainV2': additionalMetricsToRetainV2,
      if (alertTargets != null)
        'alertTargets': alertTargets.map((k, e) => MapEntry(k.value, e)),
      if (behaviors != null) 'behaviors': behaviors,
      if (metricsExportConfig != null)
        'metricsExportConfig': metricsExportConfig,
      if (securityProfileDescription != null)
        'securityProfileDescription': securityProfileDescription,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(securityProfileName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSecurityProfileResponse.fromJson(response);
  }

  /// Creates a stream for delivering one or more large files in chunks over
  /// MQTT. A stream transports data bytes in chunks or blocks packaged as MQTT
  /// messages from a source like S3. You can have one or more files associated
  /// with a stream.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateStream</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [files] :
  /// The files to stream.
  ///
  /// Parameter [roleArn] :
  /// An IAM role that allows the IoT service principal to access your S3 files.
  ///
  /// Parameter [streamId] :
  /// The stream ID.
  ///
  /// Parameter [description] :
  /// A description of the stream.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage streams.
  Future<CreateStreamResponse> createStream({
    required List<StreamFile> files,
    required String roleArn,
    required String streamId,
    String? description,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'files': files,
      'roleArn': roleArn,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/streams/${Uri.encodeComponent(streamId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateStreamResponse.fromJson(response);
  }

  /// Creates a thing record in the registry. If this call is made multiple
  /// times using the same thing name and configuration, the call will succeed.
  /// If this call is made with the same thing name but different configuration
  /// a <code>ResourceAlreadyExistsException</code> is thrown.
  /// <note>
  /// This is a control plane operation. See <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-authorization.html">Authorization</a>
  /// for information about authorizing control plane actions.
  /// </note>
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateThing</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing to create.
  ///
  /// You can't change a thing's name after you create it. To change a thing's
  /// name, you must create a new thing, give it the new name, and then delete
  /// the old thing.
  ///
  /// Parameter [attributePayload] :
  /// The attribute payload, which consists of up to three name/value pairs in a
  /// JSON document. For example:
  ///
  /// <code>{\"attributes\":{\"string1\":\"string2\"}}</code>
  ///
  /// Parameter [billingGroupName] :
  /// The name of the billing group the thing will be added to.
  ///
  /// Parameter [thingTypeName] :
  /// The name of the thing type associated with the new thing.
  Future<CreateThingResponse> createThing({
    required String thingName,
    AttributePayload? attributePayload,
    String? billingGroupName,
    String? thingTypeName,
  }) async {
    final $payload = <String, dynamic>{
      if (attributePayload != null) 'attributePayload': attributePayload,
      if (billingGroupName != null) 'billingGroupName': billingGroupName,
      if (thingTypeName != null) 'thingTypeName': thingTypeName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/things/${Uri.encodeComponent(thingName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateThingResponse.fromJson(response);
  }

  /// Create a thing group.
  /// <note>
  /// This is a control plane operation. See <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-authorization.html">Authorization</a>
  /// for information about authorizing control plane actions.
  ///
  /// If the <code>ThingGroup</code> that you create has the exact same
  /// attributes as an existing <code>ThingGroup</code>, you will get a 200
  /// success response.
  /// </note>
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateThingGroup</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingGroupName] :
  /// The thing group name to create.
  ///
  /// Parameter [parentGroupName] :
  /// The name of the parent thing group.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the thing group.
  ///
  /// Parameter [thingGroupProperties] :
  /// The thing group properties.
  Future<CreateThingGroupResponse> createThingGroup({
    required String thingGroupName,
    String? parentGroupName,
    List<Tag>? tags,
    ThingGroupProperties? thingGroupProperties,
  }) async {
    final $payload = <String, dynamic>{
      if (parentGroupName != null) 'parentGroupName': parentGroupName,
      if (tags != null) 'tags': tags,
      if (thingGroupProperties != null)
        'thingGroupProperties': thingGroupProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/thing-groups/${Uri.encodeComponent(thingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateThingGroupResponse.fromJson(response);
  }

  /// Creates a new thing type.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateThingType</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [thingTypeName] :
  /// The name of the thing type.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the thing type.
  ///
  /// Parameter [thingTypeProperties] :
  /// The ThingTypeProperties for the thing type to create. It contains
  /// information about the new thing type including a description, and a list
  /// of searchable thing attribute names.
  Future<CreateThingTypeResponse> createThingType({
    required String thingTypeName,
    List<Tag>? tags,
    ThingTypeProperties? thingTypeProperties,
  }) async {
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
      if (thingTypeProperties != null)
        'thingTypeProperties': thingTypeProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/thing-types/${Uri.encodeComponent(thingTypeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateThingTypeResponse.fromJson(response);
  }

  /// Creates a rule. Creating rules is an administrator-level action. Any user
  /// who has permission to create rules will be able to access data processed
  /// by the rule.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateTopicRule</a>
  /// action.
  ///
  /// May throw [SqlParseException].
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [ruleName] :
  /// The name of the rule.
  ///
  /// Parameter [topicRulePayload] :
  /// The rule payload.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the topic rule.
  /// <note>
  /// For URI Request parameters use format: ...key1=value1&amp;key2=value2...
  ///
  /// For the CLI command-line parameter use format: --tags
  /// "key1=value1&amp;key2=value2..."
  ///
  /// For the cli-input-json file use format: "tags":
  /// "key1=value1&amp;key2=value2..."
  /// </note>
  Future<void> createTopicRule({
    required String ruleName,
    required TopicRulePayload topicRulePayload,
    String? tags,
  }) async {
    final headers = <String, String>{
      if (tags != null) 'x-amz-tagging': tags.toString(),
    };
    await _protocol.send(
      payload: topicRulePayload,
      method: 'POST',
      requestUri: '/rules/${Uri.encodeComponent(ruleName)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a topic rule destination. The destination must be confirmed prior
  /// to use.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateTopicRuleDestination</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [destinationConfiguration] :
  /// The topic rule destination configuration.
  Future<CreateTopicRuleDestinationResponse> createTopicRuleDestination({
    required TopicRuleDestinationConfiguration destinationConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'destinationConfiguration': destinationConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/destinations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTopicRuleDestinationResponse.fromJson(response);
  }

  /// Restores the default settings for Device Defender audits for this account.
  /// Any configuration data you entered is deleted and all audit checks are
  /// reset to disabled.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteAccountAuditConfiguration</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [deleteScheduledAudits] :
  /// If true, all scheduled audits are deleted.
  Future<void> deleteAccountAuditConfiguration({
    bool? deleteScheduledAudits,
  }) async {
    final $query = <String, List<String>>{
      if (deleteScheduledAudits != null)
        'deleteScheduledAudits': [deleteScheduledAudits.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/audit/configuration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Device Defender audit suppression.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteAuditSuppression</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  Future<void> deleteAuditSuppression({
    required String checkName,
    required ResourceIdentifier resourceIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'checkName': checkName,
      'resourceIdentifier': resourceIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audit/suppressions/delete',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an authorizer.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteAuthorizer</a>
  /// action.
  ///
  /// May throw [DeleteConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [authorizerName] :
  /// The name of the authorizer to delete.
  Future<void> deleteAuthorizer({
    required String authorizerName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/authorizer/${Uri.encodeComponent(authorizerName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the billing group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteBillingGroup</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [billingGroupName] :
  /// The name of the billing group.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the billing group. If the version of the billing
  /// group does not match the expected version specified in the request, the
  /// <code>DeleteBillingGroup</code> request is rejected with a
  /// <code>VersionConflictException</code>.
  Future<void> deleteBillingGroup({
    required String billingGroupName,
    int? expectedVersion,
  }) async {
    final $query = <String, List<String>>{
      if (expectedVersion != null)
        'expectedVersion': [expectedVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/billing-groups/${Uri.encodeComponent(billingGroupName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a registered CA certificate.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteCACertificate</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [CertificateStateException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the certificate to delete. (The last part of the certificate ARN
  /// contains the certificate ID.)
  Future<void> deleteCACertificate({
    required String certificateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/cacertificate/${Uri.encodeComponent(certificateId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified certificate.
  ///
  /// A certificate cannot be deleted if it has a policy or IoT thing attached
  /// to it or if its status is set to ACTIVE. To delete a certificate, first
  /// use the <a>DetachPolicy</a> action to detach all policies. Next, use the
  /// <a>UpdateCertificate</a> action to set the certificate to the INACTIVE
  /// status.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteCertificate</a>
  /// action.
  ///
  /// May throw [CertificateStateException].
  /// May throw [DeleteConflictException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  ///
  /// Parameter [forceDelete] :
  /// Forces the deletion of a certificate if it is inactive and is not attached
  /// to an IoT thing.
  Future<void> deleteCertificate({
    required String certificateId,
    bool? forceDelete,
  }) async {
    final $query = <String, List<String>>{
      if (forceDelete != null) 'forceDelete': [forceDelete.toString()],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/certificates/${Uri.encodeComponent(certificateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a certificate provider.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteCertificateProvider</a>
  /// action.
  ///
  /// If you delete the certificate provider resource, the behavior of
  /// <code>CreateCertificateFromCsr</code> will resume, and IoT will create
  /// certificates signed by IoT from a certificate signing request (CSR).
  ///
  /// May throw [DeleteConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateProviderName] :
  /// The name of the certificate provider.
  Future<void> deleteCertificateProvider({
    required String certificateProviderName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/certificate-providers/${Uri.encodeComponent(certificateProviderName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Device Defender detect custom metric.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteCustomMetric</a>
  /// action.
  /// <note>
  /// Before you can delete a custom metric, you must first remove the custom
  /// metric from all security profiles it's a part of. The security profile
  /// associated with the custom metric can be found using the <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_ListSecurityProfiles.html">ListSecurityProfiles</a>
  /// API with <code>metricName</code> set to your custom metric name.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [metricName] :
  /// The name of the custom metric.
  Future<void> deleteCustomMetric({
    required String metricName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/custom-metric/${Uri.encodeComponent(metricName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the specified dimension from your Amazon Web Services accounts.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteDimension</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The unique identifier for the dimension that you want to delete.
  Future<void> deleteDimension({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/dimensions/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified domain configuration.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteDomainConfiguration</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [domainConfigurationName] :
  /// The name of the domain configuration to be deleted.
  Future<void> deleteDomainConfiguration({
    required String domainConfigurationName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domainConfigurations/${Uri.encodeComponent(domainConfigurationName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a dynamic thing group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteDynamicThingGroup</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingGroupName] :
  /// The name of the dynamic thing group to delete.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the dynamic thing group to delete.
  Future<void> deleteDynamicThingGroup({
    required String thingGroupName,
    int? expectedVersion,
  }) async {
    final $query = <String, List<String>>{
      if (expectedVersion != null)
        'expectedVersion': [expectedVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/dynamic-thing-groups/${Uri.encodeComponent(thingGroupName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified fleet metric. Returns successfully with no error if
  /// the deletion is successful or you specify a fleet metric that doesn't
  /// exist.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteFleetMetric</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [VersionConflictException].
  ///
  /// Parameter [metricName] :
  /// The name of the fleet metric to delete.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the fleet metric to delete.
  Future<void> deleteFleetMetric({
    required String metricName,
    int? expectedVersion,
  }) async {
    final $query = <String, List<String>>{
      if (expectedVersion != null)
        'expectedVersion': [expectedVersion.toString()],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/fleet-metric/${Uri.encodeComponent(metricName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a job and its related job executions.
  ///
  /// Deleting a job may take time, depending on the number of job executions
  /// created for the job and various other factors. While the job is being
  /// deleted, the status of the job will be shown as "DELETION_IN_PROGRESS".
  /// Attempting to delete or cancel a job whose status is already
  /// "DELETION_IN_PROGRESS" will result in an error.
  ///
  /// Only 10 jobs may have status "DELETION_IN_PROGRESS" at the same time, or a
  /// LimitExceededException will occur.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteJob</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// The ID of the job to be deleted.
  ///
  /// After a job deletion is completed, you may reuse this jobId when you
  /// create a new job. However, this is not recommended, and you must ensure
  /// that your devices are not using the jobId to refer to the deleted job.
  ///
  /// Parameter [force] :
  /// (Optional) When true, you can delete a job which is "IN_PROGRESS".
  /// Otherwise, you can only delete a job which is in a terminal state
  /// ("COMPLETED" or "CANCELED") or an exception will occur. The default is
  /// false.
  /// <note>
  /// Deleting a job which is "IN_PROGRESS", will cause a device which is
  /// executing the job to be unable to access job information or update the job
  /// execution status. Use caution and ensure that each device executing a job
  /// which is deleted is able to recover to a valid state.
  /// </note>
  ///
  /// Parameter [namespaceId] :
  /// The namespace used to indicate that a job is a customer-managed job.
  ///
  /// When you specify a value for this parameter, Amazon Web Services IoT Core
  /// sends jobs notifications to MQTT topics that contain the value in the
  /// following format.
  ///
  /// <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code>
  /// <note>
  /// The <code>namespaceId</code> feature is only supported by IoT Greengrass
  /// at this time. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/setting-up.html">Setting
  /// up IoT Greengrass core devices.</a>
  /// </note>
  Future<void> deleteJob({
    required String jobId,
    bool? force,
    String? namespaceId,
  }) async {
    final $query = <String, List<String>>{
      if (force != null) 'force': [force.toString()],
      if (namespaceId != null) 'namespaceId': [namespaceId],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a job execution.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteJobExecution</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [executionNumber] :
  /// The ID of the job execution to be deleted. The
  /// <code>executionNumber</code> refers to the execution of a particular job
  /// on a particular device.
  ///
  /// Note that once a job execution is deleted, the
  /// <code>executionNumber</code> may be reused by IoT, so be sure you get and
  /// use the correct value here.
  ///
  /// Parameter [jobId] :
  /// The ID of the job whose execution on a particular device will be deleted.
  ///
  /// Parameter [thingName] :
  /// The name of the thing whose job execution will be deleted.
  ///
  /// Parameter [force] :
  /// (Optional) When true, you can delete a job execution which is
  /// "IN_PROGRESS". Otherwise, you can only delete a job execution which is in
  /// a terminal state ("SUCCEEDED", "FAILED", "REJECTED", "REMOVED" or
  /// "CANCELED") or an exception will occur. The default is false.
  /// <note>
  /// Deleting a job execution which is "IN_PROGRESS", will cause the device to
  /// be unable to access job information or update the job execution status.
  /// Use caution and ensure that the device is able to recover to a valid
  /// state.
  /// </note>
  ///
  /// Parameter [namespaceId] :
  /// The namespace used to indicate that a job is a customer-managed job.
  ///
  /// When you specify a value for this parameter, Amazon Web Services IoT Core
  /// sends jobs notifications to MQTT topics that contain the value in the
  /// following format.
  ///
  /// <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code>
  /// <note>
  /// The <code>namespaceId</code> feature is only supported by IoT Greengrass
  /// at this time. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/setting-up.html">Setting
  /// up IoT Greengrass core devices.</a>
  /// </note>
  Future<void> deleteJobExecution({
    required int executionNumber,
    required String jobId,
    required String thingName,
    bool? force,
    String? namespaceId,
  }) async {
    final $query = <String, List<String>>{
      if (force != null) 'force': [force.toString()],
      if (namespaceId != null) 'namespaceId': [namespaceId],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/things/${Uri.encodeComponent(thingName)}/jobs/${Uri.encodeComponent(jobId)}/executionNumber/${Uri.encodeComponent(executionNumber.toString())}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified job template.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [jobTemplateId] :
  /// The unique identifier of the job template to delete.
  Future<void> deleteJobTemplate({
    required String jobTemplateId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/job-templates/${Uri.encodeComponent(jobTemplateId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a defined mitigation action from your Amazon Web Services
  /// accounts.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteMitigationAction</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [actionName] :
  /// The name of the mitigation action that you want to delete.
  Future<void> deleteMitigationAction({
    required String actionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/mitigationactions/actions/${Uri.encodeComponent(actionName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete an OTA update.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteOTAUpdate</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [VersionConflictException].
  ///
  /// Parameter [otaUpdateId] :
  /// The ID of the OTA update to delete.
  ///
  /// Parameter [deleteStream] :
  /// When true, the stream created by the OTAUpdate process is deleted when the
  /// OTA update is deleted. Ignored if the stream specified in the OTAUpdate is
  /// supplied by the user.
  ///
  /// Parameter [forceDeleteAWSJob] :
  /// When true, deletes the IoT job created by the OTAUpdate process even if it
  /// is "IN_PROGRESS". Otherwise, if the job is not in a terminal state
  /// ("COMPLETED" or "CANCELED") an exception will occur. The default is false.
  Future<void> deleteOTAUpdate({
    required String otaUpdateId,
    bool? deleteStream,
    bool? forceDeleteAWSJob,
  }) async {
    final $query = <String, List<String>>{
      if (deleteStream != null) 'deleteStream': [deleteStream.toString()],
      if (forceDeleteAWSJob != null)
        'forceDeleteAWSJob': [forceDeleteAWSJob.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/otaUpdates/${Uri.encodeComponent(otaUpdateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a specific version from a software package.
  ///
  /// <b>Note:</b> All package versions must be deleted before deleting the
  /// software package.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeletePackageVersion</a>
  /// action.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [packageName] :
  /// The name of the target software package.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> deletePackage({
    required String packageName,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/packages/${Uri.encodeComponent(packageName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a specific version from a software package.
  ///
  /// <b>Note:</b> If a package version is designated as default, you must
  /// remove the designation from the software package using the
  /// <a>UpdatePackage</a> action.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [packageName] :
  /// The name of the associated software package.
  ///
  /// Parameter [versionName] :
  /// The name of the target package version.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> deletePackageVersion({
    required String packageName,
    required String versionName,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/packages/${Uri.encodeComponent(packageName)}/versions/${Uri.encodeComponent(versionName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified policy.
  ///
  /// A policy cannot be deleted if it has non-default versions or it is
  /// attached to any certificate.
  ///
  /// To delete a policy, use the <a>DeletePolicyVersion</a> action to delete
  /// all non-default versions of the policy; use the <a>DetachPolicy</a> action
  /// to detach the policy from any certificate; and then use the DeletePolicy
  /// action to delete the policy.
  ///
  /// When a policy is deleted using DeletePolicy, its default version is
  /// deleted with it.
  /// <note>
  /// Because of the distributed nature of Amazon Web Services, it can take up
  /// to five minutes after a policy is detached before it's ready to be
  /// deleted.
  /// </note>
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeletePolicy</a>
  /// action.
  ///
  /// May throw [DeleteConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy to delete.
  Future<void> deletePolicy({
    required String policyName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/policies/${Uri.encodeComponent(policyName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified version of the specified policy. You cannot delete
  /// the default version of a policy using this action. To delete the default
  /// version of a policy, use <a>DeletePolicy</a>. To find out which version of
  /// a policy is marked as the default version, use ListPolicyVersions.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeletePolicyVersion</a>
  /// action.
  ///
  /// May throw [DeleteConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy.
  ///
  /// Parameter [policyVersionId] :
  /// The policy version ID.
  Future<void> deletePolicyVersion({
    required String policyName,
    required String policyVersionId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/policies/${Uri.encodeComponent(policyName)}/version/${Uri.encodeComponent(policyVersionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a provisioning template.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteProvisioningTemplate</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DeleteConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingResourceUpdateException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [templateName] :
  /// The name of the fleet provision template to delete.
  Future<void> deleteProvisioningTemplate({
    required String templateName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/provisioning-templates/${Uri.encodeComponent(templateName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a provisioning template version.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteProvisioningTemplateVersion</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  /// May throw [DeleteConflictException].
  ///
  /// Parameter [templateName] :
  /// The name of the provisioning template version to delete.
  ///
  /// Parameter [versionId] :
  /// The provisioning template version ID to delete.
  Future<void> deleteProvisioningTemplateVersion({
    required String templateName,
    required int versionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/provisioning-templates/${Uri.encodeComponent(templateName)}/versions/${Uri.encodeComponent(versionId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a CA certificate registration code.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteRegistrationCode</a>
  /// action.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  Future<void> deleteRegistrationCode() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/registrationcode',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a role alias
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteRoleAlias</a>
  /// action.
  ///
  /// May throw [DeleteConflictException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [roleAlias] :
  /// The role alias to delete.
  Future<void> deleteRoleAlias({
    required String roleAlias,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/role-aliases/${Uri.encodeComponent(roleAlias)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a scheduled audit.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteScheduledAudit</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [scheduledAuditName] :
  /// The name of the scheduled audit you want to delete.
  Future<void> deleteScheduledAudit({
    required String scheduledAuditName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/audit/scheduledaudits/${Uri.encodeComponent(scheduledAuditName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Device Defender security profile.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteSecurityProfile</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [VersionConflictException].
  ///
  /// Parameter [securityProfileName] :
  /// The name of the security profile to be deleted.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the security profile. A new version is generated
  /// whenever the security profile is updated. If you specify a value that is
  /// different from the actual version, a <code>VersionConflictException</code>
  /// is thrown.
  Future<void> deleteSecurityProfile({
    required String securityProfileName,
    int? expectedVersion,
  }) async {
    final $query = <String, List<String>>{
      if (expectedVersion != null)
        'expectedVersion': [expectedVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(securityProfileName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a stream.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteStream</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DeleteConflictException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [streamId] :
  /// The stream ID.
  Future<void> deleteStream({
    required String streamId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/streams/${Uri.encodeComponent(streamId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified thing. Returns successfully with no error if the
  /// deletion is successful or you specify a thing that doesn't exist.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteThing</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [VersionConflictException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing to delete.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the thing record in the registry. If the version
  /// of the record in the registry does not match the expected version
  /// specified in the request, the <code>DeleteThing</code> request is rejected
  /// with a <code>VersionConflictException</code>.
  Future<void> deleteThing({
    required String thingName,
    int? expectedVersion,
  }) async {
    final $query = <String, List<String>>{
      if (expectedVersion != null)
        'expectedVersion': [expectedVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/things/${Uri.encodeComponent(thingName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a thing group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteThingGroup</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingGroupName] :
  /// The name of the thing group to delete.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the thing group to delete.
  Future<void> deleteThingGroup({
    required String thingGroupName,
    int? expectedVersion,
  }) async {
    final $query = <String, List<String>>{
      if (expectedVersion != null)
        'expectedVersion': [expectedVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/thing-groups/${Uri.encodeComponent(thingGroupName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified thing type. You cannot delete a thing type if it has
  /// things associated with it. To delete a thing type, first mark it as
  /// deprecated by calling <a>DeprecateThingType</a>, then remove any
  /// associated things by calling <a>UpdateThing</a> to change the thing type
  /// on any associated thing, and finally use <a>DeleteThingType</a> to delete
  /// the thing type.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteThingType</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingTypeName] :
  /// The name of the thing type.
  Future<void> deleteThingType({
    required String thingTypeName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/thing-types/${Uri.encodeComponent(thingTypeName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the rule.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteTopicRule</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [ruleName] :
  /// The name of the rule.
  Future<void> deleteTopicRule({
    required String ruleName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/rules/${Uri.encodeComponent(ruleName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a topic rule destination.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteTopicRuleDestination</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [arn] :
  /// The ARN of the topic rule destination to delete.
  Future<void> deleteTopicRuleDestination({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/destinations/${arn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a logging level.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteV2LoggingLevel</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [targetName] :
  /// The name of the resource for which you are configuring logging.
  ///
  /// Parameter [targetType] :
  /// The type of resource for which you are configuring logging. Must be
  /// <code>THING_Group</code>.
  Future<void> deleteV2LoggingLevel({
    required String targetName,
    required LogTargetType targetType,
  }) async {
    final $query = <String, List<String>>{
      'targetName': [targetName],
      'targetType': [targetType.value],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2LoggingLevel',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deprecates a thing type. You can not associate new things with deprecated
  /// thing type.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeprecateThingType</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingTypeName] :
  /// The name of the thing type to deprecate.
  ///
  /// Parameter [undoDeprecate] :
  /// Whether to undeprecate a deprecated thing type. If <b>true</b>, the thing
  /// type will not be deprecated anymore and you can associate it with things.
  Future<void> deprecateThingType({
    required String thingTypeName,
    bool? undoDeprecate,
  }) async {
    final $payload = <String, dynamic>{
      if (undoDeprecate != null) 'undoDeprecate': undoDeprecate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/thing-types/${Uri.encodeComponent(thingTypeName)}/deprecate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets information about the Device Defender audit settings for this
  /// account. Settings include how audit notifications are sent and which audit
  /// checks are enabled or disabled.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeAccountAuditConfiguration</a>
  /// action.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  Future<DescribeAccountAuditConfigurationResponse>
      describeAccountAuditConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAccountAuditConfigurationResponse.fromJson(response);
  }

  /// Gets information about a single audit finding. Properties include the
  /// reason for noncompliance, the severity of the issue, and the start time
  /// when the audit that returned the finding.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeAuditFinding</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [findingId] :
  /// A unique identifier for a single audit finding. You can use this
  /// identifier to apply mitigation actions to the finding.
  Future<DescribeAuditFindingResponse> describeAuditFinding({
    required String findingId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/findings/${Uri.encodeComponent(findingId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAuditFindingResponse.fromJson(response);
  }

  /// Gets information about an audit mitigation task that is used to apply
  /// mitigation actions to a set of audit findings. Properties include the
  /// actions being applied, the audit checks to which they're being applied,
  /// the task status, and aggregated task statistics.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [taskId] :
  /// The unique identifier for the audit mitigation task.
  Future<DescribeAuditMitigationActionsTaskResponse>
      describeAuditMitigationActionsTask({
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/audit/mitigationactions/tasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAuditMitigationActionsTaskResponse.fromJson(response);
  }

  /// Gets information about a Device Defender audit suppression.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  Future<DescribeAuditSuppressionResponse> describeAuditSuppression({
    required String checkName,
    required ResourceIdentifier resourceIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'checkName': checkName,
      'resourceIdentifier': resourceIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audit/suppressions/describe',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAuditSuppressionResponse.fromJson(response);
  }

  /// Gets information about a Device Defender audit.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeAuditTask</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [taskId] :
  /// The ID of the audit whose information you want to get.
  Future<DescribeAuditTaskResponse> describeAuditTask({
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/tasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAuditTaskResponse.fromJson(response);
  }

  /// Describes an authorizer.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeAuthorizer</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [authorizerName] :
  /// The name of the authorizer to describe.
  Future<DescribeAuthorizerResponse> describeAuthorizer({
    required String authorizerName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/authorizer/${Uri.encodeComponent(authorizerName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAuthorizerResponse.fromJson(response);
  }

  /// Returns information about a billing group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeBillingGroup</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billingGroupName] :
  /// The name of the billing group.
  Future<DescribeBillingGroupResponse> describeBillingGroup({
    required String billingGroupName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/billing-groups/${Uri.encodeComponent(billingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBillingGroupResponse.fromJson(response);
  }

  /// Describes a registered CA certificate.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeCACertificate</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [certificateId] :
  /// The CA certificate identifier.
  Future<DescribeCACertificateResponse> describeCACertificate({
    required String certificateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cacertificate/${Uri.encodeComponent(certificateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCACertificateResponse.fromJson(response);
  }

  /// Gets information about the specified certificate.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeCertificate</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  Future<DescribeCertificateResponse> describeCertificate({
    required String certificateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/certificates/${Uri.encodeComponent(certificateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCertificateResponse.fromJson(response);
  }

  /// Describes a certificate provider.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeCertificateProvider</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateProviderName] :
  /// The name of the certificate provider.
  Future<DescribeCertificateProviderResponse> describeCertificateProvider({
    required String certificateProviderName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/certificate-providers/${Uri.encodeComponent(certificateProviderName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCertificateProviderResponse.fromJson(response);
  }

  /// Gets information about a Device Defender detect custom metric.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeCustomMetric</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [metricName] :
  /// The name of the custom metric.
  Future<DescribeCustomMetricResponse> describeCustomMetric({
    required String metricName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/custom-metric/${Uri.encodeComponent(metricName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCustomMetricResponse.fromJson(response);
  }

  /// Describes the default authorizer.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeDefaultAuthorizer</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  Future<DescribeDefaultAuthorizerResponse> describeDefaultAuthorizer() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/default-authorizer',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDefaultAuthorizerResponse.fromJson(response);
  }

  /// Gets information about a Device Defender ML Detect mitigation action.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeDetectMitigationActionsTask</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [taskId] :
  /// The unique identifier of the task.
  Future<DescribeDetectMitigationActionsTaskResponse>
      describeDetectMitigationActionsTask({
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/detect/mitigationactions/tasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDetectMitigationActionsTaskResponse.fromJson(response);
  }

  /// Provides details about a dimension that is defined in your Amazon Web
  /// Services accounts.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeDimension</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The unique identifier for the dimension.
  Future<DescribeDimensionResponse> describeDimension({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/dimensions/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDimensionResponse.fromJson(response);
  }

  /// Gets summary information about a domain configuration.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeDomainConfiguration</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [domainConfigurationName] :
  /// The name of the domain configuration.
  Future<DescribeDomainConfigurationResponse> describeDomainConfiguration({
    required String domainConfigurationName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domainConfigurations/${Uri.encodeComponent(domainConfigurationName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDomainConfigurationResponse.fromJson(response);
  }

  /// Returns or creates a unique endpoint specific to the Amazon Web Services
  /// account making the call.
  /// <note>
  /// The first time <code>DescribeEndpoint</code> is called, an endpoint is
  /// created. All subsequent calls to <code>DescribeEndpoint</code> return the
  /// same endpoint.
  /// </note>
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeEndpoint</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [endpointType] :
  /// The endpoint type. Valid endpoint types include:
  ///
  /// <ul>
  /// <li>
  /// <code>iot:Data</code> - Returns a VeriSign signed data endpoint.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// <code>iot:Data-ATS</code> - Returns an ATS signed data endpoint.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// <code>iot:CredentialProvider</code> - Returns an IoT credentials provider
  /// API endpoint.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// <code>iot:Jobs</code> - Returns an IoT device management Jobs API
  /// endpoint.
  /// </li>
  /// </ul>
  /// We strongly recommend that customers use the newer
  /// <code>iot:Data-ATS</code> endpoint type to avoid issues related to the
  /// widespread distrust of Symantec certificate authorities. ATS Signed
  /// Certificates are more secure and are trusted by most popular browsers.
  Future<DescribeEndpointResponse> describeEndpoint({
    String? endpointType,
  }) async {
    final $query = <String, List<String>>{
      if (endpointType != null) 'endpointType': [endpointType],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/endpoint',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeEndpointResponse.fromJson(response);
  }

  /// Describes event configurations.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeEventConfigurations</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  Future<DescribeEventConfigurationsResponse>
      describeEventConfigurations() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/event-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeEventConfigurationsResponse.fromJson(response);
  }

  /// Gets information about the specified fleet metric.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeFleetMetric</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [metricName] :
  /// The name of the fleet metric to describe.
  Future<DescribeFleetMetricResponse> describeFleetMetric({
    required String metricName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/fleet-metric/${Uri.encodeComponent(metricName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFleetMetricResponse.fromJson(response);
  }

  /// Describes a search index.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeIndex</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [indexName] :
  /// The index name.
  Future<DescribeIndexResponse> describeIndex({
    required String indexName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/indices/${Uri.encodeComponent(indexName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeIndexResponse.fromJson(response);
  }

  /// Describes a job.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeJob</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier you assigned to this job when it was created.
  Future<DescribeJobResponse> describeJob({
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobResponse.fromJson(response);
  }

  /// Describes a job execution.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeJobExecution</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier you assigned to this job when it was created.
  ///
  /// Parameter [thingName] :
  /// The name of the thing on which the job execution is running.
  ///
  /// Parameter [executionNumber] :
  /// A string (consisting of the digits "0" through "9" which is used to
  /// specify a particular job execution on a particular device.
  Future<DescribeJobExecutionResponse> describeJobExecution({
    required String jobId,
    required String thingName,
    int? executionNumber,
  }) async {
    final $query = <String, List<String>>{
      if (executionNumber != null)
        'executionNumber': [executionNumber.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/things/${Uri.encodeComponent(thingName)}/jobs/${Uri.encodeComponent(jobId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobExecutionResponse.fromJson(response);
  }

  /// Returns information about a job template.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [jobTemplateId] :
  /// The unique identifier of the job template.
  Future<DescribeJobTemplateResponse> describeJobTemplate({
    required String jobTemplateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/job-templates/${Uri.encodeComponent(jobTemplateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobTemplateResponse.fromJson(response);
  }

  /// View details of a managed job template.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [templateName] :
  /// The unique name of a managed job template, which is required.
  ///
  /// Parameter [templateVersion] :
  /// An optional parameter to specify version of a managed template. If not
  /// specified, the pre-defined default version is returned.
  Future<DescribeManagedJobTemplateResponse> describeManagedJobTemplate({
    required String templateName,
    String? templateVersion,
  }) async {
    final $query = <String, List<String>>{
      if (templateVersion != null) 'templateVersion': [templateVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/managed-job-templates/${Uri.encodeComponent(templateName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeManagedJobTemplateResponse.fromJson(response);
  }

  /// Gets information about a mitigation action.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeMitigationAction</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [actionName] :
  /// The friendly name that uniquely identifies the mitigation action.
  Future<DescribeMitigationActionResponse> describeMitigationAction({
    required String actionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/mitigationactions/actions/${Uri.encodeComponent(actionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeMitigationActionResponse.fromJson(response);
  }

  /// Returns information about a provisioning template.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeProvisioningTemplate</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [templateName] :
  /// The name of the provisioning template.
  Future<DescribeProvisioningTemplateResponse> describeProvisioningTemplate({
    required String templateName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/provisioning-templates/${Uri.encodeComponent(templateName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeProvisioningTemplateResponse.fromJson(response);
  }

  /// Returns information about a provisioning template version.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeProvisioningTemplateVersion</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [templateName] :
  /// The template name.
  ///
  /// Parameter [versionId] :
  /// The provisioning template version ID.
  Future<DescribeProvisioningTemplateVersionResponse>
      describeProvisioningTemplateVersion({
    required String templateName,
    required int versionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/provisioning-templates/${Uri.encodeComponent(templateName)}/versions/${Uri.encodeComponent(versionId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeProvisioningTemplateVersionResponse.fromJson(response);
  }

  /// Describes a role alias.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeRoleAlias</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [roleAlias] :
  /// The role alias to describe.
  Future<DescribeRoleAliasResponse> describeRoleAlias({
    required String roleAlias,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/role-aliases/${Uri.encodeComponent(roleAlias)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRoleAliasResponse.fromJson(response);
  }

  /// Gets information about a scheduled audit.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeScheduledAudit</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [scheduledAuditName] :
  /// The name of the scheduled audit whose information you want to get.
  Future<DescribeScheduledAuditResponse> describeScheduledAudit({
    required String scheduledAuditName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/audit/scheduledaudits/${Uri.encodeComponent(scheduledAuditName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeScheduledAuditResponse.fromJson(response);
  }

  /// Gets information about a Device Defender security profile.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeSecurityProfile</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [securityProfileName] :
  /// The name of the security profile whose information you want to get.
  Future<DescribeSecurityProfileResponse> describeSecurityProfile({
    required String securityProfileName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(securityProfileName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSecurityProfileResponse.fromJson(response);
  }

  /// Gets information about a stream.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeStream</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [streamId] :
  /// The stream ID.
  Future<DescribeStreamResponse> describeStream({
    required String streamId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/streams/${Uri.encodeComponent(streamId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeStreamResponse.fromJson(response);
  }

  /// Gets information about the specified thing.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeThing</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  Future<DescribeThingResponse> describeThing({
    required String thingName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/things/${Uri.encodeComponent(thingName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeThingResponse.fromJson(response);
  }

  /// Describe a thing group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeThingGroup</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [thingGroupName] :
  /// The name of the thing group.
  Future<DescribeThingGroupResponse> describeThingGroup({
    required String thingGroupName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/thing-groups/${Uri.encodeComponent(thingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeThingGroupResponse.fromJson(response);
  }

  /// Describes a bulk thing provisioning task.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeThingRegistrationTask</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [taskId] :
  /// The task ID.
  Future<DescribeThingRegistrationTaskResponse> describeThingRegistrationTask({
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/thing-registration-tasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeThingRegistrationTaskResponse.fromJson(response);
  }

  /// Gets information about the specified thing type.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeThingType</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingTypeName] :
  /// The name of the thing type.
  Future<DescribeThingTypeResponse> describeThingType({
    required String thingTypeName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/thing-types/${Uri.encodeComponent(thingTypeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeThingTypeResponse.fromJson(response);
  }

  /// Detaches a policy from the specified target.
  /// <note>
  /// Because of the distributed nature of Amazon Web Services, it can take up
  /// to five minutes after a policy is detached before it's ready to be
  /// deleted.
  /// </note>
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DetachPolicy</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [policyName] :
  /// The policy to detach.
  ///
  /// Parameter [target] :
  /// The target from which the policy will be detached.
  Future<void> detachPolicy({
    required String policyName,
    required String target,
  }) async {
    final $payload = <String, dynamic>{
      'target': target,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/target-policies/${Uri.encodeComponent(policyName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the specified policy from the specified certificate.
  ///
  /// <b>Note:</b> This action is deprecated and works as expected for backward
  /// compatibility, but we won't add enhancements. Use <a>DetachPolicy</a>
  /// instead.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DetachPrincipalPolicy</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy to detach.
  ///
  /// Parameter [principal] :
  /// The principal.
  ///
  /// Valid principals are CertificateArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>),
  /// thingGroupArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>)
  /// and CognitoId (<i>region</i>:<i>id</i>).
  @Deprecated('Deprecated')
  Future<void> detachPrincipalPolicy({
    required String policyName,
    required String principal,
  }) async {
    final headers = <String, String>{
      'x-amzn-iot-principal': principal.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/principal-policies/${Uri.encodeComponent(policyName)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a Device Defender security profile from a thing group or
  /// from this account.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DetachSecurityProfile</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [securityProfileName] :
  /// The security profile that is detached.
  ///
  /// Parameter [securityProfileTargetArn] :
  /// The ARN of the thing group from which the security profile is detached.
  Future<void> detachSecurityProfile({
    required String securityProfileName,
    required String securityProfileTargetArn,
  }) async {
    final $query = <String, List<String>>{
      'securityProfileTargetArn': [securityProfileTargetArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(securityProfileName)}/targets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Detaches the specified principal from the specified thing. A principal can
  /// be X.509 certificates, IAM users, groups, and roles, Amazon Cognito
  /// identities or federated identities.
  /// <note>
  /// This call is asynchronous. It might take several seconds for the
  /// detachment to propagate.
  /// </note>
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DetachThingPrincipal</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [principal] :
  /// If the principal is a certificate, this value must be ARN of the
  /// certificate. If the principal is an Amazon Cognito identity, this value
  /// must be the ID of the Amazon Cognito identity.
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  Future<void> detachThingPrincipal({
    required String principal,
    required String thingName,
  }) async {
    final headers = <String, String>{
      'x-amzn-principal': principal.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/principals',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disables the rule.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DisableTopicRule</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [ruleName] :
  /// The name of the rule to disable.
  Future<void> disableTopicRule({
    required String ruleName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/rules/${Uri.encodeComponent(ruleName)}/disable',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Enables the rule.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">EnableTopicRule</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [ruleName] :
  /// The name of the topic rule to enable.
  Future<void> enableTopicRule({
    required String ruleName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/rules/${Uri.encodeComponent(ruleName)}/enable',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a Device Defender's ML Detect Security Profile training model's
  /// status.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetBehaviorModelTrainingSummaries</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [securityProfileName] :
  /// The name of the security profile.
  Future<GetBehaviorModelTrainingSummariesResponse>
      getBehaviorModelTrainingSummaries({
    int? maxResults,
    String? nextToken,
    String? securityProfileName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (securityProfileName != null)
        'securityProfileName': [securityProfileName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/behavior-model-training/summaries',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetBehaviorModelTrainingSummariesResponse.fromJson(response);
  }

  /// Aggregates on indexed data with search queries pertaining to particular
  /// fields.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetBucketsAggregation</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidQueryException].
  /// May throw [InvalidAggregationException].
  /// May throw [IndexNotReadyException].
  ///
  /// Parameter [aggregationField] :
  /// The aggregation field.
  ///
  /// Parameter [bucketsAggregationType] :
  /// The basic control of the response shape and the bucket aggregation type to
  /// perform.
  ///
  /// Parameter [queryString] :
  /// The search query string.
  ///
  /// Parameter [indexName] :
  /// The name of the index to search.
  ///
  /// Parameter [queryVersion] :
  /// The version of the query.
  Future<GetBucketsAggregationResponse> getBucketsAggregation({
    required String aggregationField,
    required BucketsAggregationType bucketsAggregationType,
    required String queryString,
    String? indexName,
    String? queryVersion,
  }) async {
    final $payload = <String, dynamic>{
      'aggregationField': aggregationField,
      'bucketsAggregationType': bucketsAggregationType,
      'queryString': queryString,
      if (indexName != null) 'indexName': indexName,
      if (queryVersion != null) 'queryVersion': queryVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/indices/buckets',
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketsAggregationResponse.fromJson(response);
  }

  /// Returns the approximate count of unique values that match the query.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetCardinality</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidQueryException].
  /// May throw [InvalidAggregationException].
  /// May throw [IndexNotReadyException].
  ///
  /// Parameter [queryString] :
  /// The search query string.
  ///
  /// Parameter [aggregationField] :
  /// The field to aggregate.
  ///
  /// Parameter [indexName] :
  /// The name of the index to search.
  ///
  /// Parameter [queryVersion] :
  /// The query version.
  Future<GetCardinalityResponse> getCardinality({
    required String queryString,
    String? aggregationField,
    String? indexName,
    String? queryVersion,
  }) async {
    final $payload = <String, dynamic>{
      'queryString': queryString,
      if (aggregationField != null) 'aggregationField': aggregationField,
      if (indexName != null) 'indexName': indexName,
      if (queryVersion != null) 'queryVersion': queryVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/indices/cardinality',
      exceptionFnMap: _exceptionFns,
    );
    return GetCardinalityResponse.fromJson(response);
  }

  /// Gets a list of the policies that have an effect on the authorization
  /// behavior of the specified device when it connects to the IoT device
  /// gateway.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetEffectivePolicies</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [cognitoIdentityPoolId] :
  /// The Cognito identity pool ID.
  ///
  /// Parameter [principal] :
  /// The principal. Valid principals are CertificateArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>),
  /// thingGroupArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>)
  /// and CognitoId (<i>region</i>:<i>id</i>).
  ///
  /// Parameter [thingName] :
  /// The thing name.
  Future<GetEffectivePoliciesResponse> getEffectivePolicies({
    String? cognitoIdentityPoolId,
    String? principal,
    String? thingName,
  }) async {
    final $query = <String, List<String>>{
      if (thingName != null) 'thingName': [thingName],
    };
    final $payload = <String, dynamic>{
      if (cognitoIdentityPoolId != null)
        'cognitoIdentityPoolId': cognitoIdentityPoolId,
      if (principal != null) 'principal': principal,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/effective-policies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetEffectivePoliciesResponse.fromJson(response);
  }

  /// Gets the indexing configuration.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetIndexingConfiguration</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  Future<GetIndexingConfigurationResponse> getIndexingConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/indexing/config',
      exceptionFnMap: _exceptionFns,
    );
    return GetIndexingConfigurationResponse.fromJson(response);
  }

  /// Gets a job document.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetJobDocument</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier you assigned to this job when it was created.
  Future<GetJobDocumentResponse> getJobDocument({
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}/job-document',
      exceptionFnMap: _exceptionFns,
    );
    return GetJobDocumentResponse.fromJson(response);
  }

  /// Gets the logging options.
  ///
  /// NOTE: use of this command is not recommended. Use
  /// <code>GetV2LoggingOptions</code> instead.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetLoggingOptions</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  Future<GetLoggingOptionsResponse> getLoggingOptions() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/loggingOptions',
      exceptionFnMap: _exceptionFns,
    );
    return GetLoggingOptionsResponse.fromJson(response);
  }

  /// Gets an OTA update.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetOTAUpdate</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [otaUpdateId] :
  /// The OTA update ID.
  Future<GetOTAUpdateResponse> getOTAUpdate({
    required String otaUpdateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/otaUpdates/${Uri.encodeComponent(otaUpdateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetOTAUpdateResponse.fromJson(response);
  }

  /// Gets information about the specified software package.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetPackage</a>
  /// action.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [packageName] :
  /// The name of the target software package.
  Future<GetPackageResponse> getPackage({
    required String packageName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/packages/${Uri.encodeComponent(packageName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPackageResponse.fromJson(response);
  }

  /// Gets information about the specified software package's configuration.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetPackageConfiguration</a>
  /// action.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<GetPackageConfigurationResponse> getPackageConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/package-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetPackageConfigurationResponse.fromJson(response);
  }

  /// Gets information about the specified package version.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetPackageVersion</a>
  /// action.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [packageName] :
  /// The name of the associated package.
  ///
  /// Parameter [versionName] :
  /// The name of the target package version.
  Future<GetPackageVersionResponse> getPackageVersion({
    required String packageName,
    required String versionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/packages/${Uri.encodeComponent(packageName)}/versions/${Uri.encodeComponent(versionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPackageVersionResponse.fromJson(response);
  }

  /// Groups the aggregated values that match the query into percentile
  /// groupings. The default percentile groupings are: 1,5,25,50,75,95,99,
  /// although you can specify your own when you call
  /// <code>GetPercentiles</code>. This function returns a value for each
  /// percentile group specified (or the default percentile groupings). The
  /// percentile group "1" contains the aggregated field value that occurs in
  /// approximately one percent of the values that match the query. The
  /// percentile group "5" contains the aggregated field value that occurs in
  /// approximately five percent of the values that match the query, and so on.
  /// The result is an approximation, the more values that match the query, the
  /// more accurate the percentile values.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetPercentiles</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidQueryException].
  /// May throw [InvalidAggregationException].
  /// May throw [IndexNotReadyException].
  ///
  /// Parameter [queryString] :
  /// The search query string.
  ///
  /// Parameter [aggregationField] :
  /// The field to aggregate.
  ///
  /// Parameter [indexName] :
  /// The name of the index to search.
  ///
  /// Parameter [percents] :
  /// The percentile groups returned.
  ///
  /// Parameter [queryVersion] :
  /// The query version.
  Future<GetPercentilesResponse> getPercentiles({
    required String queryString,
    String? aggregationField,
    String? indexName,
    List<double>? percents,
    String? queryVersion,
  }) async {
    final $payload = <String, dynamic>{
      'queryString': queryString,
      if (aggregationField != null) 'aggregationField': aggregationField,
      if (indexName != null) 'indexName': indexName,
      if (percents != null) 'percents': percents,
      if (queryVersion != null) 'queryVersion': queryVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/indices/percentiles',
      exceptionFnMap: _exceptionFns,
    );
    return GetPercentilesResponse.fromJson(response);
  }

  /// Gets information about the specified policy with the policy document of
  /// the default version.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetPolicy</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy.
  Future<GetPolicyResponse> getPolicy({
    required String policyName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/policies/${Uri.encodeComponent(policyName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPolicyResponse.fromJson(response);
  }

  /// Gets information about the specified policy version.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetPolicyVersion</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy.
  ///
  /// Parameter [policyVersionId] :
  /// The policy version ID.
  Future<GetPolicyVersionResponse> getPolicyVersion({
    required String policyName,
    required String policyVersionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/policies/${Uri.encodeComponent(policyName)}/version/${Uri.encodeComponent(policyVersionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPolicyVersionResponse.fromJson(response);
  }

  /// Gets a registration code used to register a CA certificate with IoT.
  ///
  /// IoT will create a registration code as part of this API call if the
  /// registration code doesn't exist or has been deleted. If you already have a
  /// registration code, this API call will return the same registration code.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetRegistrationCode</a>
  /// action.
  ///
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  Future<GetRegistrationCodeResponse> getRegistrationCode() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/registrationcode',
      exceptionFnMap: _exceptionFns,
    );
    return GetRegistrationCodeResponse.fromJson(response);
  }

  /// Returns the count, average, sum, minimum, maximum, sum of squares,
  /// variance, and standard deviation for the specified aggregated field. If
  /// the aggregation field is of type <code>String</code>, only the count
  /// statistic is returned.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetStatistics</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidQueryException].
  /// May throw [InvalidAggregationException].
  /// May throw [IndexNotReadyException].
  ///
  /// Parameter [queryString] :
  /// The query used to search. You can specify "*" for the query string to get
  /// the count of all indexed things in your Amazon Web Services account.
  ///
  /// Parameter [aggregationField] :
  /// The aggregation field name.
  ///
  /// Parameter [indexName] :
  /// The name of the index to search. The default value is
  /// <code>AWS_Things</code>.
  ///
  /// Parameter [queryVersion] :
  /// The version of the query used to search.
  Future<GetStatisticsResponse> getStatistics({
    required String queryString,
    String? aggregationField,
    String? indexName,
    String? queryVersion,
  }) async {
    final $payload = <String, dynamic>{
      'queryString': queryString,
      if (aggregationField != null) 'aggregationField': aggregationField,
      if (indexName != null) 'indexName': indexName,
      if (queryVersion != null) 'queryVersion': queryVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/indices/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return GetStatisticsResponse.fromJson(response);
  }

  /// Gets information about the rule.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetTopicRule</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [ruleName] :
  /// The name of the rule.
  Future<GetTopicRuleResponse> getTopicRule({
    required String ruleName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/rules/${Uri.encodeComponent(ruleName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTopicRuleResponse.fromJson(response);
  }

  /// Gets information about a topic rule destination.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetTopicRuleDestination</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [arn] :
  /// The ARN of the topic rule destination.
  Future<GetTopicRuleDestinationResponse> getTopicRuleDestination({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/destinations/${arn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTopicRuleDestinationResponse.fromJson(response);
  }

  /// Gets the fine grained logging options.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetV2LoggingOptions</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [NotConfiguredException].
  /// May throw [ServiceUnavailableException].
  Future<GetV2LoggingOptionsResponse> getV2LoggingOptions() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2LoggingOptions',
      exceptionFnMap: _exceptionFns,
    );
    return GetV2LoggingOptionsResponse.fromJson(response);
  }

  /// Lists the active violations for a given Device Defender security profile.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListActiveViolations</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [behaviorCriteriaType] :
  /// The criteria for a behavior.
  ///
  /// Parameter [listSuppressedAlerts] :
  /// A list of all suppressed alerts.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [securityProfileName] :
  /// The name of the Device Defender security profile for which violations are
  /// listed.
  ///
  /// Parameter [thingName] :
  /// The name of the thing whose active violations are listed.
  ///
  /// Parameter [verificationState] :
  /// The verification state of the violation (detect alarm).
  Future<ListActiveViolationsResponse> listActiveViolations({
    BehaviorCriteriaType? behaviorCriteriaType,
    bool? listSuppressedAlerts,
    int? maxResults,
    String? nextToken,
    String? securityProfileName,
    String? thingName,
    VerificationState? verificationState,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (behaviorCriteriaType != null)
        'behaviorCriteriaType': [behaviorCriteriaType.value],
      if (listSuppressedAlerts != null)
        'listSuppressedAlerts': [listSuppressedAlerts.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (securityProfileName != null)
        'securityProfileName': [securityProfileName],
      if (thingName != null) 'thingName': [thingName],
      if (verificationState != null)
        'verificationState': [verificationState.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/active-violations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListActiveViolationsResponse.fromJson(response);
  }

  /// Lists the policies attached to the specified thing group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListAttachedPolicies</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [target] :
  /// The group or principal for which the policies will be listed. Valid
  /// principals are CertificateArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>),
  /// thingGroupArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>)
  /// and CognitoId (<i>region</i>:<i>id</i>).
  ///
  /// Parameter [marker] :
  /// The token to retrieve the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [recursive] :
  /// When true, recursively list attached policies.
  Future<ListAttachedPoliciesResponse> listAttachedPolicies({
    required String target,
    String? marker,
    int? pageSize,
    bool? recursive,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
      if (recursive != null) 'recursive': [recursive.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/attached-policies/${Uri.encodeComponent(target)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAttachedPoliciesResponse.fromJson(response);
  }

  /// Lists the findings (results) of a Device Defender audit or of the audits
  /// performed during a specified time period. (Findings are retained for 90
  /// days.)
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListAuditFindings</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [checkName] :
  /// A filter to limit results to the findings for the specified audit check.
  ///
  /// Parameter [endTime] :
  /// A filter to limit results to those found before the specified time. You
  /// must specify either the startTime and endTime or the taskId, but not both.
  ///
  /// Parameter [listSuppressedFindings] :
  /// Boolean flag indicating whether only the suppressed findings or the
  /// unsuppressed findings should be listed. If this parameter isn't provided,
  /// the response will list both suppressed and unsuppressed findings.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [resourceIdentifier] :
  /// Information identifying the noncompliant resource.
  ///
  /// Parameter [startTime] :
  /// A filter to limit results to those found after the specified time. You
  /// must specify either the startTime and endTime or the taskId, but not both.
  ///
  /// Parameter [taskId] :
  /// A filter to limit results to the audit with the specified ID. You must
  /// specify either the taskId or the startTime and endTime, but not both.
  Future<ListAuditFindingsResponse> listAuditFindings({
    String? checkName,
    DateTime? endTime,
    bool? listSuppressedFindings,
    int? maxResults,
    String? nextToken,
    ResourceIdentifier? resourceIdentifier,
    DateTime? startTime,
    String? taskId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $payload = <String, dynamic>{
      if (checkName != null) 'checkName': checkName,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (listSuppressedFindings != null)
        'listSuppressedFindings': listSuppressedFindings,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceIdentifier != null) 'resourceIdentifier': resourceIdentifier,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (taskId != null) 'taskId': taskId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audit/findings',
      exceptionFnMap: _exceptionFns,
    );
    return ListAuditFindingsResponse.fromJson(response);
  }

  /// Gets the status of audit mitigation action tasks that were executed.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListAuditMitigationActionsExecutions</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [findingId] :
  /// Specify this filter to limit results to those that were applied to a
  /// specific audit finding.
  ///
  /// Parameter [taskId] :
  /// Specify this filter to limit results to actions for a specific audit
  /// mitigation actions task.
  ///
  /// Parameter [actionStatus] :
  /// Specify this filter to limit results to those with a specific status.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListAuditMitigationActionsExecutionsResponse>
      listAuditMitigationActionsExecutions({
    required String findingId,
    required String taskId,
    AuditMitigationActionsExecutionStatus? actionStatus,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      'findingId': [findingId],
      'taskId': [taskId],
      if (actionStatus != null) 'actionStatus': [actionStatus.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/mitigationactions/executions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAuditMitigationActionsExecutionsResponse.fromJson(response);
  }

  /// Gets a list of audit mitigation action tasks that match the specified
  /// filters.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListAuditMitigationActionsTasks</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [endTime] :
  /// Specify this filter to limit results to tasks that were completed or
  /// canceled on or before a specific date and time.
  ///
  /// Parameter [startTime] :
  /// Specify this filter to limit results to tasks that began on or after a
  /// specific date and time.
  ///
  /// Parameter [auditTaskId] :
  /// Specify this filter to limit results to tasks that were applied to results
  /// for a specific audit.
  ///
  /// Parameter [findingId] :
  /// Specify this filter to limit results to tasks that were applied to a
  /// specific audit finding.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [taskStatus] :
  /// Specify this filter to limit results to tasks that are in a specific
  /// state.
  Future<ListAuditMitigationActionsTasksResponse>
      listAuditMitigationActionsTasks({
    required DateTime endTime,
    required DateTime startTime,
    String? auditTaskId,
    String? findingId,
    int? maxResults,
    String? nextToken,
    AuditMitigationActionsTaskStatus? taskStatus,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      'endTime': [_s.iso8601ToJson(endTime).toString()],
      'startTime': [_s.iso8601ToJson(startTime).toString()],
      if (auditTaskId != null) 'auditTaskId': [auditTaskId],
      if (findingId != null) 'findingId': [findingId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (taskStatus != null) 'taskStatus': [taskStatus.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/mitigationactions/tasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAuditMitigationActionsTasksResponse.fromJson(response);
  }

  /// Lists your Device Defender audit listings.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListAuditSuppressions</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Determines whether suppressions are listed in ascending order by
  /// expiration date or not. If parameter isn't provided,
  /// <code>ascendingOrder=true</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListAuditSuppressionsResponse> listAuditSuppressions({
    bool? ascendingOrder,
    String? checkName,
    int? maxResults,
    String? nextToken,
    ResourceIdentifier? resourceIdentifier,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $payload = <String, dynamic>{
      if (ascendingOrder != null) 'ascendingOrder': ascendingOrder,
      if (checkName != null) 'checkName': checkName,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceIdentifier != null) 'resourceIdentifier': resourceIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audit/suppressions/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListAuditSuppressionsResponse.fromJson(response);
  }

  /// Lists the Device Defender audits that have been performed during a given
  /// time period.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListAuditTasks</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [endTime] :
  /// The end of the time period.
  ///
  /// Parameter [startTime] :
  /// The beginning of the time period. Audit information is retained for a
  /// limited time (90 days). Requesting a start time prior to what is retained
  /// results in an "InvalidRequestException".
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [taskStatus] :
  /// A filter to limit the output to audits with the specified completion
  /// status: can be one of "IN_PROGRESS", "COMPLETED", "FAILED", or "CANCELED".
  ///
  /// Parameter [taskType] :
  /// A filter to limit the output to the specified type of audit: can be one of
  /// "ON_DEMAND_AUDIT_TASK" or "SCHEDULED__AUDIT_TASK".
  Future<ListAuditTasksResponse> listAuditTasks({
    required DateTime endTime,
    required DateTime startTime,
    int? maxResults,
    String? nextToken,
    AuditTaskStatus? taskStatus,
    AuditTaskType? taskType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      'endTime': [_s.iso8601ToJson(endTime).toString()],
      'startTime': [_s.iso8601ToJson(startTime).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (taskStatus != null) 'taskStatus': [taskStatus.value],
      if (taskType != null) 'taskType': [taskType.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/tasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAuditTasksResponse.fromJson(response);
  }

  /// Lists the authorizers registered in your account.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListAuthorizers</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Return the list of authorizers in ascending alphabetical order.
  ///
  /// Parameter [marker] :
  /// A marker used to get the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [status] :
  /// The status of the list authorizers request.
  Future<ListAuthorizersResponse> listAuthorizers({
    bool? ascendingOrder,
    String? marker,
    int? pageSize,
    AuthorizerStatus? status,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/authorizers/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAuthorizersResponse.fromJson(response);
  }

  /// Lists the billing groups you have created.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListBillingGroups</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per request.
  ///
  /// Parameter [namePrefixFilter] :
  /// Limit the results to billing groups whose names have the given prefix.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListBillingGroupsResponse> listBillingGroups({
    int? maxResults,
    String? namePrefixFilter,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (namePrefixFilter != null) 'namePrefixFilter': [namePrefixFilter],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/billing-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBillingGroupsResponse.fromJson(response);
  }

  /// Lists the CA certificates registered for your Amazon Web Services account.
  ///
  /// The results are paginated with a default page size of 25. You can use the
  /// returned marker to retrieve additional results.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListCACertificates</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Determines the order of the results.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  ///
  /// Parameter [templateName] :
  /// The name of the provisioning template.
  Future<ListCACertificatesResponse> listCACertificates({
    bool? ascendingOrder,
    String? marker,
    int? pageSize,
    String? templateName,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
      if (templateName != null) 'templateName': [templateName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cacertificates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCACertificatesResponse.fromJson(response);
  }

  /// Lists all your certificate providers in your Amazon Web Services account.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListCertificateProviders</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Returns the list of certificate providers in ascending alphabetical order.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> if there are
  /// no more results.
  Future<ListCertificateProvidersResponse> listCertificateProviders({
    bool? ascendingOrder,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/certificate-providers/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCertificateProvidersResponse.fromJson(response);
  }

  /// Lists the certificates registered in your Amazon Web Services account.
  ///
  /// The results are paginated with a default page size of 25. You can use the
  /// returned marker to retrieve additional results.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListCertificates</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Specifies the order for results. If True, the results are returned in
  /// ascending order, based on the creation date.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  Future<ListCertificatesResponse> listCertificates({
    bool? ascendingOrder,
    String? marker,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/certificates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCertificatesResponse.fromJson(response);
  }

  /// List the device certificates signed by the specified CA certificate.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListCertificatesByCA</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [caCertificateId] :
  /// The ID of the CA certificate. This operation will list all registered
  /// device certificate that were signed by this CA certificate.
  ///
  /// Parameter [ascendingOrder] :
  /// Specifies the order for results. If True, the results are returned in
  /// ascending order, based on the creation date.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  Future<ListCertificatesByCAResponse> listCertificatesByCA({
    required String caCertificateId,
    bool? ascendingOrder,
    String? marker,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/certificates-by-ca/${Uri.encodeComponent(caCertificateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCertificatesByCAResponse.fromJson(response);
  }

  /// Lists your Device Defender detect custom metrics.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListCustomMetrics</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListCustomMetricsResponse> listCustomMetrics({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/custom-metrics',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCustomMetricsResponse.fromJson(response);
  }

  /// Lists mitigation actions executions for a Device Defender ML Detect
  /// Security Profile.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListDetectMitigationActionsExecutions</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [endTime] :
  /// The end of the time period for which ML Detect mitigation actions
  /// executions are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [startTime] :
  /// A filter to limit results to those found after the specified time. You
  /// must specify either the startTime and endTime or the taskId, but not both.
  ///
  /// Parameter [taskId] :
  /// The unique identifier of the task.
  ///
  /// Parameter [thingName] :
  /// The name of the thing whose mitigation actions are listed.
  ///
  /// Parameter [violationId] :
  /// The unique identifier of the violation.
  Future<ListDetectMitigationActionsExecutionsResponse>
      listDetectMitigationActionsExecutions({
    DateTime? endTime,
    int? maxResults,
    String? nextToken,
    DateTime? startTime,
    String? taskId,
    String? thingName,
    String? violationId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (startTime != null)
        'startTime': [_s.iso8601ToJson(startTime).toString()],
      if (taskId != null) 'taskId': [taskId],
      if (thingName != null) 'thingName': [thingName],
      if (violationId != null) 'violationId': [violationId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detect/mitigationactions/executions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDetectMitigationActionsExecutionsResponse.fromJson(response);
  }

  /// List of Device Defender ML Detect mitigation actions tasks.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListDetectMitigationActionsTasks</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [endTime] :
  /// The end of the time period for which ML Detect mitigation actions tasks
  /// are returned.
  ///
  /// Parameter [startTime] :
  /// A filter to limit results to those found after the specified time. You
  /// must specify either the startTime and endTime or the taskId, but not both.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListDetectMitigationActionsTasksResponse>
      listDetectMitigationActionsTasks({
    required DateTime endTime,
    required DateTime startTime,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      'endTime': [_s.iso8601ToJson(endTime).toString()],
      'startTime': [_s.iso8601ToJson(startTime).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detect/mitigationactions/tasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDetectMitigationActionsTasksResponse.fromJson(response);
  }

  /// List the set of dimensions that are defined for your Amazon Web Services
  /// accounts.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListDimensions</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListDimensionsResponse> listDimensions({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/dimensions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDimensionsResponse.fromJson(response);
  }

  /// Gets a list of domain configurations for the user. This list is sorted
  /// alphabetically by domain configuration name.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListDomainConfigurations</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  ///
  /// Parameter [serviceType] :
  /// The type of service delivered by the endpoint.
  Future<ListDomainConfigurationsResponse> listDomainConfigurations({
    String? marker,
    int? pageSize,
    ServiceType? serviceType,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
      if (serviceType != null) 'serviceType': [serviceType.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/domainConfigurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainConfigurationsResponse.fromJson(response);
  }

  /// Lists all your fleet metrics.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListFleetMetrics</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <code>null</code> to receive the first set
  /// of results.
  Future<ListFleetMetricsResponse> listFleetMetrics({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/fleet-metrics',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFleetMetricsResponse.fromJson(response);
  }

  /// Lists the search indices.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListIndices</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token used to get the next set of results, or <code>null</code> if
  /// there are no additional results.
  Future<ListIndicesResponse> listIndices({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/indices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIndicesResponse.fromJson(response);
  }

  /// Lists the job executions for a job.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListJobExecutionsForJob</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier you assigned to this job when it was created.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  ///
  /// Parameter [status] :
  /// The status of the job.
  Future<ListJobExecutionsForJobResponse> listJobExecutionsForJob({
    required String jobId,
    int? maxResults,
    String? nextToken,
    JobExecutionStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}/things',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobExecutionsForJobResponse.fromJson(response);
  }

  /// Lists the job executions for the specified thing.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListJobExecutionsForThing</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [thingName] :
  /// The thing name.
  ///
  /// Parameter [jobId] :
  /// The unique identifier you assigned to this job when it was created.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [namespaceId] :
  /// The namespace used to indicate that a job is a customer-managed job.
  ///
  /// When you specify a value for this parameter, Amazon Web Services IoT Core
  /// sends jobs notifications to MQTT topics that contain the value in the
  /// following format.
  ///
  /// <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code>
  /// <note>
  /// The <code>namespaceId</code> feature is only supported by IoT Greengrass
  /// at this time. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/setting-up.html">Setting
  /// up IoT Greengrass core devices.</a>
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  ///
  /// Parameter [status] :
  /// An optional filter that lets you search for jobs that have the specified
  /// status.
  Future<ListJobExecutionsForThingResponse> listJobExecutionsForThing({
    required String thingName,
    String? jobId,
    int? maxResults,
    String? namespaceId,
    String? nextToken,
    JobExecutionStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (jobId != null) 'jobId': [jobId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (namespaceId != null) 'namespaceId': [namespaceId],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobExecutionsForThingResponse.fromJson(response);
  }

  /// Returns a list of job templates.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListJobTemplates</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the list.
  ///
  /// Parameter [nextToken] :
  /// The token to use to return the next set of results in the list.
  Future<ListJobTemplatesResponse> listJobTemplates({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/job-templates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobTemplatesResponse.fromJson(response);
  }

  /// Lists jobs.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListJobs</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per request.
  ///
  /// Parameter [namespaceId] :
  /// The namespace used to indicate that a job is a customer-managed job.
  ///
  /// When you specify a value for this parameter, Amazon Web Services IoT Core
  /// sends jobs notifications to MQTT topics that contain the value in the
  /// following format.
  ///
  /// <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code>
  /// <note>
  /// The <code>namespaceId</code> feature is only supported by IoT Greengrass
  /// at this time. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/setting-up.html">Setting
  /// up IoT Greengrass core devices.</a>
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  ///
  /// Parameter [status] :
  /// An optional filter that lets you search for jobs that have the specified
  /// status.
  ///
  /// Parameter [targetSelection] :
  /// Specifies whether the job will continue to run (CONTINUOUS), or will be
  /// complete after all those things specified as targets have completed the
  /// job (SNAPSHOT). If continuous, the job may also be run on a thing when a
  /// change is detected in a target. For example, a job will run on a thing
  /// when the thing is added to a target group, even after the job was
  /// completed by all things originally in the group.
  /// <note>
  /// We recommend that you use continuous jobs instead of snapshot jobs for
  /// dynamic thing group targets. By using continuous jobs, devices that join
  /// the group receive the job execution even after the job has been created.
  /// </note>
  ///
  /// Parameter [thingGroupId] :
  /// A filter that limits the returned jobs to those for the specified group.
  ///
  /// Parameter [thingGroupName] :
  /// A filter that limits the returned jobs to those for the specified group.
  Future<ListJobsResponse> listJobs({
    int? maxResults,
    String? namespaceId,
    String? nextToken,
    JobStatus? status,
    TargetSelection? targetSelection,
    String? thingGroupId,
    String? thingGroupName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (namespaceId != null) 'namespaceId': [namespaceId],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.value],
      if (targetSelection != null) 'targetSelection': [targetSelection.value],
      if (thingGroupId != null) 'thingGroupId': [thingGroupId],
      if (thingGroupName != null) 'thingGroupName': [thingGroupName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobsResponse.fromJson(response);
  }

  /// Returns a list of managed job templates.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of entries that can be returned.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  ///
  /// Parameter [templateName] :
  /// An optional parameter for template name. If specified, only the versions
  /// of the managed job templates that have the specified template name will be
  /// returned.
  Future<ListManagedJobTemplatesResponse> listManagedJobTemplates({
    int? maxResults,
    String? nextToken,
    String? templateName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (templateName != null) 'templateName': [templateName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/managed-job-templates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedJobTemplatesResponse.fromJson(response);
  }

  /// Lists the values reported for an IoT Device Defender metric (device-side
  /// metric, cloud-side metric, or custom metric) by the given thing during the
  /// specified time period.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [endTime] :
  /// The end of the time period for which metric values are returned.
  ///
  /// Parameter [metricName] :
  /// The name of the security profile metric for which values are returned.
  ///
  /// Parameter [startTime] :
  /// The start of the time period for which metric values are returned.
  ///
  /// Parameter [thingName] :
  /// The name of the thing for which security profile metric values are
  /// returned.
  ///
  /// Parameter [dimensionName] :
  /// The dimension name.
  ///
  /// Parameter [dimensionValueOperator] :
  /// The dimension value operator.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListMetricValuesResponse> listMetricValues({
    required DateTime endTime,
    required String metricName,
    required DateTime startTime,
    required String thingName,
    String? dimensionName,
    DimensionValueOperator? dimensionValueOperator,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      'endTime': [_s.iso8601ToJson(endTime).toString()],
      'metricName': [metricName],
      'startTime': [_s.iso8601ToJson(startTime).toString()],
      'thingName': [thingName],
      if (dimensionName != null) 'dimensionName': [dimensionName],
      if (dimensionValueOperator != null)
        'dimensionValueOperator': [dimensionValueOperator.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/metric-values',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMetricValuesResponse.fromJson(response);
  }

  /// Gets a list of all mitigation actions that match the specified filter
  /// criteria.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListMitigationActions</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [actionType] :
  /// Specify a value to limit the result to mitigation actions with a specific
  /// action type.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListMitigationActionsResponse> listMitigationActions({
    MitigationActionType? actionType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (actionType != null) 'actionType': [actionType.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/mitigationactions/actions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMitigationActionsResponse.fromJson(response);
  }

  /// Lists OTA updates.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListOTAUpdates</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token used to retrieve the next set of results.
  ///
  /// Parameter [otaUpdateStatus] :
  /// The OTA update job status.
  Future<ListOTAUpdatesResponse> listOTAUpdates({
    int? maxResults,
    String? nextToken,
    OTAUpdateStatus? otaUpdateStatus,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (otaUpdateStatus != null) 'otaUpdateStatus': [otaUpdateStatus.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/otaUpdates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOTAUpdatesResponse.fromJson(response);
  }

  /// Lists certificates that are being transferred but not yet accepted.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListOutgoingCertificates</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Specifies the order for results. If True, the results are returned in
  /// ascending order, based on the creation date.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  Future<ListOutgoingCertificatesResponse> listOutgoingCertificates({
    bool? ascendingOrder,
    String? marker,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/certificates-out-going',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOutgoingCertificatesResponse.fromJson(response);
  }

  /// Lists the software package versions associated to the account.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListPackageVersions</a>
  /// action.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [packageName] :
  /// The name of the target software package.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [status] :
  /// The status of the package version. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/preparing-to-use-software-package-catalog.html#package-version-lifecycle">Package
  /// version lifecycle</a>.
  Future<ListPackageVersionsResponse> listPackageVersions({
    required String packageName,
    int? maxResults,
    String? nextToken,
    PackageVersionStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/packages/${Uri.encodeComponent(packageName)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackageVersionsResponse.fromJson(response);
  }

  /// Lists the software packages associated to the account.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListPackages</a>
  /// action.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListPackagesResponse> listPackages({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/packages',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackagesResponse.fromJson(response);
  }

  /// Lists your policies.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListPolicies</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Specifies the order for results. If true, the results are returned in
  /// ascending creation order.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  Future<ListPoliciesResponse> listPolicies({
    bool? ascendingOrder,
    String? marker,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/policies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPoliciesResponse.fromJson(response);
  }

  /// Lists the principals associated with the specified policy.
  ///
  /// <b>Note:</b> This action is deprecated and works as expected for backward
  /// compatibility, but we won't add enhancements. Use
  /// <a>ListTargetsForPolicy</a> instead.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListPolicyPrincipals</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyName] :
  /// The policy name.
  ///
  /// Parameter [ascendingOrder] :
  /// Specifies the order for results. If true, the results are returned in
  /// ascending creation order.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  @Deprecated('Deprecated')
  Future<ListPolicyPrincipalsResponse> listPolicyPrincipals({
    required String policyName,
    bool? ascendingOrder,
    String? marker,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final headers = <String, String>{
      'x-amzn-iot-policy': policyName.toString(),
    };
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/policy-principals',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListPolicyPrincipalsResponse.fromJson(response);
  }

  /// Lists the versions of the specified policy and identifies the default
  /// version.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListPolicyVersions</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyName] :
  /// The policy name.
  Future<ListPolicyVersionsResponse> listPolicyVersions({
    required String policyName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/policies/${Uri.encodeComponent(policyName)}/version',
      exceptionFnMap: _exceptionFns,
    );
    return ListPolicyVersionsResponse.fromJson(response);
  }

  /// Lists the policies attached to the specified principal. If you use an
  /// Cognito identity, the ID must be in <a
  /// href="https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetCredentialsForIdentity.html#API_GetCredentialsForIdentity_RequestSyntax">AmazonCognito
  /// Identity format</a>.
  ///
  /// <b>Note:</b> This action is deprecated and works as expected for backward
  /// compatibility, but we won't add enhancements. Use
  /// <a>ListAttachedPolicies</a> instead.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListPrincipalPolicies</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [principal] :
  /// The principal. Valid principals are CertificateArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>),
  /// thingGroupArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>)
  /// and CognitoId (<i>region</i>:<i>id</i>).
  ///
  /// Parameter [ascendingOrder] :
  /// Specifies the order for results. If true, results are returned in
  /// ascending creation order.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  @Deprecated('Deprecated')
  Future<ListPrincipalPoliciesResponse> listPrincipalPolicies({
    required String principal,
    bool? ascendingOrder,
    String? marker,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final headers = <String, String>{
      'x-amzn-iot-principal': principal.toString(),
    };
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/principal-policies',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListPrincipalPoliciesResponse.fromJson(response);
  }

  /// Lists the things associated with the specified principal. A principal can
  /// be X.509 certificates, IAM users, groups, and roles, Amazon Cognito
  /// identities or federated identities.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListPrincipalThings</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [principal] :
  /// The principal.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListPrincipalThingsResponse> listPrincipalThings({
    required String principal,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final headers = <String, String>{
      'x-amzn-principal': principal.toString(),
    };
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/principals/things',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListPrincipalThingsResponse.fromJson(response);
  }

  /// A list of provisioning template versions.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListProvisioningTemplateVersions</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [templateName] :
  /// The name of the provisioning template.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next set of results.
  Future<ListProvisioningTemplateVersionsResponse>
      listProvisioningTemplateVersions({
    required String templateName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/provisioning-templates/${Uri.encodeComponent(templateName)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProvisioningTemplateVersionsResponse.fromJson(response);
  }

  /// Lists the provisioning templates in your Amazon Web Services account.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListProvisioningTemplates</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next set of results.
  Future<ListProvisioningTemplatesResponse> listProvisioningTemplates({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/provisioning-templates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProvisioningTemplatesResponse.fromJson(response);
  }

  /// The related resources of an Audit finding. The following resources can be
  /// returned from calling this API:
  ///
  /// <ul>
  /// <li>
  /// DEVICE_CERTIFICATE
  /// </li>
  /// <li>
  /// CA_CERTIFICATE
  /// </li>
  /// <li>
  /// IOT_POLICY
  /// </li>
  /// <li>
  /// COGNITO_IDENTITY_POOL
  /// </li>
  /// <li>
  /// CLIENT_ID
  /// </li>
  /// <li>
  /// ACCOUNT_SETTINGS
  /// </li>
  /// <li>
  /// ROLE_ALIAS
  /// </li>
  /// <li>
  /// IAM_ROLE
  /// </li>
  /// <li>
  /// ISSUER_CERTIFICATE
  /// </li>
  /// </ul> <note>
  /// This API is similar to DescribeAuditFinding's <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_DescribeAuditFinding.html">RelatedResources</a>
  /// but provides pagination and is not limited to 10 resources. When calling
  /// <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_DescribeAuditFinding.html">DescribeAuditFinding</a>
  /// for the intermediate CA revoked for active device certificates check,
  /// RelatedResources will not be populated. You must use this API,
  /// ListRelatedResourcesForAuditFinding, to list the certificates.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [findingId] :
  /// The finding Id.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  Future<ListRelatedResourcesForAuditFindingResponse>
      listRelatedResourcesForAuditFinding({
    required String findingId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      'findingId': [findingId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/relatedResources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRelatedResourcesForAuditFindingResponse.fromJson(response);
  }

  /// Lists the role aliases registered in your account.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListRoleAliases</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Return the list of role aliases in ascending alphabetical order.
  ///
  /// Parameter [marker] :
  /// A marker used to get the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return at one time.
  Future<ListRoleAliasesResponse> listRoleAliases({
    bool? ascendingOrder,
    String? marker,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/role-aliases',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRoleAliasesResponse.fromJson(response);
  }

  /// Lists all of your scheduled audits.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListScheduledAudits</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListScheduledAuditsResponse> listScheduledAudits({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/scheduledaudits',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListScheduledAuditsResponse.fromJson(response);
  }

  /// Lists the Device Defender security profiles you've created. You can filter
  /// security profiles by dimension or custom metric.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListSecurityProfiles</a>
  /// action.
  /// <note>
  /// <code>dimensionName</code> and <code>metricName</code> cannot be used in
  /// the same request.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [dimensionName] :
  /// A filter to limit results to the security profiles that use the defined
  /// dimension. Cannot be used with <code>metricName</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [metricName] :
  /// The name of the custom metric. Cannot be used with
  /// <code>dimensionName</code>.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListSecurityProfilesResponse> listSecurityProfiles({
    String? dimensionName,
    int? maxResults,
    String? metricName,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (dimensionName != null) 'dimensionName': [dimensionName],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (metricName != null) 'metricName': [metricName],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/security-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSecurityProfilesResponse.fromJson(response);
  }

  /// Lists the Device Defender security profiles attached to a target (thing
  /// group).
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListSecurityProfilesForTarget</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [securityProfileTargetArn] :
  /// The ARN of the target (thing group) whose attached security profiles you
  /// want to get.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [recursive] :
  /// If true, return child groups too.
  Future<ListSecurityProfilesForTargetResponse> listSecurityProfilesForTarget({
    required String securityProfileTargetArn,
    int? maxResults,
    String? nextToken,
    bool? recursive,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      'securityProfileTargetArn': [securityProfileTargetArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (recursive != null) 'recursive': [recursive.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/security-profiles-for-target',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSecurityProfilesForTargetResponse.fromJson(response);
  }

  /// Lists all of the streams in your Amazon Web Services account.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListStreams</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Set to true to return the list of streams in ascending order.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at a time.
  ///
  /// Parameter [nextToken] :
  /// A token used to get the next set of results.
  Future<ListStreamsResponse> listStreams({
    bool? ascendingOrder,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/streams',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStreamsResponse.fromJson(response);
  }

  /// Lists the tags (metadata) you have assigned to the resource.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListTagsForResource</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// List targets for the specified policy.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListTargetsForPolicy</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [policyName] :
  /// The policy name.
  ///
  /// Parameter [marker] :
  /// A marker used to get the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return at one time.
  Future<ListTargetsForPolicyResponse> listTargetsForPolicy({
    required String policyName,
    String? marker,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/policy-targets/${Uri.encodeComponent(policyName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTargetsForPolicyResponse.fromJson(response);
  }

  /// Lists the targets (thing groups) associated with a given Device Defender
  /// security profile.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListTargetsForSecurityProfile</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [securityProfileName] :
  /// The security profile.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListTargetsForSecurityProfileResponse> listTargetsForSecurityProfile({
    required String securityProfileName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(securityProfileName)}/targets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTargetsForSecurityProfileResponse.fromJson(response);
  }

  /// List the thing groups in your account.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListThingGroups</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [namePrefixFilter] :
  /// A filter that limits the results to those with the specified name prefix.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [parentGroup] :
  /// A filter that limits the results to those with the specified parent group.
  ///
  /// Parameter [recursive] :
  /// If true, return child groups as well.
  Future<ListThingGroupsResponse> listThingGroups({
    int? maxResults,
    String? namePrefixFilter,
    String? nextToken,
    String? parentGroup,
    bool? recursive,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (namePrefixFilter != null) 'namePrefixFilter': [namePrefixFilter],
      if (nextToken != null) 'nextToken': [nextToken],
      if (parentGroup != null) 'parentGroup': [parentGroup],
      if (recursive != null) 'recursive': [recursive.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/thing-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingGroupsResponse.fromJson(response);
  }

  /// List the thing groups to which the specified thing belongs.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListThingGroupsForThing</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [thingName] :
  /// The thing name.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListThingGroupsForThingResponse> listThingGroupsForThing({
    required String thingName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/thing-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingGroupsForThingResponse.fromJson(response);
  }

  /// Lists the principals associated with the specified thing. A principal can
  /// be X.509 certificates, IAM users, groups, and roles, Amazon Cognito
  /// identities or federated identities.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListThingPrincipals</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListThingPrincipalsResponse> listThingPrincipals({
    required String thingName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/principals',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingPrincipalsResponse.fromJson(response);
  }

  /// Information about the thing registration tasks.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [reportType] :
  /// The type of task report.
  ///
  /// Parameter [taskId] :
  /// The id of the task.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per request.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListThingRegistrationTaskReportsResponse>
      listThingRegistrationTaskReports({
    required ReportType reportType,
    required String taskId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      'reportType': [reportType.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/thing-registration-tasks/${Uri.encodeComponent(taskId)}/reports',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingRegistrationTaskReportsResponse.fromJson(response);
  }

  /// List bulk thing provisioning tasks.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListThingRegistrationTasks</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [status] :
  /// The status of the bulk thing provisioning task.
  Future<ListThingRegistrationTasksResponse> listThingRegistrationTasks({
    int? maxResults,
    String? nextToken,
    Status? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/thing-registration-tasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingRegistrationTasksResponse.fromJson(response);
  }

  /// Lists the existing thing types.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListThingTypes</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [thingTypeName] :
  /// The name of the thing type.
  Future<ListThingTypesResponse> listThingTypes({
    int? maxResults,
    String? nextToken,
    String? thingTypeName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (thingTypeName != null) 'thingTypeName': [thingTypeName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/thing-types',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingTypesResponse.fromJson(response);
  }

  /// Lists your things. Use the <b>attributeName</b> and <b>attributeValue</b>
  /// parameters to filter your things. For example, calling
  /// <code>ListThings</code> with attributeName=Color and attributeValue=Red
  /// retrieves all things in the registry that contain an attribute
  /// <b>Color</b> with the value <b>Red</b>. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/thing-registry.html#list-things">List
  /// Things</a> from the <i>Amazon Web Services IoT Core Developer Guide</i>.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListThings</a>
  /// action.
  /// <note>
  /// You will not be charged for calling this API if an <code>Access
  /// denied</code> error is returned. You will also not be charged if no
  /// attributes or pagination token was provided in request and no pagination
  /// token and no results were returned.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [attributeName] :
  /// The attribute name used to search for things.
  ///
  /// Parameter [attributeValue] :
  /// The attribute value used to search for things.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [thingTypeName] :
  /// The name of the thing type used to search for things.
  ///
  /// Parameter [usePrefixAttributeValue] :
  /// When <code>true</code>, the action returns the thing resources with
  /// attribute values that start with the <code>attributeValue</code> provided.
  ///
  /// When <code>false</code>, or not present, the action returns only the thing
  /// resources with attribute values that match the entire
  /// <code>attributeValue</code> provided.
  Future<ListThingsResponse> listThings({
    String? attributeName,
    String? attributeValue,
    int? maxResults,
    String? nextToken,
    String? thingTypeName,
    bool? usePrefixAttributeValue,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (attributeName != null) 'attributeName': [attributeName],
      if (attributeValue != null) 'attributeValue': [attributeValue],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (thingTypeName != null) 'thingTypeName': [thingTypeName],
      if (usePrefixAttributeValue != null)
        'usePrefixAttributeValue': [usePrefixAttributeValue.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/things',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingsResponse.fromJson(response);
  }

  /// Lists the things you have added to the given billing group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListThingsInBillingGroup</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [billingGroupName] :
  /// The name of the billing group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per request.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListThingsInBillingGroupResponse> listThingsInBillingGroup({
    required String billingGroupName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/billing-groups/${Uri.encodeComponent(billingGroupName)}/things',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingsInBillingGroupResponse.fromJson(response);
  }

  /// Lists the things in the specified group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListThingsInThingGroup</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [thingGroupName] :
  /// The thing group name.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [recursive] :
  /// When true, list things in this thing group and in all child groups as
  /// well.
  Future<ListThingsInThingGroupResponse> listThingsInThingGroup({
    required String thingGroupName,
    int? maxResults,
    String? nextToken,
    bool? recursive,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (recursive != null) 'recursive': [recursive.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/thing-groups/${Uri.encodeComponent(thingGroupName)}/things',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingsInThingGroupResponse.fromJson(response);
  }

  /// Lists all the topic rule destinations in your Amazon Web Services account.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListTopicRuleDestinations</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListTopicRuleDestinationsResponse> listTopicRuleDestinations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/destinations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTopicRuleDestinationsResponse.fromJson(response);
  }

  /// Lists the rules for the specific topic.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListTopicRules</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [ruleDisabled] :
  /// Specifies whether the rule is disabled.
  ///
  /// Parameter [topic] :
  /// The topic.
  Future<ListTopicRulesResponse> listTopicRules({
    int? maxResults,
    String? nextToken,
    bool? ruleDisabled,
    String? topic,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (ruleDisabled != null) 'ruleDisabled': [ruleDisabled.toString()],
      if (topic != null) 'topic': [topic],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/rules',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTopicRulesResponse.fromJson(response);
  }

  /// Lists logging levels.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListV2LoggingLevels</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [NotConfiguredException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [targetType] :
  /// The type of resource for which you are configuring logging. Must be
  /// <code>THING_Group</code>.
  Future<ListV2LoggingLevelsResponse> listV2LoggingLevels({
    int? maxResults,
    String? nextToken,
    LogTargetType? targetType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (targetType != null) 'targetType': [targetType.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2LoggingLevel',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListV2LoggingLevelsResponse.fromJson(response);
  }

  /// Lists the Device Defender security profile violations discovered during
  /// the given time period. You can use filters to limit the results to those
  /// alerts issued for a particular security profile, behavior, or thing
  /// (device).
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListViolationEvents</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [endTime] :
  /// The end time for the alerts to be listed.
  ///
  /// Parameter [startTime] :
  /// The start time for the alerts to be listed.
  ///
  /// Parameter [behaviorCriteriaType] :
  /// The criteria for a behavior.
  ///
  /// Parameter [listSuppressedAlerts] :
  /// A list of all suppressed alerts.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [securityProfileName] :
  /// A filter to limit results to those alerts generated by the specified
  /// security profile.
  ///
  /// Parameter [thingName] :
  /// A filter to limit results to those alerts caused by the specified thing.
  ///
  /// Parameter [verificationState] :
  /// The verification state of the violation (detect alarm).
  Future<ListViolationEventsResponse> listViolationEvents({
    required DateTime endTime,
    required DateTime startTime,
    BehaviorCriteriaType? behaviorCriteriaType,
    bool? listSuppressedAlerts,
    int? maxResults,
    String? nextToken,
    String? securityProfileName,
    String? thingName,
    VerificationState? verificationState,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      'endTime': [_s.iso8601ToJson(endTime).toString()],
      'startTime': [_s.iso8601ToJson(startTime).toString()],
      if (behaviorCriteriaType != null)
        'behaviorCriteriaType': [behaviorCriteriaType.value],
      if (listSuppressedAlerts != null)
        'listSuppressedAlerts': [listSuppressedAlerts.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (securityProfileName != null)
        'securityProfileName': [securityProfileName],
      if (thingName != null) 'thingName': [thingName],
      if (verificationState != null)
        'verificationState': [verificationState.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/violation-events',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListViolationEventsResponse.fromJson(response);
  }

  /// Set a verification state and provide a description of that verification
  /// state on a violation (detect alarm).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [verificationState] :
  /// The verification state of the violation.
  ///
  /// Parameter [violationId] :
  /// The violation ID.
  ///
  /// Parameter [verificationStateDescription] :
  /// The description of the verification state of the violation (detect alarm).
  Future<void> putVerificationStateOnViolation({
    required VerificationState verificationState,
    required String violationId,
    String? verificationStateDescription,
  }) async {
    final $payload = <String, dynamic>{
      'verificationState': verificationState.value,
      if (verificationStateDescription != null)
        'verificationStateDescription': verificationStateDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/violations/verification-state/${Uri.encodeComponent(violationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Registers a CA certificate with Amazon Web Services IoT Core. There is no
  /// limit to the number of CA certificates you can register in your Amazon Web
  /// Services account. You can register up to 10 CA certificates with the same
  /// <code>CA subject field</code> per Amazon Web Services account.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">RegisterCACertificate</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [RegistrationCodeValidationException].
  /// May throw [InvalidRequestException].
  /// May throw [CertificateValidationException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [caCertificate] :
  /// The CA certificate.
  ///
  /// Parameter [allowAutoRegistration] :
  /// Allows this CA certificate to be used for auto registration of device
  /// certificates.
  ///
  /// Parameter [certificateMode] :
  /// Describes the certificate mode in which the Certificate Authority (CA)
  /// will be registered. If the <code>verificationCertificate</code> field is
  /// not provided, set <code>certificateMode</code> to be
  /// <code>SNI_ONLY</code>. If the <code>verificationCertificate</code> field
  /// is provided, set <code>certificateMode</code> to be <code>DEFAULT</code>.
  /// When <code>certificateMode</code> is not provided, it defaults to
  /// <code>DEFAULT</code>. All the device certificates that are registered
  /// using this CA will be registered in the same certificate mode as the CA.
  /// For more information about certificate mode for device certificates, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_CertificateDescription.html#iot-Type-CertificateDescription-certificateMode">
  /// certificate mode</a>.
  ///
  /// Parameter [registrationConfig] :
  /// Information about the registration configuration.
  ///
  /// Parameter [setAsActive] :
  /// A boolean value that specifies if the CA certificate is set to active.
  ///
  /// Valid values: <code>ACTIVE | INACTIVE</code>
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the CA certificate.
  /// <note>
  /// For URI Request parameters use format: ...key1=value1&amp;key2=value2...
  ///
  /// For the CLI command-line parameter use format: &amp;&amp;tags
  /// "key1=value1&amp;key2=value2..."
  ///
  /// For the cli-input-json file use format: "tags":
  /// "key1=value1&amp;key2=value2..."
  /// </note>
  ///
  /// Parameter [verificationCertificate] :
  /// The private key verification certificate. If <code>certificateMode</code>
  /// is <code>SNI_ONLY</code>, the <code>verificationCertificate</code> field
  /// must be empty. If <code>certificateMode</code> is <code>DEFAULT</code> or
  /// not provided, the <code>verificationCertificate</code> field must not be
  /// empty.
  Future<RegisterCACertificateResponse> registerCACertificate({
    required String caCertificate,
    bool? allowAutoRegistration,
    CertificateMode? certificateMode,
    RegistrationConfig? registrationConfig,
    bool? setAsActive,
    List<Tag>? tags,
    String? verificationCertificate,
  }) async {
    final $query = <String, List<String>>{
      if (allowAutoRegistration != null)
        'allowAutoRegistration': [allowAutoRegistration.toString()],
      if (setAsActive != null) 'setAsActive': [setAsActive.toString()],
    };
    final $payload = <String, dynamic>{
      'caCertificate': caCertificate,
      if (certificateMode != null) 'certificateMode': certificateMode.value,
      if (registrationConfig != null) 'registrationConfig': registrationConfig,
      if (tags != null) 'tags': tags,
      if (verificationCertificate != null)
        'verificationCertificate': verificationCertificate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cacertificate',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return RegisterCACertificateResponse.fromJson(response);
  }

  /// Registers a device certificate with IoT in the same <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_CertificateDescription.html#iot-Type-CertificateDescription-certificateMode">certificate
  /// mode</a> as the signing CA. If you have more than one CA certificate that
  /// has the same subject field, you must specify the CA certificate that was
  /// used to sign the device certificate being registered.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">RegisterCertificate</a>
  /// action.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InvalidRequestException].
  /// May throw [CertificateValidationException].
  /// May throw [CertificateStateException].
  /// May throw [CertificateConflictException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificatePem] :
  /// The certificate data, in PEM format.
  ///
  /// Parameter [caCertificatePem] :
  /// The CA certificate used to sign the device certificate being registered.
  ///
  /// Parameter [setAsActive] :
  /// A boolean value that specifies if the certificate is set to active.
  ///
  /// Valid values: <code>ACTIVE | INACTIVE</code>
  ///
  /// Parameter [status] :
  /// The status of the register certificate request. Valid values that you can
  /// use include <code>ACTIVE</code>, <code>INACTIVE</code>, and
  /// <code>REVOKED</code>.
  Future<RegisterCertificateResponse> registerCertificate({
    required String certificatePem,
    String? caCertificatePem,
    bool? setAsActive,
    CertificateStatus? status,
  }) async {
    final $query = <String, List<String>>{
      if (setAsActive != null) 'setAsActive': [setAsActive.toString()],
    };
    final $payload = <String, dynamic>{
      'certificatePem': certificatePem,
      if (caCertificatePem != null) 'caCertificatePem': caCertificatePem,
      if (status != null) 'status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/certificate/register',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return RegisterCertificateResponse.fromJson(response);
  }

  /// Register a certificate that does not have a certificate authority (CA).
  /// For supported certificates, consult <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/x509-client-certs.html#x509-cert-algorithms">
  /// Certificate signing algorithms supported by IoT</a>.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InvalidRequestException].
  /// May throw [CertificateStateException].
  /// May throw [CertificateValidationException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificatePem] :
  /// The certificate data, in PEM format.
  ///
  /// Parameter [status] :
  /// The status of the register certificate request.
  Future<RegisterCertificateWithoutCAResponse> registerCertificateWithoutCA({
    required String certificatePem,
    CertificateStatus? status,
  }) async {
    final $payload = <String, dynamic>{
      'certificatePem': certificatePem,
      if (status != null) 'status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/certificate/register-no-ca',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterCertificateWithoutCAResponse.fromJson(response);
  }

  /// Provisions a thing in the device registry. RegisterThing calls other IoT
  /// control plane APIs. These calls might exceed your account level <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_iot">
  /// IoT Throttling Limits</a> and cause throttle errors. Please contact <a
  /// href="https://console.aws.amazon.com/support/home">Amazon Web Services
  /// Customer Support</a> to raise your throttling limits if necessary.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">RegisterThing</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingResourceUpdateException].
  /// May throw [ResourceRegistrationFailureException].
  ///
  /// Parameter [templateBody] :
  /// The provisioning template. See <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/provision-w-cert.html">Provisioning
  /// Devices That Have Device Certificates</a> for more information.
  ///
  /// Parameter [parameters] :
  /// The parameters for provisioning a thing. See <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/provision-template.html">Provisioning
  /// Templates</a> for more information.
  Future<RegisterThingResponse> registerThing({
    required String templateBody,
    Map<String, String>? parameters,
  }) async {
    final $payload = <String, dynamic>{
      'templateBody': templateBody,
      if (parameters != null) 'parameters': parameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/things',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterThingResponse.fromJson(response);
  }

  /// Rejects a pending certificate transfer. After IoT rejects a certificate
  /// transfer, the certificate status changes from <b>PENDING_TRANSFER</b> to
  /// <b>INACTIVE</b>.
  ///
  /// To check for pending certificate transfers, call <a>ListCertificates</a>
  /// to enumerate your certificates.
  ///
  /// This operation can only be called by the transfer destination. After it is
  /// called, the certificate will be returned to the source's account in the
  /// INACTIVE state.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">RejectCertificateTransfer</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TransferAlreadyCompletedException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  ///
  /// Parameter [rejectReason] :
  /// The reason the certificate transfer was rejected.
  Future<void> rejectCertificateTransfer({
    required String certificateId,
    String? rejectReason,
  }) async {
    final $payload = <String, dynamic>{
      if (rejectReason != null) 'rejectReason': rejectReason,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/reject-certificate-transfer/${Uri.encodeComponent(certificateId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the given thing from the billing group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">RemoveThingFromBillingGroup</a>
  /// action.
  /// <note>
  /// This call is asynchronous. It might take several seconds for the
  /// detachment to propagate.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billingGroupArn] :
  /// The ARN of the billing group.
  ///
  /// Parameter [billingGroupName] :
  /// The name of the billing group.
  ///
  /// Parameter [thingArn] :
  /// The ARN of the thing to be removed from the billing group.
  ///
  /// Parameter [thingName] :
  /// The name of the thing to be removed from the billing group.
  Future<void> removeThingFromBillingGroup({
    String? billingGroupArn,
    String? billingGroupName,
    String? thingArn,
    String? thingName,
  }) async {
    final $payload = <String, dynamic>{
      if (billingGroupArn != null) 'billingGroupArn': billingGroupArn,
      if (billingGroupName != null) 'billingGroupName': billingGroupName,
      if (thingArn != null) 'thingArn': thingArn,
      if (thingName != null) 'thingName': thingName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/billing-groups/removeThingFromBillingGroup',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Remove the specified thing from the specified group.
  ///
  /// You must specify either a <code>thingGroupArn</code> or a
  /// <code>thingGroupName</code> to identify the thing group and either a
  /// <code>thingArn</code> or a <code>thingName</code> to identify the thing to
  /// remove from the thing group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">RemoveThingFromThingGroup</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [thingArn] :
  /// The ARN of the thing to remove from the group.
  ///
  /// Parameter [thingGroupArn] :
  /// The group ARN.
  ///
  /// Parameter [thingGroupName] :
  /// The group name.
  ///
  /// Parameter [thingName] :
  /// The name of the thing to remove from the group.
  Future<void> removeThingFromThingGroup({
    String? thingArn,
    String? thingGroupArn,
    String? thingGroupName,
    String? thingName,
  }) async {
    final $payload = <String, dynamic>{
      if (thingArn != null) 'thingArn': thingArn,
      if (thingGroupArn != null) 'thingGroupArn': thingGroupArn,
      if (thingGroupName != null) 'thingGroupName': thingGroupName,
      if (thingName != null) 'thingName': thingName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/thing-groups/removeThingFromThingGroup',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Replaces the rule. You must specify all parameters for the new rule.
  /// Creating rules is an administrator-level action. Any user who has
  /// permission to create rules will be able to access data processed by the
  /// rule.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ReplaceTopicRule</a>
  /// action.
  ///
  /// May throw [SqlParseException].
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [ruleName] :
  /// The name of the rule.
  ///
  /// Parameter [topicRulePayload] :
  /// The rule payload.
  Future<void> replaceTopicRule({
    required String ruleName,
    required TopicRulePayload topicRulePayload,
  }) async {
    await _protocol.send(
      payload: topicRulePayload,
      method: 'PATCH',
      requestUri: '/rules/${Uri.encodeComponent(ruleName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The query search index.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">SearchIndex</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidQueryException].
  /// May throw [IndexNotReadyException].
  ///
  /// Parameter [queryString] :
  /// The search query string. For more information about the search query
  /// syntax, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/query-syntax.html">Query
  /// syntax</a>.
  ///
  /// Parameter [indexName] :
  /// The search index name.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page at one time. This maximum
  /// number cannot exceed 100. The response might contain fewer results but
  /// will never contain more. You can use <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_SearchIndex.html#iot-SearchIndex-request-nextToken">
  /// <code>nextToken</code> </a> to retrieve the next set of results until
  /// <code>nextToken</code> returns <code>NULL</code>.
  ///
  /// Parameter [nextToken] :
  /// The token used to get the next set of results, or <code>null</code> if
  /// there are no additional results.
  ///
  /// Parameter [queryVersion] :
  /// The query version.
  Future<SearchIndexResponse> searchIndex({
    required String queryString,
    String? indexName,
    int? maxResults,
    String? nextToken,
    String? queryVersion,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'queryString': queryString,
      if (indexName != null) 'indexName': indexName,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (queryVersion != null) 'queryVersion': queryVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/indices/search',
      exceptionFnMap: _exceptionFns,
    );
    return SearchIndexResponse.fromJson(response);
  }

  /// Sets the default authorizer. This will be used if a websocket connection
  /// is made without specifying an authorizer.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">SetDefaultAuthorizer</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [authorizerName] :
  /// The authorizer name.
  Future<SetDefaultAuthorizerResponse> setDefaultAuthorizer({
    required String authorizerName,
  }) async {
    final $payload = <String, dynamic>{
      'authorizerName': authorizerName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/default-authorizer',
      exceptionFnMap: _exceptionFns,
    );
    return SetDefaultAuthorizerResponse.fromJson(response);
  }

  /// Sets the specified version of the specified policy as the policy's default
  /// (operative) version. This action affects all certificates to which the
  /// policy is attached. To list the principals the policy is attached to, use
  /// the <a>ListPrincipalPolicies</a> action.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">SetDefaultPolicyVersion</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyName] :
  /// The policy name.
  ///
  /// Parameter [policyVersionId] :
  /// The policy version ID.
  Future<void> setDefaultPolicyVersion({
    required String policyName,
    required String policyVersionId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'PATCH',
      requestUri:
          '/policies/${Uri.encodeComponent(policyName)}/version/${Uri.encodeComponent(policyVersionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the logging options.
  ///
  /// NOTE: use of this command is not recommended. Use
  /// <code>SetV2LoggingOptions</code> instead.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">SetLoggingOptions</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [loggingOptionsPayload] :
  /// The logging options payload.
  Future<void> setLoggingOptions({
    required LoggingOptionsPayload loggingOptionsPayload,
  }) async {
    await _protocol.send(
      payload: loggingOptionsPayload,
      method: 'POST',
      requestUri: '/loggingOptions',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the logging level.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">SetV2LoggingLevel</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [NotConfiguredException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [logLevel] :
  /// The log level.
  ///
  /// Parameter [logTarget] :
  /// The log target.
  Future<void> setV2LoggingLevel({
    required LogLevel logLevel,
    required LogTarget logTarget,
  }) async {
    final $payload = <String, dynamic>{
      'logLevel': logLevel.value,
      'logTarget': logTarget,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2LoggingLevel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the logging options for the V2 logging service.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">SetV2LoggingOptions</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [defaultLogLevel] :
  /// The default logging level.
  ///
  /// Parameter [disableAllLogs] :
  /// If true all logs are disabled. The default is false.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the role that allows IoT to write to Cloudwatch logs.
  Future<void> setV2LoggingOptions({
    LogLevel? defaultLogLevel,
    bool? disableAllLogs,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      if (defaultLogLevel != null) 'defaultLogLevel': defaultLogLevel.value,
      if (disableAllLogs != null) 'disableAllLogs': disableAllLogs,
      if (roleArn != null) 'roleArn': roleArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2LoggingOptions',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts a task that applies a set of mitigation actions to the specified
  /// target.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">StartAuditMitigationActionsTask</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TaskAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [auditCheckToActionsMapping] :
  /// For an audit check, specifies which mitigation actions to apply. Those
  /// actions must be defined in your Amazon Web Services accounts.
  ///
  /// Parameter [target] :
  /// Specifies the audit findings to which the mitigation actions are applied.
  /// You can apply them to a type of audit check, to all findings from an
  /// audit, or to a specific set of findings.
  ///
  /// Parameter [taskId] :
  /// A unique identifier for the task. You can use this identifier to check the
  /// status of the task or to cancel it.
  ///
  /// Parameter [clientRequestToken] :
  /// Each audit mitigation task must have a unique client request token. If you
  /// try to start a new task with the same token as a task that already exists,
  /// an exception occurs. If you omit this value, a unique client request token
  /// is generated automatically.
  Future<StartAuditMitigationActionsTaskResponse>
      startAuditMitigationActionsTask({
    required Map<String, List<String>> auditCheckToActionsMapping,
    required AuditMitigationActionsTaskTarget target,
    required String taskId,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'auditCheckToActionsMapping': auditCheckToActionsMapping,
      'target': target,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/audit/mitigationactions/tasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return StartAuditMitigationActionsTaskResponse.fromJson(response);
  }

  /// Starts a Device Defender ML Detect mitigation actions task.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">StartDetectMitigationActionsTask</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TaskAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [actions] :
  /// The actions to be performed when a device has unexpected behavior.
  ///
  /// Parameter [target] :
  /// Specifies the ML Detect findings to which the mitigation actions are
  /// applied.
  ///
  /// Parameter [taskId] :
  /// The unique identifier of the task.
  ///
  /// Parameter [clientRequestToken] :
  /// Each mitigation action task must have a unique client request token. If
  /// you try to create a new task with the same token as a task that already
  /// exists, an exception occurs. If you omit this value, Amazon Web Services
  /// SDKs will automatically generate a unique client request.
  ///
  /// Parameter [includeOnlyActiveViolations] :
  /// Specifies to list only active violations.
  ///
  /// Parameter [includeSuppressedAlerts] :
  /// Specifies to include suppressed alerts.
  ///
  /// Parameter [violationEventOccurrenceRange] :
  /// Specifies the time period of which violation events occurred between.
  Future<StartDetectMitigationActionsTaskResponse>
      startDetectMitigationActionsTask({
    required List<String> actions,
    required DetectMitigationActionsTaskTarget target,
    required String taskId,
    String? clientRequestToken,
    bool? includeOnlyActiveViolations,
    bool? includeSuppressedAlerts,
    ViolationEventOccurrenceRange? violationEventOccurrenceRange,
  }) async {
    final $payload = <String, dynamic>{
      'actions': actions,
      'target': target,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (includeOnlyActiveViolations != null)
        'includeOnlyActiveViolations': includeOnlyActiveViolations,
      if (includeSuppressedAlerts != null)
        'includeSuppressedAlerts': includeSuppressedAlerts,
      if (violationEventOccurrenceRange != null)
        'violationEventOccurrenceRange': violationEventOccurrenceRange,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/detect/mitigationactions/tasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return StartDetectMitigationActionsTaskResponse.fromJson(response);
  }

  /// Starts an on-demand Device Defender audit.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">StartOnDemandAuditTask</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [targetCheckNames] :
  /// Which checks are performed during the audit. The checks you specify must
  /// be enabled for your account or an exception occurs. Use
  /// <code>DescribeAccountAuditConfiguration</code> to see the list of all
  /// checks, including those that are enabled or
  /// <code>UpdateAccountAuditConfiguration</code> to select which checks are
  /// enabled.
  Future<StartOnDemandAuditTaskResponse> startOnDemandAuditTask({
    required List<String> targetCheckNames,
  }) async {
    final $payload = <String, dynamic>{
      'targetCheckNames': targetCheckNames,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audit/tasks',
      exceptionFnMap: _exceptionFns,
    );
    return StartOnDemandAuditTaskResponse.fromJson(response);
  }

  /// Creates a bulk thing provisioning task.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">StartThingRegistrationTask</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [inputFileBucket] :
  /// The S3 bucket that contains the input file.
  ///
  /// Parameter [inputFileKey] :
  /// The name of input file within the S3 bucket. This file contains a newline
  /// delimited JSON file. Each line contains the parameter values to provision
  /// one device (thing).
  ///
  /// Parameter [roleArn] :
  /// The IAM role ARN that grants permission the input file.
  ///
  /// Parameter [templateBody] :
  /// The provisioning template.
  Future<StartThingRegistrationTaskResponse> startThingRegistrationTask({
    required String inputFileBucket,
    required String inputFileKey,
    required String roleArn,
    required String templateBody,
  }) async {
    final $payload = <String, dynamic>{
      'inputFileBucket': inputFileBucket,
      'inputFileKey': inputFileKey,
      'roleArn': roleArn,
      'templateBody': templateBody,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/thing-registration-tasks',
      exceptionFnMap: _exceptionFns,
    );
    return StartThingRegistrationTaskResponse.fromJson(response);
  }

  /// Cancels a bulk thing provisioning task.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">StopThingRegistrationTask</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [taskId] :
  /// The bulk thing provisioning task ID.
  Future<void> stopThingRegistrationTask({
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/thing-registration-tasks/${Uri.encodeComponent(taskId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds to or modifies the tags of the given resource. Tags are metadata
  /// which can be used to manage a resource.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">TagResource</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tags] :
  /// The new or modified tags for the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Tests if a specified principal is authorized to perform an IoT action on a
  /// specified resource. Use this to test and debug the authorization behavior
  /// of devices that connect to the IoT device gateway.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">TestAuthorization</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [authInfos] :
  /// A list of authorization info objects. Simulating authorization will create
  /// a response for each <code>authInfo</code> object in the list.
  ///
  /// Parameter [clientId] :
  /// The MQTT client ID.
  ///
  /// Parameter [cognitoIdentityPoolId] :
  /// The Cognito identity pool ID.
  ///
  /// Parameter [policyNamesToAdd] :
  /// When testing custom authorization, the policies specified here are treated
  /// as if they are attached to the principal being authorized.
  ///
  /// Parameter [policyNamesToSkip] :
  /// When testing custom authorization, the policies specified here are treated
  /// as if they are not attached to the principal being authorized.
  ///
  /// Parameter [principal] :
  /// The principal. Valid principals are CertificateArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>),
  /// thingGroupArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>)
  /// and CognitoId (<i>region</i>:<i>id</i>).
  Future<TestAuthorizationResponse> testAuthorization({
    required List<AuthInfo> authInfos,
    String? clientId,
    String? cognitoIdentityPoolId,
    List<String>? policyNamesToAdd,
    List<String>? policyNamesToSkip,
    String? principal,
  }) async {
    final $query = <String, List<String>>{
      if (clientId != null) 'clientId': [clientId],
    };
    final $payload = <String, dynamic>{
      'authInfos': authInfos,
      if (cognitoIdentityPoolId != null)
        'cognitoIdentityPoolId': cognitoIdentityPoolId,
      if (policyNamesToAdd != null) 'policyNamesToAdd': policyNamesToAdd,
      if (policyNamesToSkip != null) 'policyNamesToSkip': policyNamesToSkip,
      if (principal != null) 'principal': principal,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/test-authorization',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return TestAuthorizationResponse.fromJson(response);
  }

  /// Tests a custom authorization behavior by invoking a specified custom
  /// authorizer. Use this to test and debug the custom authorization behavior
  /// of devices that connect to the IoT device gateway.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">TestInvokeAuthorizer</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidResponseException].
  ///
  /// Parameter [authorizerName] :
  /// The custom authorizer name.
  ///
  /// Parameter [httpContext] :
  /// Specifies a test HTTP authorization request.
  ///
  /// Parameter [mqttContext] :
  /// Specifies a test MQTT authorization request.
  ///
  /// Parameter [tlsContext] :
  /// Specifies a test TLS authorization request.
  ///
  /// Parameter [token] :
  /// The token returned by your custom authentication service.
  ///
  /// Parameter [tokenSignature] :
  /// The signature made with the token and your custom authentication service's
  /// private key. This value must be Base-64-encoded.
  Future<TestInvokeAuthorizerResponse> testInvokeAuthorizer({
    required String authorizerName,
    HttpContext? httpContext,
    MqttContext? mqttContext,
    TlsContext? tlsContext,
    String? token,
    String? tokenSignature,
  }) async {
    final $payload = <String, dynamic>{
      if (httpContext != null) 'httpContext': httpContext,
      if (mqttContext != null) 'mqttContext': mqttContext,
      if (tlsContext != null) 'tlsContext': tlsContext,
      if (token != null) 'token': token,
      if (tokenSignature != null) 'tokenSignature': tokenSignature,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/authorizer/${Uri.encodeComponent(authorizerName)}/test',
      exceptionFnMap: _exceptionFns,
    );
    return TestInvokeAuthorizerResponse.fromJson(response);
  }

  /// Transfers the specified certificate to the specified Amazon Web Services
  /// account.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">TransferCertificate</a>
  /// action.
  ///
  /// You can cancel the transfer until it is acknowledged by the recipient.
  ///
  /// No notification is sent to the transfer destination's account. It is up to
  /// the caller to notify the transfer target.
  ///
  /// The certificate being transferred must not be in the ACTIVE state. You can
  /// use the <a>UpdateCertificate</a> action to deactivate it.
  ///
  /// The certificate must not have any policies attached to it. You can use the
  /// <a>DetachPolicy</a> action to detach them.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [CertificateStateException].
  /// May throw [TransferConflictException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  ///
  /// Parameter [targetAwsAccount] :
  /// The Amazon Web Services account.
  ///
  /// Parameter [transferMessage] :
  /// The transfer message.
  Future<TransferCertificateResponse> transferCertificate({
    required String certificateId,
    required String targetAwsAccount,
    String? transferMessage,
  }) async {
    final $query = <String, List<String>>{
      'targetAwsAccount': [targetAwsAccount],
    };
    final $payload = <String, dynamic>{
      if (transferMessage != null) 'transferMessage': transferMessage,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/transfer-certificate/${Uri.encodeComponent(certificateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return TransferCertificateResponse.fromJson(response);
  }

  /// Removes the given tags (metadata) from the resource.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UntagResource</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tagKeys] :
  /// A list of the keys of the tags to be removed from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/untag',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Configures or reconfigures the Device Defender audit settings for this
  /// account. Settings include how audit notifications are sent and which audit
  /// checks are enabled or disabled.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateAccountAuditConfiguration</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [auditCheckConfigurations] :
  /// Specifies which audit checks are enabled and disabled for this account.
  /// Use <code>DescribeAccountAuditConfiguration</code> to see the list of all
  /// checks, including those that are currently enabled.
  ///
  /// Some data collection might start immediately when certain checks are
  /// enabled. When a check is disabled, any data collected so far in relation
  /// to the check is deleted.
  ///
  /// You cannot disable a check if it's used by any scheduled audit. You must
  /// first delete the check from the scheduled audit or delete the scheduled
  /// audit itself.
  ///
  /// On the first call to <code>UpdateAccountAuditConfiguration</code>, this
  /// parameter is required and must specify at least one enabled check.
  ///
  /// Parameter [auditNotificationTargetConfigurations] :
  /// Information about the targets to which audit notifications are sent.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the role that grants permission to IoT
  /// to access information about your devices, policies, certificates, and
  /// other items as required when performing an audit.
  Future<void> updateAccountAuditConfiguration({
    Map<String, AuditCheckConfiguration>? auditCheckConfigurations,
    Map<AuditNotificationType, AuditNotificationTarget>?
        auditNotificationTargetConfigurations,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      if (auditCheckConfigurations != null)
        'auditCheckConfigurations': auditCheckConfigurations,
      if (auditNotificationTargetConfigurations != null)
        'auditNotificationTargetConfigurations':
            auditNotificationTargetConfigurations
                .map((k, e) => MapEntry(k.value, e)),
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/audit/configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a Device Defender audit suppression.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [description] :
  /// The description of the audit suppression.
  ///
  /// Parameter [expirationDate] :
  /// The expiration date (epoch timestamp in seconds) that you want the
  /// suppression to adhere to.
  ///
  /// Parameter [suppressIndefinitely] :
  /// Indicates whether a suppression should exist indefinitely or not.
  Future<void> updateAuditSuppression({
    required String checkName,
    required ResourceIdentifier resourceIdentifier,
    String? description,
    DateTime? expirationDate,
    bool? suppressIndefinitely,
  }) async {
    final $payload = <String, dynamic>{
      'checkName': checkName,
      'resourceIdentifier': resourceIdentifier,
      if (description != null) 'description': description,
      if (expirationDate != null)
        'expirationDate': unixTimestampToJson(expirationDate),
      if (suppressIndefinitely != null)
        'suppressIndefinitely': suppressIndefinitely,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/audit/suppressions/update',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an authorizer.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateAuthorizer</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [authorizerName] :
  /// The authorizer name.
  ///
  /// Parameter [authorizerFunctionArn] :
  /// The ARN of the authorizer's Lambda function.
  ///
  /// Parameter [enableCachingForHttp] :
  /// When <code>true</code>, the result from the authorizer’s Lambda function
  /// is cached for the time specified in <code>refreshAfterInSeconds</code>.
  /// The cached result is used while the device reuses the same HTTP
  /// connection.
  ///
  /// Parameter [status] :
  /// The status of the update authorizer request.
  ///
  /// Parameter [tokenKeyName] :
  /// The key used to extract the token from the HTTP headers.
  ///
  /// Parameter [tokenSigningPublicKeys] :
  /// The public keys used to verify the token signature.
  Future<UpdateAuthorizerResponse> updateAuthorizer({
    required String authorizerName,
    String? authorizerFunctionArn,
    bool? enableCachingForHttp,
    AuthorizerStatus? status,
    String? tokenKeyName,
    Map<String, String>? tokenSigningPublicKeys,
  }) async {
    final $payload = <String, dynamic>{
      if (authorizerFunctionArn != null)
        'authorizerFunctionArn': authorizerFunctionArn,
      if (enableCachingForHttp != null)
        'enableCachingForHttp': enableCachingForHttp,
      if (status != null) 'status': status.value,
      if (tokenKeyName != null) 'tokenKeyName': tokenKeyName,
      if (tokenSigningPublicKeys != null)
        'tokenSigningPublicKeys': tokenSigningPublicKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/authorizer/${Uri.encodeComponent(authorizerName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAuthorizerResponse.fromJson(response);
  }

  /// Updates information about the billing group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateBillingGroup</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billingGroupName] :
  /// The name of the billing group.
  ///
  /// Parameter [billingGroupProperties] :
  /// The properties of the billing group.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the billing group. If the version of the billing
  /// group does not match the expected version specified in the request, the
  /// <code>UpdateBillingGroup</code> request is rejected with a
  /// <code>VersionConflictException</code>.
  Future<UpdateBillingGroupResponse> updateBillingGroup({
    required String billingGroupName,
    required BillingGroupProperties billingGroupProperties,
    int? expectedVersion,
  }) async {
    final $payload = <String, dynamic>{
      'billingGroupProperties': billingGroupProperties,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/billing-groups/${Uri.encodeComponent(billingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBillingGroupResponse.fromJson(response);
  }

  /// Updates a registered CA certificate.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateCACertificate</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateId] :
  /// The CA certificate identifier.
  ///
  /// Parameter [newAutoRegistrationStatus] :
  /// The new value for the auto registration status. Valid values are: "ENABLE"
  /// or "DISABLE".
  ///
  /// Parameter [newStatus] :
  /// The updated status of the CA certificate.
  ///
  /// <b>Note:</b> The status value REGISTER_INACTIVE is deprecated and should
  /// not be used.
  ///
  /// Parameter [registrationConfig] :
  /// Information about the registration configuration.
  ///
  /// Parameter [removeAutoRegistration] :
  /// If true, removes auto registration.
  Future<void> updateCACertificate({
    required String certificateId,
    AutoRegistrationStatus? newAutoRegistrationStatus,
    CACertificateStatus? newStatus,
    RegistrationConfig? registrationConfig,
    bool? removeAutoRegistration,
  }) async {
    final $query = <String, List<String>>{
      if (newAutoRegistrationStatus != null)
        'newAutoRegistrationStatus': [newAutoRegistrationStatus.value],
      if (newStatus != null) 'newStatus': [newStatus.value],
    };
    final $payload = <String, dynamic>{
      if (registrationConfig != null) 'registrationConfig': registrationConfig,
      if (removeAutoRegistration != null)
        'removeAutoRegistration': removeAutoRegistration,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/cacertificate/${Uri.encodeComponent(certificateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the status of the specified certificate. This operation is
  /// idempotent.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateCertificate</a>
  /// action.
  ///
  /// Certificates must be in the ACTIVE state to authenticate devices that use
  /// a certificate to connect to IoT.
  ///
  /// Within a few minutes of updating a certificate from the ACTIVE state to
  /// any other state, IoT disconnects all devices that used that certificate to
  /// connect. Devices cannot use a certificate that is not in the ACTIVE state
  /// to reconnect.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [CertificateStateException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  ///
  /// Parameter [newStatus] :
  /// The new status.
  ///
  /// <b>Note:</b> Setting the status to PENDING_TRANSFER or PENDING_ACTIVATION
  /// will result in an exception being thrown. PENDING_TRANSFER and
  /// PENDING_ACTIVATION are statuses used internally by IoT. They are not
  /// intended for developer use.
  ///
  /// <b>Note:</b> The status value REGISTER_INACTIVE is deprecated and should
  /// not be used.
  Future<void> updateCertificate({
    required String certificateId,
    required CertificateStatus newStatus,
  }) async {
    final $query = <String, List<String>>{
      'newStatus': [newStatus.value],
    };
    await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/certificates/${Uri.encodeComponent(certificateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a certificate provider.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateCertificateProvider</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateProviderName] :
  /// The name of the certificate provider.
  ///
  /// Parameter [accountDefaultForOperations] :
  /// A list of the operations that the certificate provider will use to
  /// generate certificates. Valid value: <code>CreateCertificateFromCsr</code>.
  ///
  /// Parameter [lambdaFunctionArn] :
  /// The Lambda function ARN that's associated with the certificate provider.
  Future<UpdateCertificateProviderResponse> updateCertificateProvider({
    required String certificateProviderName,
    List<CertificateProviderOperation>? accountDefaultForOperations,
    String? lambdaFunctionArn,
  }) async {
    final $payload = <String, dynamic>{
      if (accountDefaultForOperations != null)
        'accountDefaultForOperations':
            accountDefaultForOperations.map((e) => e.value).toList(),
      if (lambdaFunctionArn != null) 'lambdaFunctionArn': lambdaFunctionArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/certificate-providers/${Uri.encodeComponent(certificateProviderName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCertificateProviderResponse.fromJson(response);
  }

  /// Updates a Device Defender detect custom metric.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateCustomMetric</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [displayName] :
  /// Field represents a friendly name in the console for the custom metric, it
  /// doesn't have to be unique. Don't use this name as the metric identifier in
  /// the device metric report. Can be updated.
  ///
  /// Parameter [metricName] :
  /// The name of the custom metric. Cannot be updated.
  Future<UpdateCustomMetricResponse> updateCustomMetric({
    required String displayName,
    required String metricName,
  }) async {
    final $payload = <String, dynamic>{
      'displayName': displayName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/custom-metric/${Uri.encodeComponent(metricName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCustomMetricResponse.fromJson(response);
  }

  /// Updates the definition for a dimension. You cannot change the type of a
  /// dimension after it is created (you can delete it and recreate it).
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateDimension</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// A unique identifier for the dimension. Choose something that describes the
  /// type and value to make it easy to remember what it does.
  ///
  /// Parameter [stringValues] :
  /// Specifies the value or list of values for the dimension. For
  /// <code>TOPIC_FILTER</code> dimensions, this is a pattern used to match the
  /// MQTT topic (for example, "admin/#").
  Future<UpdateDimensionResponse> updateDimension({
    required String name,
    required List<String> stringValues,
  }) async {
    final $payload = <String, dynamic>{
      'stringValues': stringValues,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/dimensions/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDimensionResponse.fromJson(response);
  }

  /// Updates values stored in the domain configuration. Domain configurations
  /// for default endpoints can't be updated.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateDomainConfiguration</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [CertificateValidationException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [domainConfigurationName] :
  /// The name of the domain configuration to be updated.
  ///
  /// Parameter [authorizerConfig] :
  /// An object that specifies the authorization service for a domain.
  ///
  /// Parameter [domainConfigurationStatus] :
  /// The status to which the domain configuration should be updated.
  ///
  /// Parameter [removeAuthorizerConfig] :
  /// Removes the authorization configuration from a domain.
  ///
  /// Parameter [serverCertificateConfig] :
  /// The server certificate configuration.
  ///
  /// Parameter [tlsConfig] :
  /// An object that specifies the TLS configuration for a domain.
  Future<UpdateDomainConfigurationResponse> updateDomainConfiguration({
    required String domainConfigurationName,
    AuthorizerConfig? authorizerConfig,
    DomainConfigurationStatus? domainConfigurationStatus,
    bool? removeAuthorizerConfig,
    ServerCertificateConfig? serverCertificateConfig,
    TlsConfig? tlsConfig,
  }) async {
    final $payload = <String, dynamic>{
      if (authorizerConfig != null) 'authorizerConfig': authorizerConfig,
      if (domainConfigurationStatus != null)
        'domainConfigurationStatus': domainConfigurationStatus.value,
      if (removeAuthorizerConfig != null)
        'removeAuthorizerConfig': removeAuthorizerConfig,
      if (serverCertificateConfig != null)
        'serverCertificateConfig': serverCertificateConfig,
      if (tlsConfig != null) 'tlsConfig': tlsConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domainConfigurations/${Uri.encodeComponent(domainConfigurationName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDomainConfigurationResponse.fromJson(response);
  }

  /// Updates a dynamic thing group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateDynamicThingGroup</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidQueryException].
  ///
  /// Parameter [thingGroupName] :
  /// The name of the dynamic thing group to update.
  ///
  /// Parameter [thingGroupProperties] :
  /// The dynamic thing group properties to update.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the dynamic thing group to update.
  ///
  /// Parameter [indexName] :
  /// The dynamic thing group index to update.
  /// <note>
  /// Currently one index is supported: <code>AWS_Things</code>.
  /// </note>
  ///
  /// Parameter [queryString] :
  /// The dynamic thing group search query string to update.
  ///
  /// Parameter [queryVersion] :
  /// The dynamic thing group query version to update.
  /// <note>
  /// Currently one query version is supported: "2017-09-30". If not specified,
  /// the query version defaults to this value.
  /// </note>
  Future<UpdateDynamicThingGroupResponse> updateDynamicThingGroup({
    required String thingGroupName,
    required ThingGroupProperties thingGroupProperties,
    int? expectedVersion,
    String? indexName,
    String? queryString,
    String? queryVersion,
  }) async {
    final $payload = <String, dynamic>{
      'thingGroupProperties': thingGroupProperties,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
      if (indexName != null) 'indexName': indexName,
      if (queryString != null) 'queryString': queryString,
      if (queryVersion != null) 'queryVersion': queryVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/dynamic-thing-groups/${Uri.encodeComponent(thingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDynamicThingGroupResponse.fromJson(response);
  }

  /// Updates the event configurations.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateEventConfigurations</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [eventConfigurations] :
  /// The new event configuration values.
  Future<void> updateEventConfigurations({
    Map<EventType, Configuration>? eventConfigurations,
  }) async {
    final $payload = <String, dynamic>{
      if (eventConfigurations != null)
        'eventConfigurations':
            eventConfigurations.map((k, e) => MapEntry(k.value, e)),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/event-configurations',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the data for a fleet metric.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateFleetMetric</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidQueryException].
  /// May throw [InvalidAggregationException].
  /// May throw [VersionConflictException].
  /// May throw [IndexNotReadyException].
  ///
  /// Parameter [indexName] :
  /// The name of the index to search.
  ///
  /// Parameter [metricName] :
  /// The name of the fleet metric to update.
  ///
  /// Parameter [aggregationField] :
  /// The field to aggregate.
  ///
  /// Parameter [aggregationType] :
  /// The type of the aggregation query.
  ///
  /// Parameter [description] :
  /// The description of the fleet metric.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the fleet metric record in the registry.
  ///
  /// Parameter [period] :
  /// The time in seconds between fleet metric emissions. Range [60(1 min),
  /// 86400(1 day)] and must be multiple of 60.
  ///
  /// Parameter [queryString] :
  /// The search query string.
  ///
  /// Parameter [queryVersion] :
  /// The version of the query.
  ///
  /// Parameter [unit] :
  /// Used to support unit transformation such as milliseconds to seconds. The
  /// unit must be supported by <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html">CW
  /// metric</a>.
  Future<void> updateFleetMetric({
    required String indexName,
    required String metricName,
    String? aggregationField,
    AggregationType? aggregationType,
    String? description,
    int? expectedVersion,
    int? period,
    String? queryString,
    String? queryVersion,
    FleetMetricUnit? unit,
  }) async {
    _s.validateNumRange(
      'period',
      period,
      60,
      86400,
    );
    final $payload = <String, dynamic>{
      'indexName': indexName,
      if (aggregationField != null) 'aggregationField': aggregationField,
      if (aggregationType != null) 'aggregationType': aggregationType,
      if (description != null) 'description': description,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
      if (period != null) 'period': period,
      if (queryString != null) 'queryString': queryString,
      if (queryVersion != null) 'queryVersion': queryVersion,
      if (unit != null) 'unit': unit.value,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/fleet-metric/${Uri.encodeComponent(metricName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the search configuration.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateIndexingConfiguration</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingGroupIndexingConfiguration] :
  /// Thing group indexing configuration.
  ///
  /// Parameter [thingIndexingConfiguration] :
  /// Thing indexing configuration.
  Future<void> updateIndexingConfiguration({
    ThingGroupIndexingConfiguration? thingGroupIndexingConfiguration,
    ThingIndexingConfiguration? thingIndexingConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      if (thingGroupIndexingConfiguration != null)
        'thingGroupIndexingConfiguration': thingGroupIndexingConfiguration,
      if (thingIndexingConfiguration != null)
        'thingIndexingConfiguration': thingIndexingConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/indexing/config',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates supported fields of the specified job.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateJob</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// The ID of the job to be updated.
  ///
  /// Parameter [abortConfig] :
  /// Allows you to create criteria to abort a job.
  ///
  /// Parameter [description] :
  /// A short text description of the job.
  ///
  /// Parameter [jobExecutionsRetryConfig] :
  /// Allows you to create the criteria to retry a job.
  ///
  /// Parameter [jobExecutionsRolloutConfig] :
  /// Allows you to create a staged rollout of the job.
  ///
  /// Parameter [namespaceId] :
  /// The namespace used to indicate that a job is a customer-managed job.
  ///
  /// When you specify a value for this parameter, Amazon Web Services IoT Core
  /// sends jobs notifications to MQTT topics that contain the value in the
  /// following format.
  ///
  /// <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code>
  /// <note>
  /// The <code>namespaceId</code> feature is only supported by IoT Greengrass
  /// at this time. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/setting-up.html">Setting
  /// up IoT Greengrass core devices.</a>
  /// </note>
  ///
  /// Parameter [presignedUrlConfig] :
  /// Configuration information for pre-signed S3 URLs.
  ///
  /// Parameter [timeoutConfig] :
  /// Specifies the amount of time each device has to finish its execution of
  /// the job. The timer is started when the job execution status is set to
  /// <code>IN_PROGRESS</code>. If the job execution status is not set to
  /// another terminal state before the time expires, it will be automatically
  /// set to <code>TIMED_OUT</code>.
  Future<void> updateJob({
    required String jobId,
    AbortConfig? abortConfig,
    String? description,
    JobExecutionsRetryConfig? jobExecutionsRetryConfig,
    JobExecutionsRolloutConfig? jobExecutionsRolloutConfig,
    String? namespaceId,
    PresignedUrlConfig? presignedUrlConfig,
    TimeoutConfig? timeoutConfig,
  }) async {
    final $query = <String, List<String>>{
      if (namespaceId != null) 'namespaceId': [namespaceId],
    };
    final $payload = <String, dynamic>{
      if (abortConfig != null) 'abortConfig': abortConfig,
      if (description != null) 'description': description,
      if (jobExecutionsRetryConfig != null)
        'jobExecutionsRetryConfig': jobExecutionsRetryConfig,
      if (jobExecutionsRolloutConfig != null)
        'jobExecutionsRolloutConfig': jobExecutionsRolloutConfig,
      if (presignedUrlConfig != null) 'presignedUrlConfig': presignedUrlConfig,
      if (timeoutConfig != null) 'timeoutConfig': timeoutConfig,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the definition for the specified mitigation action.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateMitigationAction</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [actionName] :
  /// The friendly name for the mitigation action. You cannot change the name by
  /// using <code>UpdateMitigationAction</code>. Instead, you must delete and
  /// recreate the mitigation action with the new name.
  ///
  /// Parameter [actionParams] :
  /// Defines the type of action and the parameters for that action.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role that is used to apply the mitigation action.
  Future<UpdateMitigationActionResponse> updateMitigationAction({
    required String actionName,
    MitigationActionParams? actionParams,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      if (actionParams != null) 'actionParams': actionParams,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/mitigationactions/actions/${Uri.encodeComponent(actionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMitigationActionResponse.fromJson(response);
  }

  /// Updates the supported fields for a specific software package.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdatePackage</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetIndexingConfiguration</a>
  /// actions.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [packageName] :
  /// The name of the target software package.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [defaultVersionName] :
  /// The name of the default package version.
  ///
  /// <b>Note:</b> You cannot name a <code>defaultVersion</code> and set
  /// <code>unsetDefaultVersion</code> equal to <code>true</code> at the same
  /// time.
  ///
  /// Parameter [description] :
  /// The package description.
  ///
  /// Parameter [unsetDefaultVersion] :
  /// Indicates whether you want to remove the named default package version
  /// from the software package. Set as <code>true</code> to remove the default
  /// package version.
  ///
  /// <b>Note:</b> You cannot name a <code>defaultVersion</code> and set
  /// <code>unsetDefaultVersion</code> equal to <code>true</code> at the same
  /// time.
  Future<void> updatePackage({
    required String packageName,
    String? clientToken,
    String? defaultVersionName,
    String? description,
    bool? unsetDefaultVersion,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final $payload = <String, dynamic>{
      if (defaultVersionName != null) 'defaultVersionName': defaultVersionName,
      if (description != null) 'description': description,
      if (unsetDefaultVersion != null)
        'unsetDefaultVersion': unsetDefaultVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/packages/${Uri.encodeComponent(packageName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the software package configuration.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdatePackageConfiguration</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html">iam:PassRole</a>
  /// actions.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [versionUpdateByJobsConfig] :
  /// Configuration to manage job's package version reporting. This updates the
  /// thing's reserved named shadow that the job targets.
  Future<void> updatePackageConfiguration({
    String? clientToken,
    VersionUpdateByJobsConfig? versionUpdateByJobsConfig,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final $payload = <String, dynamic>{
      if (versionUpdateByJobsConfig != null)
        'versionUpdateByJobsConfig': versionUpdateByJobsConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/package-configuration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the supported fields for a specific package version.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdatePackageVersion</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetIndexingConfiguration</a>
  /// actions.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [packageName] :
  /// The name of the associated software package.
  ///
  /// Parameter [versionName] :
  /// The name of the target package version.
  ///
  /// Parameter [action] :
  /// The status that the package version should be assigned. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/preparing-to-use-software-package-catalog.html#package-version-lifecycle">Package
  /// version lifecycle</a>.
  ///
  /// Parameter [attributes] :
  /// Metadata that can be used to define a package version’s configuration. For
  /// example, the Amazon S3 file location, configuration options that are being
  /// sent to the device or fleet.
  ///
  /// <b>Note:</b> Attributes can be updated only when the package version is in
  /// a draft state.
  ///
  /// The combined size of all the attributes on a package version is limited to
  /// 3KB.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [description] :
  /// The package version description.
  Future<void> updatePackageVersion({
    required String packageName,
    required String versionName,
    PackageVersionAction? action,
    Map<String, String>? attributes,
    String? clientToken,
    String? description,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final $payload = <String, dynamic>{
      if (action != null) 'action': action.value,
      if (attributes != null) 'attributes': attributes,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/packages/${Uri.encodeComponent(packageName)}/versions/${Uri.encodeComponent(versionName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a provisioning template.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateProvisioningTemplate</a>
  /// action.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [templateName] :
  /// The name of the provisioning template.
  ///
  /// Parameter [defaultVersionId] :
  /// The ID of the default provisioning template version.
  ///
  /// Parameter [description] :
  /// The description of the provisioning template.
  ///
  /// Parameter [enabled] :
  /// True to enable the provisioning template, otherwise false.
  ///
  /// Parameter [preProvisioningHook] :
  /// Updates the pre-provisioning hook template. Only supports template of type
  /// <code>FLEET_PROVISIONING</code>. For more information about provisioning
  /// template types, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_CreateProvisioningTemplate.html#iot-CreateProvisioningTemplate-request-type">type</a>.
  ///
  /// Parameter [provisioningRoleArn] :
  /// The ARN of the role associated with the provisioning template. This IoT
  /// role grants permission to provision a device.
  ///
  /// Parameter [removePreProvisioningHook] :
  /// Removes pre-provisioning hook template.
  Future<void> updateProvisioningTemplate({
    required String templateName,
    int? defaultVersionId,
    String? description,
    bool? enabled,
    ProvisioningHook? preProvisioningHook,
    String? provisioningRoleArn,
    bool? removePreProvisioningHook,
  }) async {
    final $payload = <String, dynamic>{
      if (defaultVersionId != null) 'defaultVersionId': defaultVersionId,
      if (description != null) 'description': description,
      if (enabled != null) 'enabled': enabled,
      if (preProvisioningHook != null)
        'preProvisioningHook': preProvisioningHook,
      if (provisioningRoleArn != null)
        'provisioningRoleArn': provisioningRoleArn,
      if (removePreProvisioningHook != null)
        'removePreProvisioningHook': removePreProvisioningHook,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/provisioning-templates/${Uri.encodeComponent(templateName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a role alias.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateRoleAlias</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [roleAlias] :
  /// The role alias to update.
  ///
  /// Parameter [credentialDurationSeconds] :
  /// The number of seconds the credential will be valid.
  ///
  /// This value must be less than or equal to the maximum session duration of
  /// the IAM role that the role alias references.
  ///
  /// Parameter [roleArn] :
  /// The role ARN.
  Future<UpdateRoleAliasResponse> updateRoleAlias({
    required String roleAlias,
    int? credentialDurationSeconds,
    String? roleArn,
  }) async {
    _s.validateNumRange(
      'credentialDurationSeconds',
      credentialDurationSeconds,
      900,
      43200,
    );
    final $payload = <String, dynamic>{
      if (credentialDurationSeconds != null)
        'credentialDurationSeconds': credentialDurationSeconds,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/role-aliases/${Uri.encodeComponent(roleAlias)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRoleAliasResponse.fromJson(response);
  }

  /// Updates a scheduled audit, including which checks are performed and how
  /// often the audit takes place.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateScheduledAudit</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [scheduledAuditName] :
  /// The name of the scheduled audit. (Max. 128 chars)
  ///
  /// Parameter [dayOfMonth] :
  /// The day of the month on which the scheduled audit takes place. This can be
  /// <code>1</code> through <code>31</code> or <code>LAST</code>. This field is
  /// required if the <code>frequency</code> parameter is set to
  /// <code>MONTHLY</code>. If days 29-31 are specified, and the month does not
  /// have that many days, the audit takes place on the "LAST" day of the month.
  ///
  /// Parameter [dayOfWeek] :
  /// The day of the week on which the scheduled audit takes place. This can be
  /// one of <code>SUN</code>, <code>MON</code>, <code>TUE</code>,
  /// <code>WED</code>, <code>THU</code>, <code>FRI</code>, or <code>SAT</code>.
  /// This field is required if the "frequency" parameter is set to
  /// <code>WEEKLY</code> or <code>BIWEEKLY</code>.
  ///
  /// Parameter [frequency] :
  /// How often the scheduled audit takes place, either <code>DAILY</code>,
  /// <code>WEEKLY</code>, <code>BIWEEKLY</code>, or <code>MONTHLY</code>. The
  /// start time of each audit is determined by the system.
  ///
  /// Parameter [targetCheckNames] :
  /// Which checks are performed during the scheduled audit. Checks must be
  /// enabled for your account. (Use
  /// <code>DescribeAccountAuditConfiguration</code> to see the list of all
  /// checks, including those that are enabled or use
  /// <code>UpdateAccountAuditConfiguration</code> to select which checks are
  /// enabled.)
  Future<UpdateScheduledAuditResponse> updateScheduledAudit({
    required String scheduledAuditName,
    String? dayOfMonth,
    DayOfWeek? dayOfWeek,
    AuditFrequency? frequency,
    List<String>? targetCheckNames,
  }) async {
    final $payload = <String, dynamic>{
      if (dayOfMonth != null) 'dayOfMonth': dayOfMonth,
      if (dayOfWeek != null) 'dayOfWeek': dayOfWeek.value,
      if (frequency != null) 'frequency': frequency.value,
      if (targetCheckNames != null) 'targetCheckNames': targetCheckNames,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/audit/scheduledaudits/${Uri.encodeComponent(scheduledAuditName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateScheduledAuditResponse.fromJson(response);
  }

  /// Updates a Device Defender security profile.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateSecurityProfile</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [securityProfileName] :
  /// The name of the security profile you want to update.
  ///
  /// Parameter [additionalMetricsToRetain] :
  /// <i>Please use
  /// <a>UpdateSecurityProfileRequest$additionalMetricsToRetainV2</a>
  /// instead.</i>
  ///
  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the profile's <code>behaviors</code>, but
  /// it is also retained for any metric specified here. Can be used with custom
  /// metrics; cannot be used with dimensions.
  ///
  /// Parameter [additionalMetricsToRetainV2] :
  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the profile's behaviors, but it is also
  /// retained for any metric specified here. Can be used with custom metrics;
  /// cannot be used with dimensions.
  ///
  /// Parameter [alertTargets] :
  /// Where the alerts are sent. (Alerts are always sent to the console.)
  ///
  /// Parameter [behaviors] :
  /// Specifies the behaviors that, when violated by a device (thing), cause an
  /// alert.
  ///
  /// Parameter [deleteAdditionalMetricsToRetain] :
  /// If true, delete all <code>additionalMetricsToRetain</code> defined for
  /// this security profile. If any <code>additionalMetricsToRetain</code> are
  /// defined in the current invocation, an exception occurs.
  ///
  /// Parameter [deleteAlertTargets] :
  /// If true, delete all <code>alertTargets</code> defined for this security
  /// profile. If any <code>alertTargets</code> are defined in the current
  /// invocation, an exception occurs.
  ///
  /// Parameter [deleteBehaviors] :
  /// If true, delete all <code>behaviors</code> defined for this security
  /// profile. If any <code>behaviors</code> are defined in the current
  /// invocation, an exception occurs.
  ///
  /// Parameter [deleteMetricsExportConfig] :
  /// Set the value as true to delete metrics export related configurations.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the security profile. A new version is generated
  /// whenever the security profile is updated. If you specify a value that is
  /// different from the actual version, a <code>VersionConflictException</code>
  /// is thrown.
  ///
  /// Parameter [metricsExportConfig] :
  /// Specifies the MQTT topic and role ARN required for metric export.
  ///
  /// Parameter [securityProfileDescription] :
  /// A description of the security profile.
  Future<UpdateSecurityProfileResponse> updateSecurityProfile({
    required String securityProfileName,
    List<String>? additionalMetricsToRetain,
    List<MetricToRetain>? additionalMetricsToRetainV2,
    Map<AlertTargetType, AlertTarget>? alertTargets,
    List<Behavior>? behaviors,
    bool? deleteAdditionalMetricsToRetain,
    bool? deleteAlertTargets,
    bool? deleteBehaviors,
    bool? deleteMetricsExportConfig,
    int? expectedVersion,
    MetricsExportConfig? metricsExportConfig,
    String? securityProfileDescription,
  }) async {
    final $query = <String, List<String>>{
      if (expectedVersion != null)
        'expectedVersion': [expectedVersion.toString()],
    };
    final $payload = <String, dynamic>{
      if (additionalMetricsToRetain != null)
        'additionalMetricsToRetain': additionalMetricsToRetain,
      if (additionalMetricsToRetainV2 != null)
        'additionalMetricsToRetainV2': additionalMetricsToRetainV2,
      if (alertTargets != null)
        'alertTargets': alertTargets.map((k, e) => MapEntry(k.value, e)),
      if (behaviors != null) 'behaviors': behaviors,
      if (deleteAdditionalMetricsToRetain != null)
        'deleteAdditionalMetricsToRetain': deleteAdditionalMetricsToRetain,
      if (deleteAlertTargets != null) 'deleteAlertTargets': deleteAlertTargets,
      if (deleteBehaviors != null) 'deleteBehaviors': deleteBehaviors,
      if (deleteMetricsExportConfig != null)
        'deleteMetricsExportConfig': deleteMetricsExportConfig,
      if (metricsExportConfig != null)
        'metricsExportConfig': metricsExportConfig,
      if (securityProfileDescription != null)
        'securityProfileDescription': securityProfileDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(securityProfileName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSecurityProfileResponse.fromJson(response);
  }

  /// Updates an existing stream. The stream version will be incremented by one.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateStream</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [streamId] :
  /// The stream ID.
  ///
  /// Parameter [description] :
  /// The description of the stream.
  ///
  /// Parameter [files] :
  /// The files associated with the stream.
  ///
  /// Parameter [roleArn] :
  /// An IAM role that allows the IoT service principal assumes to access your
  /// S3 files.
  Future<UpdateStreamResponse> updateStream({
    required String streamId,
    String? description,
    List<StreamFile>? files,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (files != null) 'files': files,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/streams/${Uri.encodeComponent(streamId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateStreamResponse.fromJson(response);
  }

  /// Updates the data for a thing.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateThing</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing to update.
  ///
  /// You can't change a thing's name. To change a thing's name, you must create
  /// a new thing, give it the new name, and then delete the old thing.
  ///
  /// Parameter [attributePayload] :
  /// A list of thing attributes, a JSON string containing name-value pairs. For
  /// example:
  ///
  /// <code>{\"attributes\":{\"name1\":\"value2\"}}</code>
  ///
  /// This data is used to add new attributes or update existing attributes.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the thing record in the registry. If the version
  /// of the record in the registry does not match the expected version
  /// specified in the request, the <code>UpdateThing</code> request is rejected
  /// with a <code>VersionConflictException</code>.
  ///
  /// Parameter [removeThingType] :
  /// Remove a thing type association. If <b>true</b>, the association is
  /// removed.
  ///
  /// Parameter [thingTypeName] :
  /// The name of the thing type.
  Future<void> updateThing({
    required String thingName,
    AttributePayload? attributePayload,
    int? expectedVersion,
    bool? removeThingType,
    String? thingTypeName,
  }) async {
    final $payload = <String, dynamic>{
      if (attributePayload != null) 'attributePayload': attributePayload,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
      if (removeThingType != null) 'removeThingType': removeThingType,
      if (thingTypeName != null) 'thingTypeName': thingTypeName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/things/${Uri.encodeComponent(thingName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update a thing group.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateThingGroup</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [thingGroupName] :
  /// The thing group to update.
  ///
  /// Parameter [thingGroupProperties] :
  /// The thing group properties.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the thing group. If this does not match the
  /// version of the thing group being updated, the update will fail.
  Future<UpdateThingGroupResponse> updateThingGroup({
    required String thingGroupName,
    required ThingGroupProperties thingGroupProperties,
    int? expectedVersion,
  }) async {
    final $payload = <String, dynamic>{
      'thingGroupProperties': thingGroupProperties,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/thing-groups/${Uri.encodeComponent(thingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateThingGroupResponse.fromJson(response);
  }

  /// Updates the groups to which the thing belongs.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateThingGroupsForThing</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [overrideDynamicGroups] :
  /// Override dynamic thing groups with static thing groups when 10-group limit
  /// is reached. If a thing belongs to 10 thing groups, and one or more of
  /// those groups are dynamic thing groups, adding a thing to a static group
  /// removes the thing from the last dynamic group.
  ///
  /// Parameter [thingGroupsToAdd] :
  /// The groups to which the thing will be added.
  ///
  /// Parameter [thingGroupsToRemove] :
  /// The groups from which the thing will be removed.
  ///
  /// Parameter [thingName] :
  /// The thing whose group memberships will be updated.
  Future<void> updateThingGroupsForThing({
    bool? overrideDynamicGroups,
    List<String>? thingGroupsToAdd,
    List<String>? thingGroupsToRemove,
    String? thingName,
  }) async {
    final $payload = <String, dynamic>{
      if (overrideDynamicGroups != null)
        'overrideDynamicGroups': overrideDynamicGroups,
      if (thingGroupsToAdd != null) 'thingGroupsToAdd': thingGroupsToAdd,
      if (thingGroupsToRemove != null)
        'thingGroupsToRemove': thingGroupsToRemove,
      if (thingName != null) 'thingName': thingName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/thing-groups/updateThingGroupsForThing',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a topic rule destination. You use this to change the status,
  /// endpoint URL, or confirmation URL of the destination.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateTopicRuleDestination</a>
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [arn] :
  /// The ARN of the topic rule destination.
  ///
  /// Parameter [status] :
  /// The status of the topic rule destination. Valid values are:
  /// <dl> <dt>IN_PROGRESS</dt> <dd>
  /// A topic rule destination was created but has not been confirmed. You can
  /// set <code>status</code> to <code>IN_PROGRESS</code> by calling
  /// <code>UpdateTopicRuleDestination</code>. Calling
  /// <code>UpdateTopicRuleDestination</code> causes a new confirmation
  /// challenge to be sent to your confirmation endpoint.
  /// </dd> <dt>ENABLED</dt> <dd>
  /// Confirmation was completed, and traffic to this destination is allowed.
  /// You can set <code>status</code> to <code>DISABLED</code> by calling
  /// <code>UpdateTopicRuleDestination</code>.
  /// </dd> <dt>DISABLED</dt> <dd>
  /// Confirmation was completed, and traffic to this destination is not
  /// allowed. You can set <code>status</code> to <code>ENABLED</code> by
  /// calling <code>UpdateTopicRuleDestination</code>.
  /// </dd> <dt>ERROR</dt> <dd>
  /// Confirmation could not be completed, for example if the confirmation timed
  /// out. You can call <code>GetTopicRuleDestination</code> for details about
  /// the error. You can set <code>status</code> to <code>IN_PROGRESS</code> by
  /// calling <code>UpdateTopicRuleDestination</code>. Calling
  /// <code>UpdateTopicRuleDestination</code> causes a new confirmation
  /// challenge to be sent to your confirmation endpoint.
  /// </dd> </dl>
  Future<void> updateTopicRuleDestination({
    required String arn,
    required TopicRuleDestinationStatus status,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
      'status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/destinations',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Validates a Device Defender security profile behaviors specification.
  ///
  /// Requires permission to access the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ValidateSecurityProfileBehaviors</a>
  /// action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [behaviors] :
  /// Specifies the behaviors that, when violated by a device (thing), cause an
  /// alert.
  Future<ValidateSecurityProfileBehaviorsResponse>
      validateSecurityProfileBehaviors({
    required List<Behavior> behaviors,
  }) async {
    final $payload = <String, dynamic>{
      'behaviors': behaviors,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/security-profile-behaviors/validate',
      exceptionFnMap: _exceptionFns,
    );
    return ValidateSecurityProfileBehaviorsResponse.fromJson(response);
  }
}

enum AbortAction {
  cancel('CANCEL'),
  ;

  final String value;

  const AbortAction(this.value);

  static AbortAction fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum AbortAction'));
}

/// The criteria that determine when and how a job abort takes place.
class AbortConfig {
  /// The list of criteria that determine when and how to abort the job.
  final List<AbortCriteria> criteriaList;

  AbortConfig({
    required this.criteriaList,
  });

  factory AbortConfig.fromJson(Map<String, dynamic> json) {
    return AbortConfig(
      criteriaList: (json['criteriaList'] as List)
          .nonNulls
          .map((e) => AbortCriteria.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final criteriaList = this.criteriaList;
    return {
      'criteriaList': criteriaList,
    };
  }
}

/// The criteria that determine when and how a job abort takes place.
class AbortCriteria {
  /// The type of job action to take to initiate the job abort.
  final AbortAction action;

  /// The type of job execution failures that can initiate a job abort.
  final JobExecutionFailureType failureType;

  /// The minimum number of things which must receive job execution notifications
  /// before the job can be aborted.
  final int minNumberOfExecutedThings;

  /// The minimum percentage of job execution failures that must occur to initiate
  /// the job abort.
  ///
  /// Amazon Web Services IoT Core supports up to two digits after the decimal
  /// (for example, 10.9 and 10.99, but not 10.999).
  final double thresholdPercentage;

  AbortCriteria({
    required this.action,
    required this.failureType,
    required this.minNumberOfExecutedThings,
    required this.thresholdPercentage,
  });

  factory AbortCriteria.fromJson(Map<String, dynamic> json) {
    return AbortCriteria(
      action: AbortAction.fromString((json['action'] as String)),
      failureType:
          JobExecutionFailureType.fromString((json['failureType'] as String)),
      minNumberOfExecutedThings: json['minNumberOfExecutedThings'] as int,
      thresholdPercentage: json['thresholdPercentage'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final failureType = this.failureType;
    final minNumberOfExecutedThings = this.minNumberOfExecutedThings;
    final thresholdPercentage = this.thresholdPercentage;
    return {
      'action': action.value,
      'failureType': failureType.value,
      'minNumberOfExecutedThings': minNumberOfExecutedThings,
      'thresholdPercentage': thresholdPercentage,
    };
  }
}

/// Describes the actions associated with a rule.
class Action {
  /// Change the state of a CloudWatch alarm.
  final CloudwatchAlarmAction? cloudwatchAlarm;

  /// Send data to CloudWatch Logs.
  final CloudwatchLogsAction? cloudwatchLogs;

  /// Capture a CloudWatch metric.
  final CloudwatchMetricAction? cloudwatchMetric;

  /// Write to a DynamoDB table.
  final DynamoDBAction? dynamoDB;

  /// Write to a DynamoDB table. This is a new version of the DynamoDB action. It
  /// allows you to write each attribute in an MQTT message payload into a
  /// separate DynamoDB column.
  final DynamoDBv2Action? dynamoDBv2;

  /// Write data to an Amazon OpenSearch Service domain.
  /// <note>
  /// The <code>Elasticsearch</code> action can only be used by existing rule
  /// actions. To create a new rule action or to update an existing rule action,
  /// use the <code>OpenSearch</code> rule action instead. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_OpenSearchAction.html">OpenSearchAction</a>.
  /// </note>
  final ElasticsearchAction? elasticsearch;

  /// Write to an Amazon Kinesis Firehose stream.
  final FirehoseAction? firehose;

  /// Send data to an HTTPS endpoint.
  final HttpAction? http;

  /// Sends message data to an IoT Analytics channel.
  final IotAnalyticsAction? iotAnalytics;

  /// Sends an input to an IoT Events detector.
  final IotEventsAction? iotEvents;

  /// Sends data from the MQTT message that triggered the rule to IoT SiteWise
  /// asset properties.
  final IotSiteWiseAction? iotSiteWise;

  /// Send messages to an Amazon Managed Streaming for Apache Kafka (Amazon MSK)
  /// or self-managed Apache Kafka cluster.
  final KafkaAction? kafka;

  /// Write data to an Amazon Kinesis stream.
  final KinesisAction? kinesis;

  /// Invoke a Lambda function.
  final LambdaAction? lambda;

  /// The Amazon Location Service rule action sends device location updates from
  /// an MQTT message to an Amazon Location tracker resource.
  final LocationAction? location;

  /// Write data to an Amazon OpenSearch Service domain.
  final OpenSearchAction? openSearch;

  /// Publish to another MQTT topic.
  final RepublishAction? republish;

  /// Write to an Amazon S3 bucket.
  final S3Action? s3;

  /// Send a message to a Salesforce IoT Cloud Input Stream.
  final SalesforceAction? salesforce;

  /// Publish to an Amazon SNS topic.
  final SnsAction? sns;

  /// Publish to an Amazon SQS queue.
  final SqsAction? sqs;

  /// Starts execution of a Step Functions state machine.
  final StepFunctionsAction? stepFunctions;

  /// The Timestream rule action writes attributes (measures) from an MQTT message
  /// into an Amazon Timestream table. For more information, see the <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/timestream-rule-action.html">Timestream</a>
  /// topic rule action documentation.
  final TimestreamAction? timestream;

  Action({
    this.cloudwatchAlarm,
    this.cloudwatchLogs,
    this.cloudwatchMetric,
    this.dynamoDB,
    this.dynamoDBv2,
    this.elasticsearch,
    this.firehose,
    this.http,
    this.iotAnalytics,
    this.iotEvents,
    this.iotSiteWise,
    this.kafka,
    this.kinesis,
    this.lambda,
    this.location,
    this.openSearch,
    this.republish,
    this.s3,
    this.salesforce,
    this.sns,
    this.sqs,
    this.stepFunctions,
    this.timestream,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      cloudwatchAlarm: json['cloudwatchAlarm'] != null
          ? CloudwatchAlarmAction.fromJson(
              json['cloudwatchAlarm'] as Map<String, dynamic>)
          : null,
      cloudwatchLogs: json['cloudwatchLogs'] != null
          ? CloudwatchLogsAction.fromJson(
              json['cloudwatchLogs'] as Map<String, dynamic>)
          : null,
      cloudwatchMetric: json['cloudwatchMetric'] != null
          ? CloudwatchMetricAction.fromJson(
              json['cloudwatchMetric'] as Map<String, dynamic>)
          : null,
      dynamoDB: json['dynamoDB'] != null
          ? DynamoDBAction.fromJson(json['dynamoDB'] as Map<String, dynamic>)
          : null,
      dynamoDBv2: json['dynamoDBv2'] != null
          ? DynamoDBv2Action.fromJson(
              json['dynamoDBv2'] as Map<String, dynamic>)
          : null,
      elasticsearch: json['elasticsearch'] != null
          ? ElasticsearchAction.fromJson(
              json['elasticsearch'] as Map<String, dynamic>)
          : null,
      firehose: json['firehose'] != null
          ? FirehoseAction.fromJson(json['firehose'] as Map<String, dynamic>)
          : null,
      http: json['http'] != null
          ? HttpAction.fromJson(json['http'] as Map<String, dynamic>)
          : null,
      iotAnalytics: json['iotAnalytics'] != null
          ? IotAnalyticsAction.fromJson(
              json['iotAnalytics'] as Map<String, dynamic>)
          : null,
      iotEvents: json['iotEvents'] != null
          ? IotEventsAction.fromJson(json['iotEvents'] as Map<String, dynamic>)
          : null,
      iotSiteWise: json['iotSiteWise'] != null
          ? IotSiteWiseAction.fromJson(
              json['iotSiteWise'] as Map<String, dynamic>)
          : null,
      kafka: json['kafka'] != null
          ? KafkaAction.fromJson(json['kafka'] as Map<String, dynamic>)
          : null,
      kinesis: json['kinesis'] != null
          ? KinesisAction.fromJson(json['kinesis'] as Map<String, dynamic>)
          : null,
      lambda: json['lambda'] != null
          ? LambdaAction.fromJson(json['lambda'] as Map<String, dynamic>)
          : null,
      location: json['location'] != null
          ? LocationAction.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      openSearch: json['openSearch'] != null
          ? OpenSearchAction.fromJson(
              json['openSearch'] as Map<String, dynamic>)
          : null,
      republish: json['republish'] != null
          ? RepublishAction.fromJson(json['republish'] as Map<String, dynamic>)
          : null,
      s3: json['s3'] != null
          ? S3Action.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
      salesforce: json['salesforce'] != null
          ? SalesforceAction.fromJson(
              json['salesforce'] as Map<String, dynamic>)
          : null,
      sns: json['sns'] != null
          ? SnsAction.fromJson(json['sns'] as Map<String, dynamic>)
          : null,
      sqs: json['sqs'] != null
          ? SqsAction.fromJson(json['sqs'] as Map<String, dynamic>)
          : null,
      stepFunctions: json['stepFunctions'] != null
          ? StepFunctionsAction.fromJson(
              json['stepFunctions'] as Map<String, dynamic>)
          : null,
      timestream: json['timestream'] != null
          ? TimestreamAction.fromJson(
              json['timestream'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudwatchAlarm = this.cloudwatchAlarm;
    final cloudwatchLogs = this.cloudwatchLogs;
    final cloudwatchMetric = this.cloudwatchMetric;
    final dynamoDB = this.dynamoDB;
    final dynamoDBv2 = this.dynamoDBv2;
    final elasticsearch = this.elasticsearch;
    final firehose = this.firehose;
    final http = this.http;
    final iotAnalytics = this.iotAnalytics;
    final iotEvents = this.iotEvents;
    final iotSiteWise = this.iotSiteWise;
    final kafka = this.kafka;
    final kinesis = this.kinesis;
    final lambda = this.lambda;
    final location = this.location;
    final openSearch = this.openSearch;
    final republish = this.republish;
    final s3 = this.s3;
    final salesforce = this.salesforce;
    final sns = this.sns;
    final sqs = this.sqs;
    final stepFunctions = this.stepFunctions;
    final timestream = this.timestream;
    return {
      if (cloudwatchAlarm != null) 'cloudwatchAlarm': cloudwatchAlarm,
      if (cloudwatchLogs != null) 'cloudwatchLogs': cloudwatchLogs,
      if (cloudwatchMetric != null) 'cloudwatchMetric': cloudwatchMetric,
      if (dynamoDB != null) 'dynamoDB': dynamoDB,
      if (dynamoDBv2 != null) 'dynamoDBv2': dynamoDBv2,
      if (elasticsearch != null) 'elasticsearch': elasticsearch,
      if (firehose != null) 'firehose': firehose,
      if (http != null) 'http': http,
      if (iotAnalytics != null) 'iotAnalytics': iotAnalytics,
      if (iotEvents != null) 'iotEvents': iotEvents,
      if (iotSiteWise != null) 'iotSiteWise': iotSiteWise,
      if (kafka != null) 'kafka': kafka,
      if (kinesis != null) 'kinesis': kinesis,
      if (lambda != null) 'lambda': lambda,
      if (location != null) 'location': location,
      if (openSearch != null) 'openSearch': openSearch,
      if (republish != null) 'republish': republish,
      if (s3 != null) 's3': s3,
      if (salesforce != null) 'salesforce': salesforce,
      if (sns != null) 'sns': sns,
      if (sqs != null) 'sqs': sqs,
      if (stepFunctions != null) 'stepFunctions': stepFunctions,
      if (timestream != null) 'timestream': timestream,
    };
  }
}

enum ActionType {
  publish('PUBLISH'),
  subscribe('SUBSCRIBE'),
  receive('RECEIVE'),
  connect('CONNECT'),
  ;

  final String value;

  const ActionType(this.value);

  static ActionType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ActionType'));
}

/// Information about an active Device Defender security profile behavior
/// violation.
class ActiveViolation {
  /// The behavior that is being violated.
  final Behavior? behavior;

  /// The time the most recent violation occurred.
  final DateTime? lastViolationTime;

  /// The value of the metric (the measurement) that caused the most recent
  /// violation.
  final MetricValue? lastViolationValue;

  /// The security profile with the behavior is in violation.
  final String? securityProfileName;

  /// The name of the thing responsible for the active violation.
  final String? thingName;

  /// The verification state of the violation (detect alarm).
  final VerificationState? verificationState;

  /// The description of the verification state of the violation.
  final String? verificationStateDescription;

  /// The details of a violation event.
  final ViolationEventAdditionalInfo? violationEventAdditionalInfo;

  /// The ID of the active violation.
  final String? violationId;

  /// The time the violation started.
  final DateTime? violationStartTime;

  ActiveViolation({
    this.behavior,
    this.lastViolationTime,
    this.lastViolationValue,
    this.securityProfileName,
    this.thingName,
    this.verificationState,
    this.verificationStateDescription,
    this.violationEventAdditionalInfo,
    this.violationId,
    this.violationStartTime,
  });

  factory ActiveViolation.fromJson(Map<String, dynamic> json) {
    return ActiveViolation(
      behavior: json['behavior'] != null
          ? Behavior.fromJson(json['behavior'] as Map<String, dynamic>)
          : null,
      lastViolationTime: timeStampFromJson(json['lastViolationTime']),
      lastViolationValue: json['lastViolationValue'] != null
          ? MetricValue.fromJson(
              json['lastViolationValue'] as Map<String, dynamic>)
          : null,
      securityProfileName: json['securityProfileName'] as String?,
      thingName: json['thingName'] as String?,
      verificationState: (json['verificationState'] as String?)
          ?.let(VerificationState.fromString),
      verificationStateDescription:
          json['verificationStateDescription'] as String?,
      violationEventAdditionalInfo: json['violationEventAdditionalInfo'] != null
          ? ViolationEventAdditionalInfo.fromJson(
              json['violationEventAdditionalInfo'] as Map<String, dynamic>)
          : null,
      violationId: json['violationId'] as String?,
      violationStartTime: timeStampFromJson(json['violationStartTime']),
    );
  }
}

class AddThingToBillingGroupResponse {
  AddThingToBillingGroupResponse();

  factory AddThingToBillingGroupResponse.fromJson(Map<String, dynamic> _) {
    return AddThingToBillingGroupResponse();
  }
}

class AddThingToThingGroupResponse {
  AddThingToThingGroupResponse();

  factory AddThingToThingGroupResponse.fromJson(Map<String, dynamic> _) {
    return AddThingToThingGroupResponse();
  }
}

/// Parameters used when defining a mitigation action that move a set of things
/// to a thing group.
class AddThingsToThingGroupParams {
  /// The list of groups to which you want to add the things that triggered the
  /// mitigation action. You can add a thing to a maximum of 10 groups, but you
  /// can't add a thing to more than one group in the same hierarchy.
  final List<String> thingGroupNames;

  /// Specifies if this mitigation action can move the things that triggered the
  /// mitigation action even if they are part of one or more dynamic thing groups.
  final bool? overrideDynamicGroups;

  AddThingsToThingGroupParams({
    required this.thingGroupNames,
    this.overrideDynamicGroups,
  });

  factory AddThingsToThingGroupParams.fromJson(Map<String, dynamic> json) {
    return AddThingsToThingGroupParams(
      thingGroupNames: (json['thingGroupNames'] as List)
          .nonNulls
          .map((e) => e as String)
          .toList(),
      overrideDynamicGroups: json['overrideDynamicGroups'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final thingGroupNames = this.thingGroupNames;
    final overrideDynamicGroups = this.overrideDynamicGroups;
    return {
      'thingGroupNames': thingGroupNames,
      if (overrideDynamicGroups != null)
        'overrideDynamicGroups': overrideDynamicGroups,
    };
  }
}

/// The type of aggregation queries.
class AggregationType {
  /// The name of the aggregation type.
  final AggregationTypeName name;

  /// A list of the values of aggregation types.
  final List<String>? values;

  AggregationType({
    required this.name,
    this.values,
  });

  factory AggregationType.fromJson(Map<String, dynamic> json) {
    return AggregationType(
      name: AggregationTypeName.fromString((json['name'] as String)),
      values:
          (json['values'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'name': name.value,
      if (values != null) 'values': values,
    };
  }
}

enum AggregationTypeName {
  statistics('Statistics'),
  percentiles('Percentiles'),
  cardinality('Cardinality'),
  ;

  final String value;

  const AggregationTypeName(this.value);

  static AggregationTypeName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum AggregationTypeName'));
}

/// A structure containing the alert target ARN and the role ARN.
class AlertTarget {
  /// The Amazon Resource Name (ARN) of the notification target to which alerts
  /// are sent.
  final String alertTargetArn;

  /// The ARN of the role that grants permission to send alerts to the
  /// notification target.
  final String roleArn;

  AlertTarget({
    required this.alertTargetArn,
    required this.roleArn,
  });

  factory AlertTarget.fromJson(Map<String, dynamic> json) {
    return AlertTarget(
      alertTargetArn: json['alertTargetArn'] as String,
      roleArn: json['roleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final alertTargetArn = this.alertTargetArn;
    final roleArn = this.roleArn;
    return {
      'alertTargetArn': alertTargetArn,
      'roleArn': roleArn,
    };
  }
}

/// The type of alert target: one of "SNS".
enum AlertTargetType {
  sns('SNS'),
  ;

  final String value;

  const AlertTargetType(this.value);

  static AlertTargetType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AlertTargetType'));
}

/// Contains information that allowed the authorization.
class Allowed {
  /// A list of policies that allowed the authentication.
  final List<Policy>? policies;

  Allowed({
    this.policies,
  });

  factory Allowed.fromJson(Map<String, dynamic> json) {
    return Allowed(
      policies: (json['policies'] as List?)
          ?.nonNulls
          .map((e) => Policy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// An asset property timestamp entry containing the following information.
class AssetPropertyTimestamp {
  /// A string that contains the time in seconds since epoch. Accepts substitution
  /// templates.
  final String timeInSeconds;

  /// Optional. A string that contains the nanosecond time offset. Accepts
  /// substitution templates.
  final String? offsetInNanos;

  AssetPropertyTimestamp({
    required this.timeInSeconds,
    this.offsetInNanos,
  });

  factory AssetPropertyTimestamp.fromJson(Map<String, dynamic> json) {
    return AssetPropertyTimestamp(
      timeInSeconds: json['timeInSeconds'] as String,
      offsetInNanos: json['offsetInNanos'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final timeInSeconds = this.timeInSeconds;
    final offsetInNanos = this.offsetInNanos;
    return {
      'timeInSeconds': timeInSeconds,
      if (offsetInNanos != null) 'offsetInNanos': offsetInNanos,
    };
  }
}

/// An asset property value entry containing the following information.
class AssetPropertyValue {
  /// The asset property value timestamp.
  final AssetPropertyTimestamp timestamp;

  /// The value of the asset property.
  final AssetPropertyVariant value;

  /// Optional. A string that describes the quality of the value. Accepts
  /// substitution templates. Must be <code>GOOD</code>, <code>BAD</code>, or
  /// <code>UNCERTAIN</code>.
  final String? quality;

  AssetPropertyValue({
    required this.timestamp,
    required this.value,
    this.quality,
  });

  factory AssetPropertyValue.fromJson(Map<String, dynamic> json) {
    return AssetPropertyValue(
      timestamp: AssetPropertyTimestamp.fromJson(
          json['timestamp'] as Map<String, dynamic>),
      value:
          AssetPropertyVariant.fromJson(json['value'] as Map<String, dynamic>),
      quality: json['quality'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final timestamp = this.timestamp;
    final value = this.value;
    final quality = this.quality;
    return {
      'timestamp': timestamp,
      'value': value,
      if (quality != null) 'quality': quality,
    };
  }
}

/// Contains an asset property value (of a single type).
class AssetPropertyVariant {
  /// Optional. A string that contains the boolean value (<code>true</code> or
  /// <code>false</code>) of the value entry. Accepts substitution templates.
  final String? booleanValue;

  /// Optional. A string that contains the double value of the value entry.
  /// Accepts substitution templates.
  final String? doubleValue;

  /// Optional. A string that contains the integer value of the value entry.
  /// Accepts substitution templates.
  final String? integerValue;

  /// Optional. The string value of the value entry. Accepts substitution
  /// templates.
  final String? stringValue;

  AssetPropertyVariant({
    this.booleanValue,
    this.doubleValue,
    this.integerValue,
    this.stringValue,
  });

  factory AssetPropertyVariant.fromJson(Map<String, dynamic> json) {
    return AssetPropertyVariant(
      booleanValue: json['booleanValue'] as String?,
      doubleValue: json['doubleValue'] as String?,
      integerValue: json['integerValue'] as String?,
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanValue = this.booleanValue;
    final doubleValue = this.doubleValue;
    final integerValue = this.integerValue;
    final stringValue = this.stringValue;
    return {
      if (booleanValue != null) 'booleanValue': booleanValue,
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (integerValue != null) 'integerValue': integerValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

class AssociateTargetsWithJobResponse {
  /// A short text description of the job.
  final String? description;

  /// An ARN identifying the job.
  final String? jobArn;

  /// The unique identifier you assigned to this job when it was created.
  final String? jobId;

  AssociateTargetsWithJobResponse({
    this.description,
    this.jobArn,
    this.jobId,
  });

  factory AssociateTargetsWithJobResponse.fromJson(Map<String, dynamic> json) {
    return AssociateTargetsWithJobResponse(
      description: json['description'] as String?,
      jobArn: json['jobArn'] as String?,
      jobId: json['jobId'] as String?,
    );
  }
}

class AttachSecurityProfileResponse {
  AttachSecurityProfileResponse();

  factory AttachSecurityProfileResponse.fromJson(Map<String, dynamic> _) {
    return AttachSecurityProfileResponse();
  }
}

/// The output from the AttachThingPrincipal operation.
class AttachThingPrincipalResponse {
  AttachThingPrincipalResponse();

  factory AttachThingPrincipalResponse.fromJson(Map<String, dynamic> _) {
    return AttachThingPrincipalResponse();
  }
}

/// The attribute payload.
class AttributePayload {
  /// A JSON string containing up to three key-value pair in JSON format. For
  /// example:
  ///
  /// <code>{\"attributes\":{\"string1\":\"string2\"}}</code>
  final Map<String, String>? attributes;

  /// Specifies whether the list of attributes provided in the
  /// <code>AttributePayload</code> is merged with the attributes stored in the
  /// registry, instead of overwriting them.
  ///
  /// To remove an attribute, call <code>UpdateThing</code> with an empty
  /// attribute value.
  /// <note>
  /// The <code>merge</code> attribute is only valid when calling
  /// <code>UpdateThing</code> or <code>UpdateThingGroup</code>.
  /// </note>
  final bool? merge;

  AttributePayload({
    this.attributes,
    this.merge,
  });

  factory AttributePayload.fromJson(Map<String, dynamic> json) {
    return AttributePayload(
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      merge: json['merge'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final merge = this.merge;
    return {
      if (attributes != null) 'attributes': attributes,
      if (merge != null) 'merge': merge,
    };
  }
}

/// Which audit checks are enabled and disabled for this account.
class AuditCheckConfiguration {
  /// True if this audit check is enabled for this account.
  final bool? enabled;

  AuditCheckConfiguration({
    this.enabled,
  });

  factory AuditCheckConfiguration.fromJson(Map<String, dynamic> json) {
    return AuditCheckConfiguration(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// Information about the audit check.
class AuditCheckDetails {
  /// True if the check is complete and found all resources compliant.
  final bool? checkCompliant;

  /// The completion status of this check. One of "IN_PROGRESS",
  /// "WAITING_FOR_DATA_COLLECTION", "CANCELED", "COMPLETED_COMPLIANT",
  /// "COMPLETED_NON_COMPLIANT", or "FAILED".
  final AuditCheckRunStatus? checkRunStatus;

  /// The code of any error encountered when this check is performed during this
  /// audit. One of "INSUFFICIENT_PERMISSIONS" or "AUDIT_CHECK_DISABLED".
  final String? errorCode;

  /// The message associated with any error encountered when this check is
  /// performed during this audit.
  final String? message;

  /// The number of resources that were found noncompliant during the check.
  final int? nonCompliantResourcesCount;

  /// Describes how many of the non-compliant resources created during the
  /// evaluation of an audit check were marked as suppressed.
  final int? suppressedNonCompliantResourcesCount;

  /// The number of resources on which the check was performed.
  final int? totalResourcesCount;

  AuditCheckDetails({
    this.checkCompliant,
    this.checkRunStatus,
    this.errorCode,
    this.message,
    this.nonCompliantResourcesCount,
    this.suppressedNonCompliantResourcesCount,
    this.totalResourcesCount,
  });

  factory AuditCheckDetails.fromJson(Map<String, dynamic> json) {
    return AuditCheckDetails(
      checkCompliant: json['checkCompliant'] as bool?,
      checkRunStatus: (json['checkRunStatus'] as String?)
          ?.let(AuditCheckRunStatus.fromString),
      errorCode: json['errorCode'] as String?,
      message: json['message'] as String?,
      nonCompliantResourcesCount: json['nonCompliantResourcesCount'] as int?,
      suppressedNonCompliantResourcesCount:
          json['suppressedNonCompliantResourcesCount'] as int?,
      totalResourcesCount: json['totalResourcesCount'] as int?,
    );
  }
}

enum AuditCheckRunStatus {
  inProgress('IN_PROGRESS'),
  waitingForDataCollection('WAITING_FOR_DATA_COLLECTION'),
  canceled('CANCELED'),
  completedCompliant('COMPLETED_COMPLIANT'),
  completedNonCompliant('COMPLETED_NON_COMPLIANT'),
  failed('FAILED'),
  ;

  final String value;

  const AuditCheckRunStatus(this.value);

  static AuditCheckRunStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum AuditCheckRunStatus'));
}

/// The findings (results) of the audit.
class AuditFinding {
  /// The audit check that generated this result.
  final String? checkName;

  /// A unique identifier for this set of audit findings. This identifier is used
  /// to apply mitigation tasks to one or more sets of findings.
  final String? findingId;

  /// The time the result (finding) was discovered.
  final DateTime? findingTime;

  /// Indicates whether the audit finding was suppressed or not during reporting.
  final bool? isSuppressed;

  /// The resource that was found to be noncompliant with the audit check.
  final NonCompliantResource? nonCompliantResource;

  /// The reason the resource was noncompliant.
  final String? reasonForNonCompliance;

  /// A code that indicates the reason that the resource was noncompliant.
  final String? reasonForNonComplianceCode;

  /// The list of related resources.
  final List<RelatedResource>? relatedResources;

  /// The severity of the result (finding).
  final AuditFindingSeverity? severity;

  /// The ID of the audit that generated this result (finding).
  final String? taskId;

  /// The time the audit started.
  final DateTime? taskStartTime;

  AuditFinding({
    this.checkName,
    this.findingId,
    this.findingTime,
    this.isSuppressed,
    this.nonCompliantResource,
    this.reasonForNonCompliance,
    this.reasonForNonComplianceCode,
    this.relatedResources,
    this.severity,
    this.taskId,
    this.taskStartTime,
  });

  factory AuditFinding.fromJson(Map<String, dynamic> json) {
    return AuditFinding(
      checkName: json['checkName'] as String?,
      findingId: json['findingId'] as String?,
      findingTime: timeStampFromJson(json['findingTime']),
      isSuppressed: json['isSuppressed'] as bool?,
      nonCompliantResource: json['nonCompliantResource'] != null
          ? NonCompliantResource.fromJson(
              json['nonCompliantResource'] as Map<String, dynamic>)
          : null,
      reasonForNonCompliance: json['reasonForNonCompliance'] as String?,
      reasonForNonComplianceCode: json['reasonForNonComplianceCode'] as String?,
      relatedResources: (json['relatedResources'] as List?)
          ?.nonNulls
          .map((e) => RelatedResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      severity:
          (json['severity'] as String?)?.let(AuditFindingSeverity.fromString),
      taskId: json['taskId'] as String?,
      taskStartTime: timeStampFromJson(json['taskStartTime']),
    );
  }
}

enum AuditFindingSeverity {
  critical('CRITICAL'),
  high('HIGH'),
  medium('MEDIUM'),
  low('LOW'),
  ;

  final String value;

  const AuditFindingSeverity(this.value);

  static AuditFindingSeverity fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum AuditFindingSeverity'));
}

enum AuditFrequency {
  daily('DAILY'),
  weekly('WEEKLY'),
  biweekly('BIWEEKLY'),
  monthly('MONTHLY'),
  ;

  final String value;

  const AuditFrequency(this.value);

  static AuditFrequency fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AuditFrequency'));
}

/// Returned by ListAuditMitigationActionsTask, this object contains information
/// that describes a mitigation action that has been started.
class AuditMitigationActionExecutionMetadata {
  /// The unique identifier for the mitigation action being applied by the task.
  final String? actionId;

  /// The friendly name of the mitigation action being applied by the task.
  final String? actionName;

  /// The date and time when the task was completed or canceled. Blank if the task
  /// is still running.
  final DateTime? endTime;

  /// If an error occurred, the code that indicates which type of error occurred.
  final String? errorCode;

  /// The unique identifier for the findings to which the task and associated
  /// mitigation action are applied.
  final String? findingId;

  /// If an error occurred, a message that describes the error.
  final String? message;

  /// The date and time when the task was started.
  final DateTime? startTime;

  /// The current status of the task being executed.
  final AuditMitigationActionsExecutionStatus? status;

  /// The unique identifier for the task that applies the mitigation action.
  final String? taskId;

  AuditMitigationActionExecutionMetadata({
    this.actionId,
    this.actionName,
    this.endTime,
    this.errorCode,
    this.findingId,
    this.message,
    this.startTime,
    this.status,
    this.taskId,
  });

  factory AuditMitigationActionExecutionMetadata.fromJson(
      Map<String, dynamic> json) {
    return AuditMitigationActionExecutionMetadata(
      actionId: json['actionId'] as String?,
      actionName: json['actionName'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      errorCode: json['errorCode'] as String?,
      findingId: json['findingId'] as String?,
      message: json['message'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)
          ?.let(AuditMitigationActionsExecutionStatus.fromString),
      taskId: json['taskId'] as String?,
    );
  }
}

enum AuditMitigationActionsExecutionStatus {
  inProgress('IN_PROGRESS'),
  completed('COMPLETED'),
  failed('FAILED'),
  canceled('CANCELED'),
  skipped('SKIPPED'),
  pending('PENDING'),
  ;

  final String value;

  const AuditMitigationActionsExecutionStatus(this.value);

  static AuditMitigationActionsExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AuditMitigationActionsExecutionStatus'));
}

/// Information about an audit mitigation actions task that is returned by
/// <code>ListAuditMitigationActionsTasks</code>.
class AuditMitigationActionsTaskMetadata {
  /// The time at which the audit mitigation actions task was started.
  final DateTime? startTime;

  /// The unique identifier for the task.
  final String? taskId;

  /// The current state of the audit mitigation actions task.
  final AuditMitigationActionsTaskStatus? taskStatus;

  AuditMitigationActionsTaskMetadata({
    this.startTime,
    this.taskId,
    this.taskStatus,
  });

  factory AuditMitigationActionsTaskMetadata.fromJson(
      Map<String, dynamic> json) {
    return AuditMitigationActionsTaskMetadata(
      startTime: timeStampFromJson(json['startTime']),
      taskId: json['taskId'] as String?,
      taskStatus: (json['taskStatus'] as String?)
          ?.let(AuditMitigationActionsTaskStatus.fromString),
    );
  }
}

enum AuditMitigationActionsTaskStatus {
  inProgress('IN_PROGRESS'),
  completed('COMPLETED'),
  failed('FAILED'),
  canceled('CANCELED'),
  ;

  final String value;

  const AuditMitigationActionsTaskStatus(this.value);

  static AuditMitigationActionsTaskStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AuditMitigationActionsTaskStatus'));
}

/// Used in MitigationActionParams, this information identifies the target
/// findings to which the mitigation actions are applied. Only one entry
/// appears.
class AuditMitigationActionsTaskTarget {
  /// Specifies a filter in the form of an audit check and set of reason codes
  /// that identify the findings from the audit to which the audit mitigation
  /// actions task apply.
  final Map<String, List<String>>? auditCheckToReasonCodeFilter;

  /// If the task will apply a mitigation action to findings from a specific
  /// audit, this value uniquely identifies the audit.
  final String? auditTaskId;

  /// If the task will apply a mitigation action to one or more listed findings,
  /// this value uniquely identifies those findings.
  final List<String>? findingIds;

  AuditMitigationActionsTaskTarget({
    this.auditCheckToReasonCodeFilter,
    this.auditTaskId,
    this.findingIds,
  });

  factory AuditMitigationActionsTaskTarget.fromJson(Map<String, dynamic> json) {
    return AuditMitigationActionsTaskTarget(
      auditCheckToReasonCodeFilter:
          (json['auditCheckToReasonCodeFilter'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(
                  k, (e as List).nonNulls.map((e) => e as String).toList())),
      auditTaskId: json['auditTaskId'] as String?,
      findingIds: (json['findingIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final auditCheckToReasonCodeFilter = this.auditCheckToReasonCodeFilter;
    final auditTaskId = this.auditTaskId;
    final findingIds = this.findingIds;
    return {
      if (auditCheckToReasonCodeFilter != null)
        'auditCheckToReasonCodeFilter': auditCheckToReasonCodeFilter,
      if (auditTaskId != null) 'auditTaskId': auditTaskId,
      if (findingIds != null) 'findingIds': findingIds,
    };
  }
}

/// Information about the targets to which audit notifications are sent.
class AuditNotificationTarget {
  /// True if notifications to the target are enabled.
  final bool? enabled;

  /// The ARN of the role that grants permission to send notifications to the
  /// target.
  final String? roleArn;

  /// The ARN of the target (SNS topic) to which audit notifications are sent.
  final String? targetArn;

  AuditNotificationTarget({
    this.enabled,
    this.roleArn,
    this.targetArn,
  });

  factory AuditNotificationTarget.fromJson(Map<String, dynamic> json) {
    return AuditNotificationTarget(
      enabled: json['enabled'] as bool?,
      roleArn: json['roleArn'] as String?,
      targetArn: json['targetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final roleArn = this.roleArn;
    final targetArn = this.targetArn;
    return {
      if (enabled != null) 'enabled': enabled,
      if (roleArn != null) 'roleArn': roleArn,
      if (targetArn != null) 'targetArn': targetArn,
    };
  }
}

enum AuditNotificationType {
  sns('SNS'),
  ;

  final String value;

  const AuditNotificationType(this.value);

  static AuditNotificationType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum AuditNotificationType'));
}

/// Filters out specific findings of a Device Defender audit.
class AuditSuppression {
  final String checkName;
  final ResourceIdentifier resourceIdentifier;

  /// The description of the audit suppression.
  final String? description;

  /// The expiration date (epoch timestamp in seconds) that you want the
  /// suppression to adhere to.
  final DateTime? expirationDate;

  /// Indicates whether a suppression should exist indefinitely or not.
  final bool? suppressIndefinitely;

  AuditSuppression({
    required this.checkName,
    required this.resourceIdentifier,
    this.description,
    this.expirationDate,
    this.suppressIndefinitely,
  });

  factory AuditSuppression.fromJson(Map<String, dynamic> json) {
    return AuditSuppression(
      checkName: json['checkName'] as String,
      resourceIdentifier: ResourceIdentifier.fromJson(
          json['resourceIdentifier'] as Map<String, dynamic>),
      description: json['description'] as String?,
      expirationDate: timeStampFromJson(json['expirationDate']),
      suppressIndefinitely: json['suppressIndefinitely'] as bool?,
    );
  }
}

/// The audits that were performed.
class AuditTaskMetadata {
  /// The ID of this audit.
  final String? taskId;

  /// The status of this audit. One of "IN_PROGRESS", "COMPLETED", "FAILED", or
  /// "CANCELED".
  final AuditTaskStatus? taskStatus;

  /// The type of this audit. One of "ON_DEMAND_AUDIT_TASK" or
  /// "SCHEDULED_AUDIT_TASK".
  final AuditTaskType? taskType;

  AuditTaskMetadata({
    this.taskId,
    this.taskStatus,
    this.taskType,
  });

  factory AuditTaskMetadata.fromJson(Map<String, dynamic> json) {
    return AuditTaskMetadata(
      taskId: json['taskId'] as String?,
      taskStatus:
          (json['taskStatus'] as String?)?.let(AuditTaskStatus.fromString),
      taskType: (json['taskType'] as String?)?.let(AuditTaskType.fromString),
    );
  }
}

enum AuditTaskStatus {
  inProgress('IN_PROGRESS'),
  completed('COMPLETED'),
  failed('FAILED'),
  canceled('CANCELED'),
  ;

  final String value;

  const AuditTaskStatus(this.value);

  static AuditTaskStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AuditTaskStatus'));
}

enum AuditTaskType {
  onDemandAuditTask('ON_DEMAND_AUDIT_TASK'),
  scheduledAuditTask('SCHEDULED_AUDIT_TASK'),
  ;

  final String value;

  const AuditTaskType(this.value);

  static AuditTaskType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AuditTaskType'));
}

enum AuthDecision {
  allowed('ALLOWED'),
  explicitDeny('EXPLICIT_DENY'),
  implicitDeny('IMPLICIT_DENY'),
  ;

  final String value;

  const AuthDecision(this.value);

  static AuthDecision fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AuthDecision'));
}

/// A collection of authorization information.
class AuthInfo {
  /// The resources for which the principal is being authorized to perform the
  /// specified action.
  final List<String> resources;

  /// The type of action for which the principal is being authorized.
  final ActionType? actionType;

  AuthInfo({
    required this.resources,
    this.actionType,
  });

  factory AuthInfo.fromJson(Map<String, dynamic> json) {
    return AuthInfo(
      resources:
          (json['resources'] as List).nonNulls.map((e) => e as String).toList(),
      actionType: (json['actionType'] as String?)?.let(ActionType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final resources = this.resources;
    final actionType = this.actionType;
    return {
      'resources': resources,
      if (actionType != null) 'actionType': actionType.value,
    };
  }
}

/// The authorizer result.
class AuthResult {
  /// The policies and statements that allowed the specified action.
  final Allowed? allowed;

  /// The final authorization decision of this scenario. Multiple statements are
  /// taken into account when determining the authorization decision. An explicit
  /// deny statement can override multiple allow statements.
  final AuthDecision? authDecision;

  /// Authorization information.
  final AuthInfo? authInfo;

  /// The policies and statements that denied the specified action.
  final Denied? denied;

  /// Contains any missing context values found while evaluating policy.
  final List<String>? missingContextValues;

  AuthResult({
    this.allowed,
    this.authDecision,
    this.authInfo,
    this.denied,
    this.missingContextValues,
  });

  factory AuthResult.fromJson(Map<String, dynamic> json) {
    return AuthResult(
      allowed: json['allowed'] != null
          ? Allowed.fromJson(json['allowed'] as Map<String, dynamic>)
          : null,
      authDecision:
          (json['authDecision'] as String?)?.let(AuthDecision.fromString),
      authInfo: json['authInfo'] != null
          ? AuthInfo.fromJson(json['authInfo'] as Map<String, dynamic>)
          : null,
      denied: json['denied'] != null
          ? Denied.fromJson(json['denied'] as Map<String, dynamic>)
          : null,
      missingContextValues: (json['missingContextValues'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }
}

/// An object that specifies the authorization service for a domain.
class AuthorizerConfig {
  /// A Boolean that specifies whether the domain configuration's authorization
  /// service can be overridden.
  final bool? allowAuthorizerOverride;

  /// The name of the authorization service for a domain configuration.
  final String? defaultAuthorizerName;

  AuthorizerConfig({
    this.allowAuthorizerOverride,
    this.defaultAuthorizerName,
  });

  factory AuthorizerConfig.fromJson(Map<String, dynamic> json) {
    return AuthorizerConfig(
      allowAuthorizerOverride: json['allowAuthorizerOverride'] as bool?,
      defaultAuthorizerName: json['defaultAuthorizerName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowAuthorizerOverride = this.allowAuthorizerOverride;
    final defaultAuthorizerName = this.defaultAuthorizerName;
    return {
      if (allowAuthorizerOverride != null)
        'allowAuthorizerOverride': allowAuthorizerOverride,
      if (defaultAuthorizerName != null)
        'defaultAuthorizerName': defaultAuthorizerName,
    };
  }
}

/// The authorizer description.
class AuthorizerDescription {
  /// The authorizer ARN.
  final String? authorizerArn;

  /// The authorizer's Lambda function ARN.
  final String? authorizerFunctionArn;

  /// The authorizer name.
  final String? authorizerName;

  /// The UNIX timestamp of when the authorizer was created.
  final DateTime? creationDate;

  /// When <code>true</code>, the result from the authorizer’s Lambda function is
  /// cached for the time specified in <code>refreshAfterInSeconds</code>. The
  /// cached result is used while the device reuses the same HTTP connection.
  final bool? enableCachingForHttp;

  /// The UNIX timestamp of when the authorizer was last updated.
  final DateTime? lastModifiedDate;

  /// Specifies whether IoT validates the token signature in an authorization
  /// request.
  final bool? signingDisabled;

  /// The status of the authorizer.
  final AuthorizerStatus? status;

  /// The key used to extract the token from the HTTP headers.
  final String? tokenKeyName;

  /// The public keys used to validate the token signature returned by your custom
  /// authentication service.
  final Map<String, String>? tokenSigningPublicKeys;

  AuthorizerDescription({
    this.authorizerArn,
    this.authorizerFunctionArn,
    this.authorizerName,
    this.creationDate,
    this.enableCachingForHttp,
    this.lastModifiedDate,
    this.signingDisabled,
    this.status,
    this.tokenKeyName,
    this.tokenSigningPublicKeys,
  });

  factory AuthorizerDescription.fromJson(Map<String, dynamic> json) {
    return AuthorizerDescription(
      authorizerArn: json['authorizerArn'] as String?,
      authorizerFunctionArn: json['authorizerFunctionArn'] as String?,
      authorizerName: json['authorizerName'] as String?,
      creationDate: timeStampFromJson(json['creationDate']),
      enableCachingForHttp: json['enableCachingForHttp'] as bool?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      signingDisabled: json['signingDisabled'] as bool?,
      status: (json['status'] as String?)?.let(AuthorizerStatus.fromString),
      tokenKeyName: json['tokenKeyName'] as String?,
      tokenSigningPublicKeys:
          (json['tokenSigningPublicKeys'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

enum AuthorizerStatus {
  active('ACTIVE'),
  inactive('INACTIVE'),
  ;

  final String value;

  const AuthorizerStatus(this.value);

  static AuthorizerStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AuthorizerStatus'));
}

/// The authorizer summary.
class AuthorizerSummary {
  /// The authorizer ARN.
  final String? authorizerArn;

  /// The authorizer name.
  final String? authorizerName;

  AuthorizerSummary({
    this.authorizerArn,
    this.authorizerName,
  });

  factory AuthorizerSummary.fromJson(Map<String, dynamic> json) {
    return AuthorizerSummary(
      authorizerArn: json['authorizerArn'] as String?,
      authorizerName: json['authorizerName'] as String?,
    );
  }
}

enum AutoRegistrationStatus {
  enable('ENABLE'),
  disable('DISABLE'),
  ;

  final String value;

  const AutoRegistrationStatus(this.value);

  static AutoRegistrationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AutoRegistrationStatus'));
}

/// The criteria that determine when and how a job abort takes place.
class AwsJobAbortConfig {
  /// The list of criteria that determine when and how to abort the job.
  final List<AwsJobAbortCriteria> abortCriteriaList;

  AwsJobAbortConfig({
    required this.abortCriteriaList,
  });

  Map<String, dynamic> toJson() {
    final abortCriteriaList = this.abortCriteriaList;
    return {
      'abortCriteriaList': abortCriteriaList,
    };
  }
}

/// The criteria that determine when and how a job abort takes place.
class AwsJobAbortCriteria {
  /// The type of job action to take to initiate the job abort.
  final AwsJobAbortCriteriaAbortAction action;

  /// The type of job execution failures that can initiate a job abort.
  final AwsJobAbortCriteriaFailureType failureType;

  /// The minimum number of things which must receive job execution notifications
  /// before the job can be aborted.
  final int minNumberOfExecutedThings;

  /// The minimum percentage of job execution failures that must occur to initiate
  /// the job abort.
  ///
  /// Amazon Web Services IoT Core supports up to two digits after the decimal
  /// (for example, 10.9 and 10.99, but not 10.999).
  final double thresholdPercentage;

  AwsJobAbortCriteria({
    required this.action,
    required this.failureType,
    required this.minNumberOfExecutedThings,
    required this.thresholdPercentage,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final failureType = this.failureType;
    final minNumberOfExecutedThings = this.minNumberOfExecutedThings;
    final thresholdPercentage = this.thresholdPercentage;
    return {
      'action': action.value,
      'failureType': failureType.value,
      'minNumberOfExecutedThings': minNumberOfExecutedThings,
      'thresholdPercentage': thresholdPercentage,
    };
  }
}

enum AwsJobAbortCriteriaAbortAction {
  cancel('CANCEL'),
  ;

  final String value;

  const AwsJobAbortCriteriaAbortAction(this.value);

  static AwsJobAbortCriteriaAbortAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AwsJobAbortCriteriaAbortAction'));
}

enum AwsJobAbortCriteriaFailureType {
  failed('FAILED'),
  rejected('REJECTED'),
  timedOut('TIMED_OUT'),
  all('ALL'),
  ;

  final String value;

  const AwsJobAbortCriteriaFailureType(this.value);

  static AwsJobAbortCriteriaFailureType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AwsJobAbortCriteriaFailureType'));
}

/// Configuration for the rollout of OTA updates.
class AwsJobExecutionsRolloutConfig {
  /// The rate of increase for a job rollout. This parameter allows you to define
  /// an exponential rate increase for a job rollout.
  final AwsJobExponentialRolloutRate? exponentialRate;

  /// The maximum number of OTA update job executions started per minute.
  final int? maximumPerMinute;

  AwsJobExecutionsRolloutConfig({
    this.exponentialRate,
    this.maximumPerMinute,
  });

  factory AwsJobExecutionsRolloutConfig.fromJson(Map<String, dynamic> json) {
    return AwsJobExecutionsRolloutConfig(
      exponentialRate: json['exponentialRate'] != null
          ? AwsJobExponentialRolloutRate.fromJson(
              json['exponentialRate'] as Map<String, dynamic>)
          : null,
      maximumPerMinute: json['maximumPerMinute'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final exponentialRate = this.exponentialRate;
    final maximumPerMinute = this.maximumPerMinute;
    return {
      if (exponentialRate != null) 'exponentialRate': exponentialRate,
      if (maximumPerMinute != null) 'maximumPerMinute': maximumPerMinute,
    };
  }
}

/// The rate of increase for a job rollout. This parameter allows you to define
/// an exponential rate increase for a job rollout.
class AwsJobExponentialRolloutRate {
  /// The minimum number of things that will be notified of a pending job, per
  /// minute, at the start of the job rollout. This is the initial rate of the
  /// rollout.
  final int baseRatePerMinute;

  /// The rate of increase for a job rollout. The number of things notified is
  /// multiplied by this factor.
  final double incrementFactor;

  /// The criteria to initiate the increase in rate of rollout for a job.
  ///
  /// Amazon Web Services IoT Core supports up to one digit after the decimal (for
  /// example, 1.5, but not 1.55).
  final AwsJobRateIncreaseCriteria rateIncreaseCriteria;

  AwsJobExponentialRolloutRate({
    required this.baseRatePerMinute,
    required this.incrementFactor,
    required this.rateIncreaseCriteria,
  });

  factory AwsJobExponentialRolloutRate.fromJson(Map<String, dynamic> json) {
    return AwsJobExponentialRolloutRate(
      baseRatePerMinute: json['baseRatePerMinute'] as int,
      incrementFactor: json['incrementFactor'] as double,
      rateIncreaseCriteria: AwsJobRateIncreaseCriteria.fromJson(
          json['rateIncreaseCriteria'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final baseRatePerMinute = this.baseRatePerMinute;
    final incrementFactor = this.incrementFactor;
    final rateIncreaseCriteria = this.rateIncreaseCriteria;
    return {
      'baseRatePerMinute': baseRatePerMinute,
      'incrementFactor': incrementFactor,
      'rateIncreaseCriteria': rateIncreaseCriteria,
    };
  }
}

/// Configuration information for pre-signed URLs. Valid when
/// <code>protocols</code> contains HTTP.
class AwsJobPresignedUrlConfig {
  /// How long (in seconds) pre-signed URLs are valid. Valid values are 60 - 3600,
  /// the default value is 1800 seconds. Pre-signed URLs are generated when a
  /// request for the job document is received.
  final int? expiresInSec;

  AwsJobPresignedUrlConfig({
    this.expiresInSec,
  });

  factory AwsJobPresignedUrlConfig.fromJson(Map<String, dynamic> json) {
    return AwsJobPresignedUrlConfig(
      expiresInSec: json['expiresInSec'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final expiresInSec = this.expiresInSec;
    return {
      if (expiresInSec != null) 'expiresInSec': expiresInSec,
    };
  }
}

/// The criteria to initiate the increase in rate of rollout for a job.
class AwsJobRateIncreaseCriteria {
  /// When this number of things have been notified, it will initiate an increase
  /// in the rollout rate.
  final int? numberOfNotifiedThings;

  /// When this number of things have succeeded in their job execution, it will
  /// initiate an increase in the rollout rate.
  final int? numberOfSucceededThings;

  AwsJobRateIncreaseCriteria({
    this.numberOfNotifiedThings,
    this.numberOfSucceededThings,
  });

  factory AwsJobRateIncreaseCriteria.fromJson(Map<String, dynamic> json) {
    return AwsJobRateIncreaseCriteria(
      numberOfNotifiedThings: json['numberOfNotifiedThings'] as int?,
      numberOfSucceededThings: json['numberOfSucceededThings'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfNotifiedThings = this.numberOfNotifiedThings;
    final numberOfSucceededThings = this.numberOfSucceededThings;
    return {
      if (numberOfNotifiedThings != null)
        'numberOfNotifiedThings': numberOfNotifiedThings,
      if (numberOfSucceededThings != null)
        'numberOfSucceededThings': numberOfSucceededThings,
    };
  }
}

/// Specifies the amount of time each device has to finish its execution of the
/// job. A timer is started when the job execution status is set to
/// <code>IN_PROGRESS</code>. If the job execution status is not set to another
/// terminal state before the timer expires, it will be automatically set to
/// <code>TIMED_OUT</code>.
class AwsJobTimeoutConfig {
  /// Specifies the amount of time, in minutes, this device has to finish
  /// execution of this job. The timeout interval can be anywhere between 1 minute
  /// and 7 days (1 to 10080 minutes). The in progress timer can't be updated and
  /// will apply to all job executions for the job. Whenever a job execution
  /// remains in the IN_PROGRESS status for longer than this interval, the job
  /// execution will fail and switch to the terminal <code>TIMED_OUT</code>
  /// status.
  final int? inProgressTimeoutInMinutes;

  AwsJobTimeoutConfig({
    this.inProgressTimeoutInMinutes,
  });

  Map<String, dynamic> toJson() {
    final inProgressTimeoutInMinutes = this.inProgressTimeoutInMinutes;
    return {
      if (inProgressTimeoutInMinutes != null)
        'inProgressTimeoutInMinutes': inProgressTimeoutInMinutes,
    };
  }
}

/// A Device Defender security profile behavior.
class Behavior {
  /// The name you've given to the behavior.
  final String name;

  /// The criteria that determine if a device is behaving normally in regard to
  /// the <code>metric</code>.
  /// <note>
  /// In the IoT console, you can choose to be sent an alert through Amazon SNS
  /// when IoT Device Defender detects that a device is behaving anomalously.
  /// </note>
  final BehaviorCriteria? criteria;

  /// Value indicates exporting metrics related to the behavior when it is true.
  final bool? exportMetric;

  /// What is measured by the behavior.
  final String? metric;

  /// The dimension for a metric in your behavior. For example, using a
  /// <code>TOPIC_FILTER</code> dimension, you can narrow down the scope of the
  /// metric to only MQTT topics where the name matches the pattern specified in
  /// the dimension. This can't be used with custom metrics.
  final MetricDimension? metricDimension;

  /// Suppresses alerts.
  final bool? suppressAlerts;

  Behavior({
    required this.name,
    this.criteria,
    this.exportMetric,
    this.metric,
    this.metricDimension,
    this.suppressAlerts,
  });

  factory Behavior.fromJson(Map<String, dynamic> json) {
    return Behavior(
      name: json['name'] as String,
      criteria: json['criteria'] != null
          ? BehaviorCriteria.fromJson(json['criteria'] as Map<String, dynamic>)
          : null,
      exportMetric: json['exportMetric'] as bool?,
      metric: json['metric'] as String?,
      metricDimension: json['metricDimension'] != null
          ? MetricDimension.fromJson(
              json['metricDimension'] as Map<String, dynamic>)
          : null,
      suppressAlerts: json['suppressAlerts'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final criteria = this.criteria;
    final exportMetric = this.exportMetric;
    final metric = this.metric;
    final metricDimension = this.metricDimension;
    final suppressAlerts = this.suppressAlerts;
    return {
      'name': name,
      if (criteria != null) 'criteria': criteria,
      if (exportMetric != null) 'exportMetric': exportMetric,
      if (metric != null) 'metric': metric,
      if (metricDimension != null) 'metricDimension': metricDimension,
      if (suppressAlerts != null) 'suppressAlerts': suppressAlerts,
    };
  }
}

/// The criteria by which the behavior is determined to be normal.
class BehaviorCriteria {
  /// The operator that relates the thing measured (<code>metric</code>) to the
  /// criteria (containing a <code>value</code> or
  /// <code>statisticalThreshold</code>). Valid operators include:
  ///
  /// <ul>
  /// <li>
  /// <code>string-list</code>: <code>in-set</code> and <code>not-in-set</code>
  /// </li>
  /// <li>
  /// <code>number-list</code>: <code>in-set</code> and <code>not-in-set</code>
  /// </li>
  /// <li>
  /// <code>ip-address-list</code>: <code>in-cidr-set</code> and
  /// <code>not-in-cidr-set</code>
  /// </li>
  /// <li>
  /// <code>number</code>: <code>less-than</code>, <code>less-than-equals</code>,
  /// <code>greater-than</code>, and <code>greater-than-equals</code>
  /// </li>
  /// </ul>
  final ComparisonOperator? comparisonOperator;

  /// If a device is in violation of the behavior for the specified number of
  /// consecutive datapoints, an alarm occurs. If not specified, the default is 1.
  final int? consecutiveDatapointsToAlarm;

  /// If an alarm has occurred and the offending device is no longer in violation
  /// of the behavior for the specified number of consecutive datapoints, the
  /// alarm is cleared. If not specified, the default is 1.
  final int? consecutiveDatapointsToClear;

  /// Use this to specify the time duration over which the behavior is evaluated,
  /// for those criteria that have a time dimension (for example,
  /// <code>NUM_MESSAGES_SENT</code>). For a <code>statisticalThreshhold</code>
  /// metric comparison, measurements from all devices are accumulated over this
  /// time duration before being used to calculate percentiles, and later,
  /// measurements from an individual device are also accumulated over this time
  /// duration before being given a percentile rank. Cannot be used with
  /// list-based metric datatypes.
  final int? durationSeconds;

  /// The configuration of an ML Detect
  final MachineLearningDetectionConfig? mlDetectionConfig;

  /// A statistical ranking (percentile)that indicates a threshold value by which
  /// a behavior is determined to be in compliance or in violation of the
  /// behavior.
  final StatisticalThreshold? statisticalThreshold;

  /// The value to be compared with the <code>metric</code>.
  final MetricValue? value;

  BehaviorCriteria({
    this.comparisonOperator,
    this.consecutiveDatapointsToAlarm,
    this.consecutiveDatapointsToClear,
    this.durationSeconds,
    this.mlDetectionConfig,
    this.statisticalThreshold,
    this.value,
  });

  factory BehaviorCriteria.fromJson(Map<String, dynamic> json) {
    return BehaviorCriteria(
      comparisonOperator: (json['comparisonOperator'] as String?)
          ?.let(ComparisonOperator.fromString),
      consecutiveDatapointsToAlarm:
          json['consecutiveDatapointsToAlarm'] as int?,
      consecutiveDatapointsToClear:
          json['consecutiveDatapointsToClear'] as int?,
      durationSeconds: json['durationSeconds'] as int?,
      mlDetectionConfig: json['mlDetectionConfig'] != null
          ? MachineLearningDetectionConfig.fromJson(
              json['mlDetectionConfig'] as Map<String, dynamic>)
          : null,
      statisticalThreshold: json['statisticalThreshold'] != null
          ? StatisticalThreshold.fromJson(
              json['statisticalThreshold'] as Map<String, dynamic>)
          : null,
      value: json['value'] != null
          ? MetricValue.fromJson(json['value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final consecutiveDatapointsToAlarm = this.consecutiveDatapointsToAlarm;
    final consecutiveDatapointsToClear = this.consecutiveDatapointsToClear;
    final durationSeconds = this.durationSeconds;
    final mlDetectionConfig = this.mlDetectionConfig;
    final statisticalThreshold = this.statisticalThreshold;
    final value = this.value;
    return {
      if (comparisonOperator != null)
        'comparisonOperator': comparisonOperator.value,
      if (consecutiveDatapointsToAlarm != null)
        'consecutiveDatapointsToAlarm': consecutiveDatapointsToAlarm,
      if (consecutiveDatapointsToClear != null)
        'consecutiveDatapointsToClear': consecutiveDatapointsToClear,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
      if (mlDetectionConfig != null) 'mlDetectionConfig': mlDetectionConfig,
      if (statisticalThreshold != null)
        'statisticalThreshold': statisticalThreshold,
      if (value != null) 'value': value,
    };
  }
}

enum BehaviorCriteriaType {
  static('STATIC'),
  statistical('STATISTICAL'),
  machineLearning('MACHINE_LEARNING'),
  ;

  final String value;

  const BehaviorCriteriaType(this.value);

  static BehaviorCriteriaType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum BehaviorCriteriaType'));
}

/// The summary of an ML Detect behavior model.
class BehaviorModelTrainingSummary {
  /// The name of the behavior.
  final String? behaviorName;

  /// The percentage of datapoints collected.
  final double? datapointsCollectionPercentage;

  /// The date the model was last refreshed.
  final DateTime? lastModelRefreshDate;

  /// The status of the behavior model.
  final ModelStatus? modelStatus;

  /// The name of the security profile.
  final String? securityProfileName;

  /// The date a training model started collecting data.
  final DateTime? trainingDataCollectionStartDate;

  BehaviorModelTrainingSummary({
    this.behaviorName,
    this.datapointsCollectionPercentage,
    this.lastModelRefreshDate,
    this.modelStatus,
    this.securityProfileName,
    this.trainingDataCollectionStartDate,
  });

  factory BehaviorModelTrainingSummary.fromJson(Map<String, dynamic> json) {
    return BehaviorModelTrainingSummary(
      behaviorName: json['behaviorName'] as String?,
      datapointsCollectionPercentage:
          json['datapointsCollectionPercentage'] as double?,
      lastModelRefreshDate: timeStampFromJson(json['lastModelRefreshDate']),
      modelStatus:
          (json['modelStatus'] as String?)?.let(ModelStatus.fromString),
      securityProfileName: json['securityProfileName'] as String?,
      trainingDataCollectionStartDate:
          timeStampFromJson(json['trainingDataCollectionStartDate']),
    );
  }
}

/// Additional information about the billing group.
class BillingGroupMetadata {
  /// The date the billing group was created.
  final DateTime? creationDate;

  BillingGroupMetadata({
    this.creationDate,
  });

  factory BillingGroupMetadata.fromJson(Map<String, dynamic> json) {
    return BillingGroupMetadata(
      creationDate: timeStampFromJson(json['creationDate']),
    );
  }
}

/// The properties of a billing group.
class BillingGroupProperties {
  /// The description of the billing group.
  final String? billingGroupDescription;

  BillingGroupProperties({
    this.billingGroupDescription,
  });

  factory BillingGroupProperties.fromJson(Map<String, dynamic> json) {
    return BillingGroupProperties(
      billingGroupDescription: json['billingGroupDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final billingGroupDescription = this.billingGroupDescription;
    return {
      if (billingGroupDescription != null)
        'billingGroupDescription': billingGroupDescription,
    };
  }
}

/// A count of documents that meets a specific aggregation criteria.
class Bucket {
  /// The number of documents that have the value counted for the particular
  /// bucket.
  final int? count;

  /// The value counted for the particular bucket.
  final String? keyValue;

  Bucket({
    this.count,
    this.keyValue,
  });

  factory Bucket.fromJson(Map<String, dynamic> json) {
    return Bucket(
      count: json['count'] as int?,
      keyValue: json['keyValue'] as String?,
    );
  }
}

/// The type of bucketed aggregation performed.
class BucketsAggregationType {
  /// Performs an aggregation that will return a list of buckets. The list of
  /// buckets is a ranked list of the number of occurrences of an aggregation
  /// field value.
  final TermsAggregation? termsAggregation;

  BucketsAggregationType({
    this.termsAggregation,
  });

  Map<String, dynamic> toJson() {
    final termsAggregation = this.termsAggregation;
    return {
      if (termsAggregation != null) 'termsAggregation': termsAggregation,
    };
  }
}

/// A CA certificate.
class CACertificate {
  /// The ARN of the CA certificate.
  final String? certificateArn;

  /// The ID of the CA certificate.
  final String? certificateId;

  /// The date the CA certificate was created.
  final DateTime? creationDate;

  /// The status of the CA certificate.
  ///
  /// The status value REGISTER_INACTIVE is deprecated and should not be used.
  final CACertificateStatus? status;

  CACertificate({
    this.certificateArn,
    this.certificateId,
    this.creationDate,
    this.status,
  });

  factory CACertificate.fromJson(Map<String, dynamic> json) {
    return CACertificate(
      certificateArn: json['certificateArn'] as String?,
      certificateId: json['certificateId'] as String?,
      creationDate: timeStampFromJson(json['creationDate']),
      status: (json['status'] as String?)?.let(CACertificateStatus.fromString),
    );
  }
}

/// Describes a CA certificate.
class CACertificateDescription {
  /// Whether the CA certificate configured for auto registration of device
  /// certificates. Valid values are "ENABLE" and "DISABLE"
  final AutoRegistrationStatus? autoRegistrationStatus;

  /// The CA certificate ARN.
  final String? certificateArn;

  /// The CA certificate ID.
  final String? certificateId;

  /// The mode of the CA.
  ///
  /// All the device certificates that are registered using this CA will be
  /// registered in the same mode as the CA. For more information about
  /// certificate mode for device certificates, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_CertificateDescription.html#iot-Type-CertificateDescription-certificateMode">certificate
  /// mode</a>.
  final CertificateMode? certificateMode;

  /// The CA certificate data, in PEM format.
  final String? certificatePem;

  /// The date the CA certificate was created.
  final DateTime? creationDate;

  /// The customer version of the CA certificate.
  final int? customerVersion;

  /// The generation ID of the CA certificate.
  final String? generationId;

  /// The date the CA certificate was last modified.
  final DateTime? lastModifiedDate;

  /// The owner of the CA certificate.
  final String? ownedBy;

  /// The status of a CA certificate.
  final CACertificateStatus? status;

  /// When the CA certificate is valid.
  final CertificateValidity? validity;

  CACertificateDescription({
    this.autoRegistrationStatus,
    this.certificateArn,
    this.certificateId,
    this.certificateMode,
    this.certificatePem,
    this.creationDate,
    this.customerVersion,
    this.generationId,
    this.lastModifiedDate,
    this.ownedBy,
    this.status,
    this.validity,
  });

  factory CACertificateDescription.fromJson(Map<String, dynamic> json) {
    return CACertificateDescription(
      autoRegistrationStatus: (json['autoRegistrationStatus'] as String?)
          ?.let(AutoRegistrationStatus.fromString),
      certificateArn: json['certificateArn'] as String?,
      certificateId: json['certificateId'] as String?,
      certificateMode:
          (json['certificateMode'] as String?)?.let(CertificateMode.fromString),
      certificatePem: json['certificatePem'] as String?,
      creationDate: timeStampFromJson(json['creationDate']),
      customerVersion: json['customerVersion'] as int?,
      generationId: json['generationId'] as String?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      ownedBy: json['ownedBy'] as String?,
      status: (json['status'] as String?)?.let(CACertificateStatus.fromString),
      validity: json['validity'] != null
          ? CertificateValidity.fromJson(
              json['validity'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum CACertificateStatus {
  active('ACTIVE'),
  inactive('INACTIVE'),
  ;

  final String value;

  const CACertificateStatus(this.value);

  static CACertificateStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum CACertificateStatus'));
}

enum CACertificateUpdateAction {
  deactivate('DEACTIVATE'),
  ;

  final String value;

  const CACertificateUpdateAction(this.value);

  static CACertificateUpdateAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum CACertificateUpdateAction'));
}

class CancelAuditMitigationActionsTaskResponse {
  CancelAuditMitigationActionsTaskResponse();

  factory CancelAuditMitigationActionsTaskResponse.fromJson(
      Map<String, dynamic> _) {
    return CancelAuditMitigationActionsTaskResponse();
  }
}

class CancelAuditTaskResponse {
  CancelAuditTaskResponse();

  factory CancelAuditTaskResponse.fromJson(Map<String, dynamic> _) {
    return CancelAuditTaskResponse();
  }
}

class CancelDetectMitigationActionsTaskResponse {
  CancelDetectMitigationActionsTaskResponse();

  factory CancelDetectMitigationActionsTaskResponse.fromJson(
      Map<String, dynamic> _) {
    return CancelDetectMitigationActionsTaskResponse();
  }
}

class CancelJobResponse {
  /// A short text description of the job.
  final String? description;

  /// The job ARN.
  final String? jobArn;

  /// The unique identifier you assigned to this job when it was created.
  final String? jobId;

  CancelJobResponse({
    this.description,
    this.jobArn,
    this.jobId,
  });

  factory CancelJobResponse.fromJson(Map<String, dynamic> json) {
    return CancelJobResponse(
      description: json['description'] as String?,
      jobArn: json['jobArn'] as String?,
      jobId: json['jobId'] as String?,
    );
  }
}

enum CannedAccessControlList {
  private('private'),
  publicRead('public-read'),
  publicReadWrite('public-read-write'),
  awsExecRead('aws-exec-read'),
  authenticatedRead('authenticated-read'),
  bucketOwnerRead('bucket-owner-read'),
  bucketOwnerFullControl('bucket-owner-full-control'),
  logDeliveryWrite('log-delivery-write'),
  ;

  final String value;

  const CannedAccessControlList(this.value);

  static CannedAccessControlList fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum CannedAccessControlList'));
}

/// Information about a certificate.
class Certificate {
  /// The ARN of the certificate.
  final String? certificateArn;

  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  final String? certificateId;

  /// The mode of the certificate.
  ///
  /// <code>DEFAULT</code>: A certificate in <code>DEFAULT</code> mode is either
  /// generated by Amazon Web Services IoT Core or registered with an issuer
  /// certificate authority (CA) in <code>DEFAULT</code> mode. Devices with
  /// certificates in <code>DEFAULT</code> mode aren't required to send the Server
  /// Name Indication (SNI) extension when connecting to Amazon Web Services IoT
  /// Core. However, to use features such as custom domains and VPC endpoints, we
  /// recommend that you use the SNI extension when connecting to Amazon Web
  /// Services IoT Core.
  ///
  /// <code>SNI_ONLY</code>: A certificate in <code>SNI_ONLY</code> mode is
  /// registered without an issuer CA. Devices with certificates in
  /// <code>SNI_ONLY</code> mode must send the SNI extension when connecting to
  /// Amazon Web Services IoT Core.
  final CertificateMode? certificateMode;

  /// The date and time the certificate was created.
  final DateTime? creationDate;

  /// The status of the certificate.
  ///
  /// The status value REGISTER_INACTIVE is deprecated and should not be used.
  final CertificateStatus? status;

  Certificate({
    this.certificateArn,
    this.certificateId,
    this.certificateMode,
    this.creationDate,
    this.status,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      certificateArn: json['certificateArn'] as String?,
      certificateId: json['certificateId'] as String?,
      certificateMode:
          (json['certificateMode'] as String?)?.let(CertificateMode.fromString),
      creationDate: timeStampFromJson(json['creationDate']),
      status: (json['status'] as String?)?.let(CertificateStatus.fromString),
    );
  }
}

/// Describes a certificate.
class CertificateDescription {
  /// The certificate ID of the CA certificate used to sign this certificate.
  final String? caCertificateId;

  /// The ARN of the certificate.
  final String? certificateArn;

  /// The ID of the certificate.
  final String? certificateId;

  /// The mode of the certificate.
  ///
  /// <code>DEFAULT</code>: A certificate in <code>DEFAULT</code> mode is either
  /// generated by Amazon Web Services IoT Core or registered with an issuer
  /// certificate authority (CA) in <code>DEFAULT</code> mode. Devices with
  /// certificates in <code>DEFAULT</code> mode aren't required to send the Server
  /// Name Indication (SNI) extension when connecting to Amazon Web Services IoT
  /// Core. However, to use features such as custom domains and VPC endpoints, we
  /// recommend that you use the SNI extension when connecting to Amazon Web
  /// Services IoT Core.
  ///
  /// <code>SNI_ONLY</code>: A certificate in <code>SNI_ONLY</code> mode is
  /// registered without an issuer CA. Devices with certificates in
  /// <code>SNI_ONLY</code> mode must send the SNI extension when connecting to
  /// Amazon Web Services IoT Core.
  ///
  /// For more information about the value for SNI extension, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/transport-security.html">Transport
  /// security in IoT</a>.
  final CertificateMode? certificateMode;

  /// The certificate data, in PEM format.
  final String? certificatePem;

  /// The date and time the certificate was created.
  final DateTime? creationDate;

  /// The customer version of the certificate.
  final int? customerVersion;

  /// The generation ID of the certificate.
  final String? generationId;

  /// The date and time the certificate was last modified.
  final DateTime? lastModifiedDate;

  /// The ID of the Amazon Web Services account that owns the certificate.
  final String? ownedBy;

  /// The ID of the Amazon Web Services account of the previous owner of the
  /// certificate.
  final String? previousOwnedBy;

  /// The status of the certificate.
  final CertificateStatus? status;

  /// The transfer data.
  final TransferData? transferData;

  /// When the certificate is valid.
  final CertificateValidity? validity;

  CertificateDescription({
    this.caCertificateId,
    this.certificateArn,
    this.certificateId,
    this.certificateMode,
    this.certificatePem,
    this.creationDate,
    this.customerVersion,
    this.generationId,
    this.lastModifiedDate,
    this.ownedBy,
    this.previousOwnedBy,
    this.status,
    this.transferData,
    this.validity,
  });

  factory CertificateDescription.fromJson(Map<String, dynamic> json) {
    return CertificateDescription(
      caCertificateId: json['caCertificateId'] as String?,
      certificateArn: json['certificateArn'] as String?,
      certificateId: json['certificateId'] as String?,
      certificateMode:
          (json['certificateMode'] as String?)?.let(CertificateMode.fromString),
      certificatePem: json['certificatePem'] as String?,
      creationDate: timeStampFromJson(json['creationDate']),
      customerVersion: json['customerVersion'] as int?,
      generationId: json['generationId'] as String?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      ownedBy: json['ownedBy'] as String?,
      previousOwnedBy: json['previousOwnedBy'] as String?,
      status: (json['status'] as String?)?.let(CertificateStatus.fromString),
      transferData: json['transferData'] != null
          ? TransferData.fromJson(json['transferData'] as Map<String, dynamic>)
          : null,
      validity: json['validity'] != null
          ? CertificateValidity.fromJson(
              json['validity'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum CertificateMode {
  $default('DEFAULT'),
  sniOnly('SNI_ONLY'),
  ;

  final String value;

  const CertificateMode(this.value);

  static CertificateMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum CertificateMode'));
}

enum CertificateProviderOperation {
  createCertificateFromCsr('CreateCertificateFromCsr'),
  ;

  final String value;

  const CertificateProviderOperation(this.value);

  static CertificateProviderOperation fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum CertificateProviderOperation'));
}

/// The certificate provider summary.
class CertificateProviderSummary {
  /// The ARN of the certificate provider.
  final String? certificateProviderArn;

  /// The name of the certificate provider.
  final String? certificateProviderName;

  CertificateProviderSummary({
    this.certificateProviderArn,
    this.certificateProviderName,
  });

  factory CertificateProviderSummary.fromJson(Map<String, dynamic> json) {
    return CertificateProviderSummary(
      certificateProviderArn: json['certificateProviderArn'] as String?,
      certificateProviderName: json['certificateProviderName'] as String?,
    );
  }
}

enum CertificateStatus {
  active('ACTIVE'),
  inactive('INACTIVE'),
  revoked('REVOKED'),
  pendingTransfer('PENDING_TRANSFER'),
  registerInactive('REGISTER_INACTIVE'),
  pendingActivation('PENDING_ACTIVATION'),
  ;

  final String value;

  const CertificateStatus(this.value);

  static CertificateStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum CertificateStatus'));
}

/// When the certificate is valid.
class CertificateValidity {
  /// The certificate is not valid after this date.
  final DateTime? notAfter;

  /// The certificate is not valid before this date.
  final DateTime? notBefore;

  CertificateValidity({
    this.notAfter,
    this.notBefore,
  });

  factory CertificateValidity.fromJson(Map<String, dynamic> json) {
    return CertificateValidity(
      notAfter: timeStampFromJson(json['notAfter']),
      notBefore: timeStampFromJson(json['notBefore']),
    );
  }
}

class ClearDefaultAuthorizerResponse {
  ClearDefaultAuthorizerResponse();

  factory ClearDefaultAuthorizerResponse.fromJson(Map<String, dynamic> _) {
    return ClearDefaultAuthorizerResponse();
  }
}

/// Describes an action that updates a CloudWatch alarm.
class CloudwatchAlarmAction {
  /// The CloudWatch alarm name.
  final String alarmName;

  /// The IAM role that allows access to the CloudWatch alarm.
  final String roleArn;

  /// The reason for the alarm change.
  final String stateReason;

  /// The value of the alarm state. Acceptable values are: OK, ALARM,
  /// INSUFFICIENT_DATA.
  final String stateValue;

  CloudwatchAlarmAction({
    required this.alarmName,
    required this.roleArn,
    required this.stateReason,
    required this.stateValue,
  });

  factory CloudwatchAlarmAction.fromJson(Map<String, dynamic> json) {
    return CloudwatchAlarmAction(
      alarmName: json['alarmName'] as String,
      roleArn: json['roleArn'] as String,
      stateReason: json['stateReason'] as String,
      stateValue: json['stateValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final alarmName = this.alarmName;
    final roleArn = this.roleArn;
    final stateReason = this.stateReason;
    final stateValue = this.stateValue;
    return {
      'alarmName': alarmName,
      'roleArn': roleArn,
      'stateReason': stateReason,
      'stateValue': stateValue,
    };
  }
}

/// Describes an action that sends data to CloudWatch Logs.
class CloudwatchLogsAction {
  /// The CloudWatch log group to which the action sends data.
  final String logGroupName;

  /// The IAM role that allows access to the CloudWatch log.
  final String roleArn;

  /// Indicates whether batches of log records will be extracted and uploaded into
  /// CloudWatch. Values include <code>true</code> or <code>false</code>
  /// <i>(default)</i>.
  final bool? batchMode;

  CloudwatchLogsAction({
    required this.logGroupName,
    required this.roleArn,
    this.batchMode,
  });

  factory CloudwatchLogsAction.fromJson(Map<String, dynamic> json) {
    return CloudwatchLogsAction(
      logGroupName: json['logGroupName'] as String,
      roleArn: json['roleArn'] as String,
      batchMode: json['batchMode'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupName = this.logGroupName;
    final roleArn = this.roleArn;
    final batchMode = this.batchMode;
    return {
      'logGroupName': logGroupName,
      'roleArn': roleArn,
      if (batchMode != null) 'batchMode': batchMode,
    };
  }
}

/// Describes an action that captures a CloudWatch metric.
class CloudwatchMetricAction {
  /// The CloudWatch metric name.
  final String metricName;

  /// The CloudWatch metric namespace name.
  final String metricNamespace;

  /// The <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#Unit">metric
  /// unit</a> supported by CloudWatch.
  final String metricUnit;

  /// The CloudWatch metric value.
  final String metricValue;

  /// The IAM role that allows access to the CloudWatch metric.
  final String roleArn;

  /// An optional <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#about_timestamp">Unix
  /// timestamp</a>.
  final String? metricTimestamp;

  CloudwatchMetricAction({
    required this.metricName,
    required this.metricNamespace,
    required this.metricUnit,
    required this.metricValue,
    required this.roleArn,
    this.metricTimestamp,
  });

  factory CloudwatchMetricAction.fromJson(Map<String, dynamic> json) {
    return CloudwatchMetricAction(
      metricName: json['metricName'] as String,
      metricNamespace: json['metricNamespace'] as String,
      metricUnit: json['metricUnit'] as String,
      metricValue: json['metricValue'] as String,
      roleArn: json['roleArn'] as String,
      metricTimestamp: json['metricTimestamp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final metricNamespace = this.metricNamespace;
    final metricUnit = this.metricUnit;
    final metricValue = this.metricValue;
    final roleArn = this.roleArn;
    final metricTimestamp = this.metricTimestamp;
    return {
      'metricName': metricName,
      'metricNamespace': metricNamespace,
      'metricUnit': metricUnit,
      'metricValue': metricValue,
      'roleArn': roleArn,
      if (metricTimestamp != null) 'metricTimestamp': metricTimestamp,
    };
  }
}

/// Describes the method to use when code signing a file.
class CodeSigning {
  /// The ID of the <code>AWSSignerJob</code> which was created to sign the file.
  final String? awsSignerJobId;

  /// A custom method for code signing a file.
  final CustomCodeSigning? customCodeSigning;

  /// Describes the code-signing job.
  final StartSigningJobParameter? startSigningJobParameter;

  CodeSigning({
    this.awsSignerJobId,
    this.customCodeSigning,
    this.startSigningJobParameter,
  });

  factory CodeSigning.fromJson(Map<String, dynamic> json) {
    return CodeSigning(
      awsSignerJobId: json['awsSignerJobId'] as String?,
      customCodeSigning: json['customCodeSigning'] != null
          ? CustomCodeSigning.fromJson(
              json['customCodeSigning'] as Map<String, dynamic>)
          : null,
      startSigningJobParameter: json['startSigningJobParameter'] != null
          ? StartSigningJobParameter.fromJson(
              json['startSigningJobParameter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsSignerJobId = this.awsSignerJobId;
    final customCodeSigning = this.customCodeSigning;
    final startSigningJobParameter = this.startSigningJobParameter;
    return {
      if (awsSignerJobId != null) 'awsSignerJobId': awsSignerJobId,
      if (customCodeSigning != null) 'customCodeSigning': customCodeSigning,
      if (startSigningJobParameter != null)
        'startSigningJobParameter': startSigningJobParameter,
    };
  }
}

/// Describes the certificate chain being used when code signing a file.
class CodeSigningCertificateChain {
  /// The name of the certificate.
  final String? certificateName;

  /// A base64 encoded binary representation of the code signing certificate
  /// chain.
  final String? inlineDocument;

  CodeSigningCertificateChain({
    this.certificateName,
    this.inlineDocument,
  });

  factory CodeSigningCertificateChain.fromJson(Map<String, dynamic> json) {
    return CodeSigningCertificateChain(
      certificateName: json['certificateName'] as String?,
      inlineDocument: json['inlineDocument'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateName = this.certificateName;
    final inlineDocument = this.inlineDocument;
    return {
      if (certificateName != null) 'certificateName': certificateName,
      if (inlineDocument != null) 'inlineDocument': inlineDocument,
    };
  }
}

/// Describes the signature for a file.
class CodeSigningSignature {
  /// A base64 encoded binary representation of the code signing signature.
  final Uint8List? inlineDocument;

  CodeSigningSignature({
    this.inlineDocument,
  });

  factory CodeSigningSignature.fromJson(Map<String, dynamic> json) {
    return CodeSigningSignature(
      inlineDocument:
          _s.decodeNullableUint8List(json['inlineDocument'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final inlineDocument = this.inlineDocument;
    return {
      if (inlineDocument != null)
        'inlineDocument': base64Encode(inlineDocument),
    };
  }
}

enum ComparisonOperator {
  lessThan('less-than'),
  lessThanEquals('less-than-equals'),
  greaterThan('greater-than'),
  greaterThanEquals('greater-than-equals'),
  inCidrSet('in-cidr-set'),
  notInCidrSet('not-in-cidr-set'),
  inPortSet('in-port-set'),
  notInPortSet('not-in-port-set'),
  inSet('in-set'),
  notInSet('not-in-set'),
  ;

  final String value;

  const ComparisonOperator(this.value);

  static ComparisonOperator fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ComparisonOperator'));
}

enum ConfidenceLevel {
  low('LOW'),
  medium('MEDIUM'),
  high('HIGH'),
  ;

  final String value;

  const ConfidenceLevel(this.value);

  static ConfidenceLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ConfidenceLevel'));
}

/// Configuration.
class Configuration {
  /// True to enable the configuration.
  final bool? enabled;

  Configuration({
    this.enabled,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      enabled: json['Enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

class ConfirmTopicRuleDestinationResponse {
  ConfirmTopicRuleDestinationResponse();

  factory ConfirmTopicRuleDestinationResponse.fromJson(Map<String, dynamic> _) {
    return ConfirmTopicRuleDestinationResponse();
  }
}

class CreateAuditSuppressionResponse {
  CreateAuditSuppressionResponse();

  factory CreateAuditSuppressionResponse.fromJson(Map<String, dynamic> _) {
    return CreateAuditSuppressionResponse();
  }
}

class CreateAuthorizerResponse {
  /// The authorizer ARN.
  final String? authorizerArn;

  /// The authorizer's name.
  final String? authorizerName;

  CreateAuthorizerResponse({
    this.authorizerArn,
    this.authorizerName,
  });

  factory CreateAuthorizerResponse.fromJson(Map<String, dynamic> json) {
    return CreateAuthorizerResponse(
      authorizerArn: json['authorizerArn'] as String?,
      authorizerName: json['authorizerName'] as String?,
    );
  }
}

class CreateBillingGroupResponse {
  /// The ARN of the billing group.
  final String? billingGroupArn;

  /// The ID of the billing group.
  final String? billingGroupId;

  /// The name you gave to the billing group.
  final String? billingGroupName;

  CreateBillingGroupResponse({
    this.billingGroupArn,
    this.billingGroupId,
    this.billingGroupName,
  });

  factory CreateBillingGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateBillingGroupResponse(
      billingGroupArn: json['billingGroupArn'] as String?,
      billingGroupId: json['billingGroupId'] as String?,
      billingGroupName: json['billingGroupName'] as String?,
    );
  }
}

/// The output from the CreateCertificateFromCsr operation.
class CreateCertificateFromCsrResponse {
  /// The Amazon Resource Name (ARN) of the certificate. You can use the ARN as a
  /// principal for policy operations.
  final String? certificateArn;

  /// The ID of the certificate. Certificate management operations only take a
  /// certificateId.
  final String? certificateId;

  /// The certificate data, in PEM format.
  final String? certificatePem;

  CreateCertificateFromCsrResponse({
    this.certificateArn,
    this.certificateId,
    this.certificatePem,
  });

  factory CreateCertificateFromCsrResponse.fromJson(Map<String, dynamic> json) {
    return CreateCertificateFromCsrResponse(
      certificateArn: json['certificateArn'] as String?,
      certificateId: json['certificateId'] as String?,
      certificatePem: json['certificatePem'] as String?,
    );
  }
}

class CreateCertificateProviderResponse {
  /// The ARN of the certificate provider.
  final String? certificateProviderArn;

  /// The name of the certificate provider.
  final String? certificateProviderName;

  CreateCertificateProviderResponse({
    this.certificateProviderArn,
    this.certificateProviderName,
  });

  factory CreateCertificateProviderResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateCertificateProviderResponse(
      certificateProviderArn: json['certificateProviderArn'] as String?,
      certificateProviderName: json['certificateProviderName'] as String?,
    );
  }
}

class CreateCustomMetricResponse {
  /// The Amazon Resource Number (ARN) of the custom metric. For example,
  /// <code>arn:<i>aws-partition</i>:iot:<i>region</i>:<i>accountId</i>:custommetric/<i>metricName</i>
  /// </code>
  final String? metricArn;

  /// The name of the custom metric to be used in the metric report.
  final String? metricName;

  CreateCustomMetricResponse({
    this.metricArn,
    this.metricName,
  });

  factory CreateCustomMetricResponse.fromJson(Map<String, dynamic> json) {
    return CreateCustomMetricResponse(
      metricArn: json['metricArn'] as String?,
      metricName: json['metricName'] as String?,
    );
  }
}

class CreateDimensionResponse {
  /// The Amazon Resource Name (ARN) of the created dimension.
  final String? arn;

  /// A unique identifier for the dimension.
  final String? name;

  CreateDimensionResponse({
    this.arn,
    this.name,
  });

  factory CreateDimensionResponse.fromJson(Map<String, dynamic> json) {
    return CreateDimensionResponse(
      arn: json['arn'] as String?,
      name: json['name'] as String?,
    );
  }
}

class CreateDomainConfigurationResponse {
  /// The ARN of the domain configuration.
  final String? domainConfigurationArn;

  /// The name of the domain configuration.
  final String? domainConfigurationName;

  CreateDomainConfigurationResponse({
    this.domainConfigurationArn,
    this.domainConfigurationName,
  });

  factory CreateDomainConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateDomainConfigurationResponse(
      domainConfigurationArn: json['domainConfigurationArn'] as String?,
      domainConfigurationName: json['domainConfigurationName'] as String?,
    );
  }
}

class CreateDynamicThingGroupResponse {
  /// The dynamic thing group index name.
  final String? indexName;

  /// The dynamic thing group search query string.
  final String? queryString;

  /// The dynamic thing group query version.
  final String? queryVersion;

  /// The dynamic thing group ARN.
  final String? thingGroupArn;

  /// The dynamic thing group ID.
  final String? thingGroupId;

  /// The dynamic thing group name.
  final String? thingGroupName;

  CreateDynamicThingGroupResponse({
    this.indexName,
    this.queryString,
    this.queryVersion,
    this.thingGroupArn,
    this.thingGroupId,
    this.thingGroupName,
  });

  factory CreateDynamicThingGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateDynamicThingGroupResponse(
      indexName: json['indexName'] as String?,
      queryString: json['queryString'] as String?,
      queryVersion: json['queryVersion'] as String?,
      thingGroupArn: json['thingGroupArn'] as String?,
      thingGroupId: json['thingGroupId'] as String?,
      thingGroupName: json['thingGroupName'] as String?,
    );
  }
}

class CreateFleetMetricResponse {
  /// The Amazon Resource Name (ARN) of the new fleet metric.
  final String? metricArn;

  /// The name of the fleet metric to create.
  final String? metricName;

  CreateFleetMetricResponse({
    this.metricArn,
    this.metricName,
  });

  factory CreateFleetMetricResponse.fromJson(Map<String, dynamic> json) {
    return CreateFleetMetricResponse(
      metricArn: json['metricArn'] as String?,
      metricName: json['metricName'] as String?,
    );
  }
}

class CreateJobResponse {
  /// The job description.
  final String? description;

  /// The job ARN.
  final String? jobArn;

  /// The unique identifier you assigned to this job.
  final String? jobId;

  CreateJobResponse({
    this.description,
    this.jobArn,
    this.jobId,
  });

  factory CreateJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateJobResponse(
      description: json['description'] as String?,
      jobArn: json['jobArn'] as String?,
      jobId: json['jobId'] as String?,
    );
  }
}

class CreateJobTemplateResponse {
  /// The ARN of the job template.
  final String? jobTemplateArn;

  /// The unique identifier of the job template.
  final String? jobTemplateId;

  CreateJobTemplateResponse({
    this.jobTemplateArn,
    this.jobTemplateId,
  });

  factory CreateJobTemplateResponse.fromJson(Map<String, dynamic> json) {
    return CreateJobTemplateResponse(
      jobTemplateArn: json['jobTemplateArn'] as String?,
      jobTemplateId: json['jobTemplateId'] as String?,
    );
  }
}

/// The output of the CreateKeysAndCertificate operation.
class CreateKeysAndCertificateResponse {
  /// The ARN of the certificate.
  final String? certificateArn;

  /// The ID of the certificate. IoT issues a default subject name for the
  /// certificate (for example, IoT Certificate).
  final String? certificateId;

  /// The certificate data, in PEM format.
  final String? certificatePem;

  /// The generated key pair.
  final KeyPair? keyPair;

  CreateKeysAndCertificateResponse({
    this.certificateArn,
    this.certificateId,
    this.certificatePem,
    this.keyPair,
  });

  factory CreateKeysAndCertificateResponse.fromJson(Map<String, dynamic> json) {
    return CreateKeysAndCertificateResponse(
      certificateArn: json['certificateArn'] as String?,
      certificateId: json['certificateId'] as String?,
      certificatePem: json['certificatePem'] as String?,
      keyPair: json['keyPair'] != null
          ? KeyPair.fromJson(json['keyPair'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreateMitigationActionResponse {
  /// The ARN for the new mitigation action.
  final String? actionArn;

  /// A unique identifier for the new mitigation action.
  final String? actionId;

  CreateMitigationActionResponse({
    this.actionArn,
    this.actionId,
  });

  factory CreateMitigationActionResponse.fromJson(Map<String, dynamic> json) {
    return CreateMitigationActionResponse(
      actionArn: json['actionArn'] as String?,
      actionId: json['actionId'] as String?,
    );
  }
}

class CreateOTAUpdateResponse {
  /// The IoT job ARN associated with the OTA update.
  final String? awsIotJobArn;

  /// The IoT job ID associated with the OTA update.
  final String? awsIotJobId;

  /// The OTA update ARN.
  final String? otaUpdateArn;

  /// The OTA update ID.
  final String? otaUpdateId;

  /// The OTA update status.
  final OTAUpdateStatus? otaUpdateStatus;

  CreateOTAUpdateResponse({
    this.awsIotJobArn,
    this.awsIotJobId,
    this.otaUpdateArn,
    this.otaUpdateId,
    this.otaUpdateStatus,
  });

  factory CreateOTAUpdateResponse.fromJson(Map<String, dynamic> json) {
    return CreateOTAUpdateResponse(
      awsIotJobArn: json['awsIotJobArn'] as String?,
      awsIotJobId: json['awsIotJobId'] as String?,
      otaUpdateArn: json['otaUpdateArn'] as String?,
      otaUpdateId: json['otaUpdateId'] as String?,
      otaUpdateStatus:
          (json['otaUpdateStatus'] as String?)?.let(OTAUpdateStatus.fromString),
    );
  }
}

class CreatePackageResponse {
  /// The package description.
  final String? description;

  /// The Amazon Resource Name (ARN) for the package.
  final String? packageArn;

  /// The name of the software package.
  final String? packageName;

  CreatePackageResponse({
    this.description,
    this.packageArn,
    this.packageName,
  });

  factory CreatePackageResponse.fromJson(Map<String, dynamic> json) {
    return CreatePackageResponse(
      description: json['description'] as String?,
      packageArn: json['packageArn'] as String?,
      packageName: json['packageName'] as String?,
    );
  }
}

class CreatePackageVersionResponse {
  /// Metadata that were added to the package version that can be used to define a
  /// package version’s configuration.
  final Map<String, String>? attributes;

  /// The package version description.
  final String? description;

  /// Error reason for a package version failure during creation or update.
  final String? errorReason;

  /// The name of the associated software package.
  final String? packageName;

  /// The Amazon Resource Name (ARN) for the package.
  final String? packageVersionArn;

  /// The status of the package version. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/preparing-to-use-software-package-catalog.html#package-version-lifecycle">Package
  /// version lifecycle</a>.
  final PackageVersionStatus? status;

  /// The name of the new package version.
  final String? versionName;

  CreatePackageVersionResponse({
    this.attributes,
    this.description,
    this.errorReason,
    this.packageName,
    this.packageVersionArn,
    this.status,
    this.versionName,
  });

  factory CreatePackageVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreatePackageVersionResponse(
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      description: json['description'] as String?,
      errorReason: json['errorReason'] as String?,
      packageName: json['packageName'] as String?,
      packageVersionArn: json['packageVersionArn'] as String?,
      status: (json['status'] as String?)?.let(PackageVersionStatus.fromString),
      versionName: json['versionName'] as String?,
    );
  }
}

/// The output from the CreatePolicy operation.
class CreatePolicyResponse {
  /// The policy ARN.
  final String? policyArn;

  /// The JSON document that describes the policy.
  final String? policyDocument;

  /// The policy name.
  final String? policyName;

  /// The policy version ID.
  final String? policyVersionId;

  CreatePolicyResponse({
    this.policyArn,
    this.policyDocument,
    this.policyName,
    this.policyVersionId,
  });

  factory CreatePolicyResponse.fromJson(Map<String, dynamic> json) {
    return CreatePolicyResponse(
      policyArn: json['policyArn'] as String?,
      policyDocument: json['policyDocument'] as String?,
      policyName: json['policyName'] as String?,
      policyVersionId: json['policyVersionId'] as String?,
    );
  }
}

/// The output of the CreatePolicyVersion operation.
class CreatePolicyVersionResponse {
  /// Specifies whether the policy version is the default.
  final bool? isDefaultVersion;

  /// The policy ARN.
  final String? policyArn;

  /// The JSON document that describes the policy.
  final String? policyDocument;

  /// The policy version ID.
  final String? policyVersionId;

  CreatePolicyVersionResponse({
    this.isDefaultVersion,
    this.policyArn,
    this.policyDocument,
    this.policyVersionId,
  });

  factory CreatePolicyVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreatePolicyVersionResponse(
      isDefaultVersion: json['isDefaultVersion'] as bool?,
      policyArn: json['policyArn'] as String?,
      policyDocument: json['policyDocument'] as String?,
      policyVersionId: json['policyVersionId'] as String?,
    );
  }
}

class CreateProvisioningClaimResponse {
  /// The ID of the certificate.
  final String? certificateId;

  /// The provisioning claim certificate.
  final String? certificatePem;

  /// The provisioning claim expiration time.
  final DateTime? expiration;

  /// The provisioning claim key pair.
  final KeyPair? keyPair;

  CreateProvisioningClaimResponse({
    this.certificateId,
    this.certificatePem,
    this.expiration,
    this.keyPair,
  });

  factory CreateProvisioningClaimResponse.fromJson(Map<String, dynamic> json) {
    return CreateProvisioningClaimResponse(
      certificateId: json['certificateId'] as String?,
      certificatePem: json['certificatePem'] as String?,
      expiration: timeStampFromJson(json['expiration']),
      keyPair: json['keyPair'] != null
          ? KeyPair.fromJson(json['keyPair'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreateProvisioningTemplateResponse {
  /// The default version of the provisioning template.
  final int? defaultVersionId;

  /// The ARN that identifies the provisioning template.
  final String? templateArn;

  /// The name of the provisioning template.
  final String? templateName;

  CreateProvisioningTemplateResponse({
    this.defaultVersionId,
    this.templateArn,
    this.templateName,
  });

  factory CreateProvisioningTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateProvisioningTemplateResponse(
      defaultVersionId: json['defaultVersionId'] as int?,
      templateArn: json['templateArn'] as String?,
      templateName: json['templateName'] as String?,
    );
  }
}

class CreateProvisioningTemplateVersionResponse {
  /// True if the provisioning template version is the default version, otherwise
  /// false.
  final bool? isDefaultVersion;

  /// The ARN that identifies the provisioning template.
  final String? templateArn;

  /// The name of the provisioning template.
  final String? templateName;

  /// The version of the provisioning template.
  final int? versionId;

  CreateProvisioningTemplateVersionResponse({
    this.isDefaultVersion,
    this.templateArn,
    this.templateName,
    this.versionId,
  });

  factory CreateProvisioningTemplateVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateProvisioningTemplateVersionResponse(
      isDefaultVersion: json['isDefaultVersion'] as bool?,
      templateArn: json['templateArn'] as String?,
      templateName: json['templateName'] as String?,
      versionId: json['versionId'] as int?,
    );
  }
}

class CreateRoleAliasResponse {
  /// The role alias.
  final String? roleAlias;

  /// The role alias ARN.
  final String? roleAliasArn;

  CreateRoleAliasResponse({
    this.roleAlias,
    this.roleAliasArn,
  });

  factory CreateRoleAliasResponse.fromJson(Map<String, dynamic> json) {
    return CreateRoleAliasResponse(
      roleAlias: json['roleAlias'] as String?,
      roleAliasArn: json['roleAliasArn'] as String?,
    );
  }
}

class CreateScheduledAuditResponse {
  /// The ARN of the scheduled audit.
  final String? scheduledAuditArn;

  CreateScheduledAuditResponse({
    this.scheduledAuditArn,
  });

  factory CreateScheduledAuditResponse.fromJson(Map<String, dynamic> json) {
    return CreateScheduledAuditResponse(
      scheduledAuditArn: json['scheduledAuditArn'] as String?,
    );
  }
}

class CreateSecurityProfileResponse {
  /// The ARN of the security profile.
  final String? securityProfileArn;

  /// The name you gave to the security profile.
  final String? securityProfileName;

  CreateSecurityProfileResponse({
    this.securityProfileArn,
    this.securityProfileName,
  });

  factory CreateSecurityProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateSecurityProfileResponse(
      securityProfileArn: json['securityProfileArn'] as String?,
      securityProfileName: json['securityProfileName'] as String?,
    );
  }
}

class CreateStreamResponse {
  /// A description of the stream.
  final String? description;

  /// The stream ARN.
  final String? streamArn;

  /// The stream ID.
  final String? streamId;

  /// The version of the stream.
  final int? streamVersion;

  CreateStreamResponse({
    this.description,
    this.streamArn,
    this.streamId,
    this.streamVersion,
  });

  factory CreateStreamResponse.fromJson(Map<String, dynamic> json) {
    return CreateStreamResponse(
      description: json['description'] as String?,
      streamArn: json['streamArn'] as String?,
      streamId: json['streamId'] as String?,
      streamVersion: json['streamVersion'] as int?,
    );
  }
}

class CreateThingGroupResponse {
  /// The thing group ARN.
  final String? thingGroupArn;

  /// The thing group ID.
  final String? thingGroupId;

  /// The thing group name.
  final String? thingGroupName;

  CreateThingGroupResponse({
    this.thingGroupArn,
    this.thingGroupId,
    this.thingGroupName,
  });

  factory CreateThingGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateThingGroupResponse(
      thingGroupArn: json['thingGroupArn'] as String?,
      thingGroupId: json['thingGroupId'] as String?,
      thingGroupName: json['thingGroupName'] as String?,
    );
  }
}

/// The output of the CreateThing operation.
class CreateThingResponse {
  /// The ARN of the new thing.
  final String? thingArn;

  /// The thing ID.
  final String? thingId;

  /// The name of the new thing.
  final String? thingName;

  CreateThingResponse({
    this.thingArn,
    this.thingId,
    this.thingName,
  });

  factory CreateThingResponse.fromJson(Map<String, dynamic> json) {
    return CreateThingResponse(
      thingArn: json['thingArn'] as String?,
      thingId: json['thingId'] as String?,
      thingName: json['thingName'] as String?,
    );
  }
}

/// The output of the CreateThingType operation.
class CreateThingTypeResponse {
  /// The Amazon Resource Name (ARN) of the thing type.
  final String? thingTypeArn;

  /// The thing type ID.
  final String? thingTypeId;

  /// The name of the thing type.
  final String? thingTypeName;

  CreateThingTypeResponse({
    this.thingTypeArn,
    this.thingTypeId,
    this.thingTypeName,
  });

  factory CreateThingTypeResponse.fromJson(Map<String, dynamic> json) {
    return CreateThingTypeResponse(
      thingTypeArn: json['thingTypeArn'] as String?,
      thingTypeId: json['thingTypeId'] as String?,
      thingTypeName: json['thingTypeName'] as String?,
    );
  }
}

class CreateTopicRuleDestinationResponse {
  /// The topic rule destination.
  final TopicRuleDestination? topicRuleDestination;

  CreateTopicRuleDestinationResponse({
    this.topicRuleDestination,
  });

  factory CreateTopicRuleDestinationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateTopicRuleDestinationResponse(
      topicRuleDestination: json['topicRuleDestination'] != null
          ? TopicRuleDestination.fromJson(
              json['topicRuleDestination'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Describes a custom method used to code sign a file.
class CustomCodeSigning {
  /// The certificate chain.
  final CodeSigningCertificateChain? certificateChain;

  /// The hash algorithm used to code sign the file. You can use a string as the
  /// algorithm name if the target over-the-air (OTA) update devices are able to
  /// verify the signature that was generated using the same signature algorithm.
  /// For example, FreeRTOS uses <code>SHA256</code> or <code>SHA1</code>, so you
  /// can pass either of them based on which was used for generating the
  /// signature.
  final String? hashAlgorithm;

  /// The signature for the file.
  final CodeSigningSignature? signature;

  /// The signature algorithm used to code sign the file. You can use a string as
  /// the algorithm name if the target over-the-air (OTA) update devices are able
  /// to verify the signature that was generated using the same signature
  /// algorithm. For example, FreeRTOS uses <code>ECDSA</code> or
  /// <code>RSA</code>, so you can pass either of them based on which was used for
  /// generating the signature.
  final String? signatureAlgorithm;

  CustomCodeSigning({
    this.certificateChain,
    this.hashAlgorithm,
    this.signature,
    this.signatureAlgorithm,
  });

  factory CustomCodeSigning.fromJson(Map<String, dynamic> json) {
    return CustomCodeSigning(
      certificateChain: json['certificateChain'] != null
          ? CodeSigningCertificateChain.fromJson(
              json['certificateChain'] as Map<String, dynamic>)
          : null,
      hashAlgorithm: json['hashAlgorithm'] as String?,
      signature: json['signature'] != null
          ? CodeSigningSignature.fromJson(
              json['signature'] as Map<String, dynamic>)
          : null,
      signatureAlgorithm: json['signatureAlgorithm'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateChain = this.certificateChain;
    final hashAlgorithm = this.hashAlgorithm;
    final signature = this.signature;
    final signatureAlgorithm = this.signatureAlgorithm;
    return {
      if (certificateChain != null) 'certificateChain': certificateChain,
      if (hashAlgorithm != null) 'hashAlgorithm': hashAlgorithm,
      if (signature != null) 'signature': signature,
      if (signatureAlgorithm != null) 'signatureAlgorithm': signatureAlgorithm,
    };
  }
}

enum CustomMetricType {
  stringList('string-list'),
  ipAddressList('ip-address-list'),
  numberList('number-list'),
  number('number'),
  ;

  final String value;

  const CustomMetricType(this.value);

  static CustomMetricType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum CustomMetricType'));
}

enum DayOfWeek {
  sun('SUN'),
  mon('MON'),
  tue('TUE'),
  wed('WED'),
  thu('THU'),
  fri('FRI'),
  sat('SAT'),
  ;

  final String value;

  const DayOfWeek(this.value);

  static DayOfWeek fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum DayOfWeek'));
}

class DeleteAccountAuditConfigurationResponse {
  DeleteAccountAuditConfigurationResponse();

  factory DeleteAccountAuditConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteAccountAuditConfigurationResponse();
  }
}

class DeleteAuditSuppressionResponse {
  DeleteAuditSuppressionResponse();

  factory DeleteAuditSuppressionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAuditSuppressionResponse();
  }
}

class DeleteAuthorizerResponse {
  DeleteAuthorizerResponse();

  factory DeleteAuthorizerResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAuthorizerResponse();
  }
}

class DeleteBillingGroupResponse {
  DeleteBillingGroupResponse();

  factory DeleteBillingGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteBillingGroupResponse();
  }
}

/// The output for the DeleteCACertificate operation.
class DeleteCACertificateResponse {
  DeleteCACertificateResponse();

  factory DeleteCACertificateResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCACertificateResponse();
  }
}

class DeleteCertificateProviderResponse {
  DeleteCertificateProviderResponse();

  factory DeleteCertificateProviderResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCertificateProviderResponse();
  }
}

class DeleteCustomMetricResponse {
  DeleteCustomMetricResponse();

  factory DeleteCustomMetricResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCustomMetricResponse();
  }
}

class DeleteDimensionResponse {
  DeleteDimensionResponse();

  factory DeleteDimensionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDimensionResponse();
  }
}

class DeleteDomainConfigurationResponse {
  DeleteDomainConfigurationResponse();

  factory DeleteDomainConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDomainConfigurationResponse();
  }
}

class DeleteDynamicThingGroupResponse {
  DeleteDynamicThingGroupResponse();

  factory DeleteDynamicThingGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDynamicThingGroupResponse();
  }
}

class DeleteMitigationActionResponse {
  DeleteMitigationActionResponse();

  factory DeleteMitigationActionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteMitigationActionResponse();
  }
}

class DeleteOTAUpdateResponse {
  DeleteOTAUpdateResponse();

  factory DeleteOTAUpdateResponse.fromJson(Map<String, dynamic> _) {
    return DeleteOTAUpdateResponse();
  }
}

class DeletePackageResponse {
  DeletePackageResponse();

  factory DeletePackageResponse.fromJson(Map<String, dynamic> _) {
    return DeletePackageResponse();
  }
}

class DeletePackageVersionResponse {
  DeletePackageVersionResponse();

  factory DeletePackageVersionResponse.fromJson(Map<String, dynamic> _) {
    return DeletePackageVersionResponse();
  }
}

class DeleteProvisioningTemplateResponse {
  DeleteProvisioningTemplateResponse();

  factory DeleteProvisioningTemplateResponse.fromJson(Map<String, dynamic> _) {
    return DeleteProvisioningTemplateResponse();
  }
}

class DeleteProvisioningTemplateVersionResponse {
  DeleteProvisioningTemplateVersionResponse();

  factory DeleteProvisioningTemplateVersionResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteProvisioningTemplateVersionResponse();
  }
}

/// The output for the DeleteRegistrationCode operation.
class DeleteRegistrationCodeResponse {
  DeleteRegistrationCodeResponse();

  factory DeleteRegistrationCodeResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRegistrationCodeResponse();
  }
}

class DeleteRoleAliasResponse {
  DeleteRoleAliasResponse();

  factory DeleteRoleAliasResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRoleAliasResponse();
  }
}

class DeleteScheduledAuditResponse {
  DeleteScheduledAuditResponse();

  factory DeleteScheduledAuditResponse.fromJson(Map<String, dynamic> _) {
    return DeleteScheduledAuditResponse();
  }
}

class DeleteSecurityProfileResponse {
  DeleteSecurityProfileResponse();

  factory DeleteSecurityProfileResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSecurityProfileResponse();
  }
}

class DeleteStreamResponse {
  DeleteStreamResponse();

  factory DeleteStreamResponse.fromJson(Map<String, dynamic> _) {
    return DeleteStreamResponse();
  }
}

class DeleteThingGroupResponse {
  DeleteThingGroupResponse();

  factory DeleteThingGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteThingGroupResponse();
  }
}

/// The output of the DeleteThing operation.
class DeleteThingResponse {
  DeleteThingResponse();

  factory DeleteThingResponse.fromJson(Map<String, dynamic> _) {
    return DeleteThingResponse();
  }
}

/// The output for the DeleteThingType operation.
class DeleteThingTypeResponse {
  DeleteThingTypeResponse();

  factory DeleteThingTypeResponse.fromJson(Map<String, dynamic> _) {
    return DeleteThingTypeResponse();
  }
}

class DeleteTopicRuleDestinationResponse {
  DeleteTopicRuleDestinationResponse();

  factory DeleteTopicRuleDestinationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTopicRuleDestinationResponse();
  }
}

/// Contains information that denied the authorization.
class Denied {
  /// Information that explicitly denies the authorization.
  final ExplicitDeny? explicitDeny;

  /// Information that implicitly denies the authorization. When a policy doesn't
  /// explicitly deny or allow an action on a resource it is considered an
  /// implicit deny.
  final ImplicitDeny? implicitDeny;

  Denied({
    this.explicitDeny,
    this.implicitDeny,
  });

  factory Denied.fromJson(Map<String, dynamic> json) {
    return Denied(
      explicitDeny: json['explicitDeny'] != null
          ? ExplicitDeny.fromJson(json['explicitDeny'] as Map<String, dynamic>)
          : null,
      implicitDeny: json['implicitDeny'] != null
          ? ImplicitDeny.fromJson(json['implicitDeny'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// The output for the DeprecateThingType operation.
class DeprecateThingTypeResponse {
  DeprecateThingTypeResponse();

  factory DeprecateThingTypeResponse.fromJson(Map<String, dynamic> _) {
    return DeprecateThingTypeResponse();
  }
}

class DescribeAccountAuditConfigurationResponse {
  /// Which audit checks are enabled and disabled for this account.
  final Map<String, AuditCheckConfiguration>? auditCheckConfigurations;

  /// Information about the targets to which audit notifications are sent for this
  /// account.
  final Map<AuditNotificationType, AuditNotificationTarget>?
      auditNotificationTargetConfigurations;

  /// The ARN of the role that grants permission to IoT to access information
  /// about your devices, policies, certificates, and other items as required when
  /// performing an audit.
  ///
  /// On the first call to <code>UpdateAccountAuditConfiguration</code>, this
  /// parameter is required.
  final String? roleArn;

  DescribeAccountAuditConfigurationResponse({
    this.auditCheckConfigurations,
    this.auditNotificationTargetConfigurations,
    this.roleArn,
  });

  factory DescribeAccountAuditConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAccountAuditConfigurationResponse(
      auditCheckConfigurations: (json['auditCheckConfigurations']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, AuditCheckConfiguration.fromJson(e as Map<String, dynamic>))),
      auditNotificationTargetConfigurations:
          (json['auditNotificationTargetConfigurations']
                  as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(AuditNotificationType.fromString(k),
                  AuditNotificationTarget.fromJson(e as Map<String, dynamic>))),
      roleArn: json['roleArn'] as String?,
    );
  }
}

class DescribeAuditFindingResponse {
  final AuditFinding? finding;

  DescribeAuditFindingResponse({
    this.finding,
  });

  factory DescribeAuditFindingResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAuditFindingResponse(
      finding: json['finding'] != null
          ? AuditFinding.fromJson(json['finding'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeAuditMitigationActionsTaskResponse {
  /// Specifies the mitigation actions and their parameters that are applied as
  /// part of this task.
  final List<MitigationAction>? actionsDefinition;

  /// Specifies the mitigation actions that should be applied to specific audit
  /// checks.
  final Map<String, List<String>>? auditCheckToActionsMapping;

  /// The date and time when the task was completed or canceled.
  final DateTime? endTime;

  /// The date and time when the task was started.
  final DateTime? startTime;

  /// Identifies the findings to which the mitigation actions are applied. This
  /// can be by audit checks, by audit task, or a set of findings.
  final AuditMitigationActionsTaskTarget? target;

  /// Aggregate counts of the results when the mitigation tasks were applied to
  /// the findings for this audit mitigation actions task.
  final Map<String, TaskStatisticsForAuditCheck>? taskStatistics;

  /// The current status of the task.
  final AuditMitigationActionsTaskStatus? taskStatus;

  DescribeAuditMitigationActionsTaskResponse({
    this.actionsDefinition,
    this.auditCheckToActionsMapping,
    this.endTime,
    this.startTime,
    this.target,
    this.taskStatistics,
    this.taskStatus,
  });

  factory DescribeAuditMitigationActionsTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAuditMitigationActionsTaskResponse(
      actionsDefinition: (json['actionsDefinition'] as List?)
          ?.nonNulls
          .map((e) => MitigationAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      auditCheckToActionsMapping:
          (json['auditCheckToActionsMapping'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(
                  k, (e as List).nonNulls.map((e) => e as String).toList())),
      endTime: timeStampFromJson(json['endTime']),
      startTime: timeStampFromJson(json['startTime']),
      target: json['target'] != null
          ? AuditMitigationActionsTaskTarget.fromJson(
              json['target'] as Map<String, dynamic>)
          : null,
      taskStatistics: (json['taskStatistics'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k,
              TaskStatisticsForAuditCheck.fromJson(e as Map<String, dynamic>))),
      taskStatus: (json['taskStatus'] as String?)
          ?.let(AuditMitigationActionsTaskStatus.fromString),
    );
  }
}

class DescribeAuditSuppressionResponse {
  final String? checkName;

  /// The description of the audit suppression.
  final String? description;

  /// The epoch timestamp in seconds at which this suppression expires.
  final DateTime? expirationDate;
  final ResourceIdentifier? resourceIdentifier;

  /// Indicates whether a suppression should exist indefinitely or not.
  final bool? suppressIndefinitely;

  DescribeAuditSuppressionResponse({
    this.checkName,
    this.description,
    this.expirationDate,
    this.resourceIdentifier,
    this.suppressIndefinitely,
  });

  factory DescribeAuditSuppressionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAuditSuppressionResponse(
      checkName: json['checkName'] as String?,
      description: json['description'] as String?,
      expirationDate: timeStampFromJson(json['expirationDate']),
      resourceIdentifier: json['resourceIdentifier'] != null
          ? ResourceIdentifier.fromJson(
              json['resourceIdentifier'] as Map<String, dynamic>)
          : null,
      suppressIndefinitely: json['suppressIndefinitely'] as bool?,
    );
  }
}

class DescribeAuditTaskResponse {
  /// Detailed information about each check performed during this audit.
  final Map<String, AuditCheckDetails>? auditDetails;

  /// The name of the scheduled audit (only if the audit was a scheduled audit).
  final String? scheduledAuditName;

  /// The time the audit started.
  final DateTime? taskStartTime;

  /// Statistical information about the audit.
  final TaskStatistics? taskStatistics;

  /// The status of the audit: one of "IN_PROGRESS", "COMPLETED", "FAILED", or
  /// "CANCELED".
  final AuditTaskStatus? taskStatus;

  /// The type of audit: "ON_DEMAND_AUDIT_TASK" or "SCHEDULED_AUDIT_TASK".
  final AuditTaskType? taskType;

  DescribeAuditTaskResponse({
    this.auditDetails,
    this.scheduledAuditName,
    this.taskStartTime,
    this.taskStatistics,
    this.taskStatus,
    this.taskType,
  });

  factory DescribeAuditTaskResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAuditTaskResponse(
      auditDetails: (json['auditDetails'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, AuditCheckDetails.fromJson(e as Map<String, dynamic>))),
      scheduledAuditName: json['scheduledAuditName'] as String?,
      taskStartTime: timeStampFromJson(json['taskStartTime']),
      taskStatistics: json['taskStatistics'] != null
          ? TaskStatistics.fromJson(
              json['taskStatistics'] as Map<String, dynamic>)
          : null,
      taskStatus:
          (json['taskStatus'] as String?)?.let(AuditTaskStatus.fromString),
      taskType: (json['taskType'] as String?)?.let(AuditTaskType.fromString),
    );
  }
}

class DescribeAuthorizerResponse {
  /// The authorizer description.
  final AuthorizerDescription? authorizerDescription;

  DescribeAuthorizerResponse({
    this.authorizerDescription,
  });

  factory DescribeAuthorizerResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAuthorizerResponse(
      authorizerDescription: json['authorizerDescription'] != null
          ? AuthorizerDescription.fromJson(
              json['authorizerDescription'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeBillingGroupResponse {
  /// The ARN of the billing group.
  final String? billingGroupArn;

  /// The ID of the billing group.
  final String? billingGroupId;

  /// Additional information about the billing group.
  final BillingGroupMetadata? billingGroupMetadata;

  /// The name of the billing group.
  final String? billingGroupName;

  /// The properties of the billing group.
  final BillingGroupProperties? billingGroupProperties;

  /// The version of the billing group.
  final int? version;

  DescribeBillingGroupResponse({
    this.billingGroupArn,
    this.billingGroupId,
    this.billingGroupMetadata,
    this.billingGroupName,
    this.billingGroupProperties,
    this.version,
  });

  factory DescribeBillingGroupResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBillingGroupResponse(
      billingGroupArn: json['billingGroupArn'] as String?,
      billingGroupId: json['billingGroupId'] as String?,
      billingGroupMetadata: json['billingGroupMetadata'] != null
          ? BillingGroupMetadata.fromJson(
              json['billingGroupMetadata'] as Map<String, dynamic>)
          : null,
      billingGroupName: json['billingGroupName'] as String?,
      billingGroupProperties: json['billingGroupProperties'] != null
          ? BillingGroupProperties.fromJson(
              json['billingGroupProperties'] as Map<String, dynamic>)
          : null,
      version: json['version'] as int?,
    );
  }
}

/// The output from the DescribeCACertificate operation.
class DescribeCACertificateResponse {
  /// The CA certificate description.
  final CACertificateDescription? certificateDescription;

  /// Information about the registration configuration.
  final RegistrationConfig? registrationConfig;

  DescribeCACertificateResponse({
    this.certificateDescription,
    this.registrationConfig,
  });

  factory DescribeCACertificateResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCACertificateResponse(
      certificateDescription: json['certificateDescription'] != null
          ? CACertificateDescription.fromJson(
              json['certificateDescription'] as Map<String, dynamic>)
          : null,
      registrationConfig: json['registrationConfig'] != null
          ? RegistrationConfig.fromJson(
              json['registrationConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeCertificateProviderResponse {
  /// A list of the operations that the certificate provider will use to generate
  /// certificates. Valid value: <code>CreateCertificateFromCsr</code>.
  final List<CertificateProviderOperation>? accountDefaultForOperations;

  /// The ARN of the certificate provider.
  final String? certificateProviderArn;

  /// The name of the certificate provider.
  final String? certificateProviderName;

  /// The date-time string that indicates when the certificate provider was
  /// created.
  final DateTime? creationDate;

  /// The Lambda function ARN that's associated with the certificate provider.
  final String? lambdaFunctionArn;

  /// The date-time string that indicates when the certificate provider was last
  /// updated.
  final DateTime? lastModifiedDate;

  DescribeCertificateProviderResponse({
    this.accountDefaultForOperations,
    this.certificateProviderArn,
    this.certificateProviderName,
    this.creationDate,
    this.lambdaFunctionArn,
    this.lastModifiedDate,
  });

  factory DescribeCertificateProviderResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeCertificateProviderResponse(
      accountDefaultForOperations: (json['accountDefaultForOperations']
              as List?)
          ?.nonNulls
          .map((e) => CertificateProviderOperation.fromString((e as String)))
          .toList(),
      certificateProviderArn: json['certificateProviderArn'] as String?,
      certificateProviderName: json['certificateProviderName'] as String?,
      creationDate: timeStampFromJson(json['creationDate']),
      lambdaFunctionArn: json['lambdaFunctionArn'] as String?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
    );
  }
}

/// The output of the DescribeCertificate operation.
class DescribeCertificateResponse {
  /// The description of the certificate.
  final CertificateDescription? certificateDescription;

  DescribeCertificateResponse({
    this.certificateDescription,
  });

  factory DescribeCertificateResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCertificateResponse(
      certificateDescription: json['certificateDescription'] != null
          ? CertificateDescription.fromJson(
              json['certificateDescription'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeCustomMetricResponse {
  /// The creation date of the custom metric in milliseconds since epoch.
  final DateTime? creationDate;

  /// Field represents a friendly name in the console for the custom metric;
  /// doesn't have to be unique. Don't use this name as the metric identifier in
  /// the device metric report. Can be updated.
  final String? displayName;

  /// The time the custom metric was last modified in milliseconds since epoch.
  final DateTime? lastModifiedDate;

  /// The Amazon Resource Number (ARN) of the custom metric.
  final String? metricArn;

  /// The name of the custom metric.
  final String? metricName;

  /// The type of the custom metric.
  /// <important>
  /// The type <code>number</code> only takes a single metric value as an input,
  /// but while submitting the metrics value in the DeviceMetrics report, it must
  /// be passed as an array with a single value.
  /// </important>
  final CustomMetricType? metricType;

  DescribeCustomMetricResponse({
    this.creationDate,
    this.displayName,
    this.lastModifiedDate,
    this.metricArn,
    this.metricName,
    this.metricType,
  });

  factory DescribeCustomMetricResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCustomMetricResponse(
      creationDate: timeStampFromJson(json['creationDate']),
      displayName: json['displayName'] as String?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      metricArn: json['metricArn'] as String?,
      metricName: json['metricName'] as String?,
      metricType:
          (json['metricType'] as String?)?.let(CustomMetricType.fromString),
    );
  }
}

class DescribeDefaultAuthorizerResponse {
  /// The default authorizer's description.
  final AuthorizerDescription? authorizerDescription;

  DescribeDefaultAuthorizerResponse({
    this.authorizerDescription,
  });

  factory DescribeDefaultAuthorizerResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDefaultAuthorizerResponse(
      authorizerDescription: json['authorizerDescription'] != null
          ? AuthorizerDescription.fromJson(
              json['authorizerDescription'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeDetectMitigationActionsTaskResponse {
  /// The description of a task.
  final DetectMitigationActionsTaskSummary? taskSummary;

  DescribeDetectMitigationActionsTaskResponse({
    this.taskSummary,
  });

  factory DescribeDetectMitigationActionsTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDetectMitigationActionsTaskResponse(
      taskSummary: json['taskSummary'] != null
          ? DetectMitigationActionsTaskSummary.fromJson(
              json['taskSummary'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeDimensionResponse {
  /// The Amazon Resource Name (ARN) for the dimension.
  final String? arn;

  /// The date the dimension was created.
  final DateTime? creationDate;

  /// The date the dimension was last modified.
  final DateTime? lastModifiedDate;

  /// The unique identifier for the dimension.
  final String? name;

  /// The value or list of values used to scope the dimension. For example, for
  /// topic filters, this is the pattern used to match the MQTT topic name.
  final List<String>? stringValues;

  /// The type of the dimension.
  final DimensionType? type;

  DescribeDimensionResponse({
    this.arn,
    this.creationDate,
    this.lastModifiedDate,
    this.name,
    this.stringValues,
    this.type,
  });

  factory DescribeDimensionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDimensionResponse(
      arn: json['arn'] as String?,
      creationDate: timeStampFromJson(json['creationDate']),
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      name: json['name'] as String?,
      stringValues: (json['stringValues'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      type: (json['type'] as String?)?.let(DimensionType.fromString),
    );
  }
}

class DescribeDomainConfigurationResponse {
  /// An object that specifies the authorization service for a domain.
  final AuthorizerConfig? authorizerConfig;

  /// The ARN of the domain configuration.
  final String? domainConfigurationArn;

  /// The name of the domain configuration.
  final String? domainConfigurationName;

  /// A Boolean value that specifies the current state of the domain
  /// configuration.
  final DomainConfigurationStatus? domainConfigurationStatus;

  /// The name of the domain.
  final String? domainName;

  /// The type of the domain.
  final DomainType? domainType;

  /// The date and time the domain configuration's status was last changed.
  final DateTime? lastStatusChangeDate;

  /// The server certificate configuration.
  final ServerCertificateConfig? serverCertificateConfig;

  /// A list containing summary information about the server certificate included
  /// in the domain configuration.
  final List<ServerCertificateSummary>? serverCertificates;

  /// The type of service delivered by the endpoint.
  final ServiceType? serviceType;

  /// An object that specifies the TLS configuration for a domain.
  final TlsConfig? tlsConfig;

  DescribeDomainConfigurationResponse({
    this.authorizerConfig,
    this.domainConfigurationArn,
    this.domainConfigurationName,
    this.domainConfigurationStatus,
    this.domainName,
    this.domainType,
    this.lastStatusChangeDate,
    this.serverCertificateConfig,
    this.serverCertificates,
    this.serviceType,
    this.tlsConfig,
  });

  factory DescribeDomainConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDomainConfigurationResponse(
      authorizerConfig: json['authorizerConfig'] != null
          ? AuthorizerConfig.fromJson(
              json['authorizerConfig'] as Map<String, dynamic>)
          : null,
      domainConfigurationArn: json['domainConfigurationArn'] as String?,
      domainConfigurationName: json['domainConfigurationName'] as String?,
      domainConfigurationStatus: (json['domainConfigurationStatus'] as String?)
          ?.let(DomainConfigurationStatus.fromString),
      domainName: json['domainName'] as String?,
      domainType: (json['domainType'] as String?)?.let(DomainType.fromString),
      lastStatusChangeDate: timeStampFromJson(json['lastStatusChangeDate']),
      serverCertificateConfig: json['serverCertificateConfig'] != null
          ? ServerCertificateConfig.fromJson(
              json['serverCertificateConfig'] as Map<String, dynamic>)
          : null,
      serverCertificates: (json['serverCertificates'] as List?)
          ?.nonNulls
          .map((e) =>
              ServerCertificateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceType:
          (json['serviceType'] as String?)?.let(ServiceType.fromString),
      tlsConfig: json['tlsConfig'] != null
          ? TlsConfig.fromJson(json['tlsConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// The output from the DescribeEndpoint operation.
class DescribeEndpointResponse {
  /// The endpoint. The format of the endpoint is as follows:
  /// <i>identifier</i>.iot.<i>region</i>.amazonaws.com.
  final String? endpointAddress;

  DescribeEndpointResponse({
    this.endpointAddress,
  });

  factory DescribeEndpointResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEndpointResponse(
      endpointAddress: json['endpointAddress'] as String?,
    );
  }
}

class DescribeEventConfigurationsResponse {
  /// The creation date of the event configuration.
  final DateTime? creationDate;

  /// The event configurations.
  final Map<EventType, Configuration>? eventConfigurations;

  /// The date the event configurations were last modified.
  final DateTime? lastModifiedDate;

  DescribeEventConfigurationsResponse({
    this.creationDate,
    this.eventConfigurations,
    this.lastModifiedDate,
  });

  factory DescribeEventConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeEventConfigurationsResponse(
      creationDate: timeStampFromJson(json['creationDate']),
      eventConfigurations:
          (json['eventConfigurations'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(EventType.fromString(k),
                  Configuration.fromJson(e as Map<String, dynamic>))),
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
    );
  }
}

class DescribeFleetMetricResponse {
  /// The field to aggregate.
  final String? aggregationField;

  /// The type of the aggregation query.
  final AggregationType? aggregationType;

  /// The date when the fleet metric is created.
  final DateTime? creationDate;

  /// The fleet metric description.
  final String? description;

  /// The name of the index to search.
  final String? indexName;

  /// The date when the fleet metric is last modified.
  final DateTime? lastModifiedDate;

  /// The ARN of the fleet metric to describe.
  final String? metricArn;

  /// The name of the fleet metric to describe.
  final String? metricName;

  /// The time in seconds between fleet metric emissions. Range [60(1 min),
  /// 86400(1 day)] and must be multiple of 60.
  final int? period;

  /// The search query string.
  final String? queryString;

  /// The query version.
  final String? queryVersion;

  /// Used to support unit transformation such as milliseconds to seconds. The
  /// unit must be supported by <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html">CW
  /// metric</a>.
  final FleetMetricUnit? unit;

  /// The version of the fleet metric.
  final int? version;

  DescribeFleetMetricResponse({
    this.aggregationField,
    this.aggregationType,
    this.creationDate,
    this.description,
    this.indexName,
    this.lastModifiedDate,
    this.metricArn,
    this.metricName,
    this.period,
    this.queryString,
    this.queryVersion,
    this.unit,
    this.version,
  });

  factory DescribeFleetMetricResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFleetMetricResponse(
      aggregationField: json['aggregationField'] as String?,
      aggregationType: json['aggregationType'] != null
          ? AggregationType.fromJson(
              json['aggregationType'] as Map<String, dynamic>)
          : null,
      creationDate: timeStampFromJson(json['creationDate']),
      description: json['description'] as String?,
      indexName: json['indexName'] as String?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      metricArn: json['metricArn'] as String?,
      metricName: json['metricName'] as String?,
      period: json['period'] as int?,
      queryString: json['queryString'] as String?,
      queryVersion: json['queryVersion'] as String?,
      unit: (json['unit'] as String?)?.let(FleetMetricUnit.fromString),
      version: json['version'] as int?,
    );
  }
}

class DescribeIndexResponse {
  /// The index name.
  final String? indexName;

  /// The index status.
  final IndexStatus? indexStatus;

  /// Contains a value that specifies the type of indexing performed. Valid values
  /// are:
  ///
  /// <ul>
  /// <li>
  /// REGISTRY – Your thing index contains only registry data.
  /// </li>
  /// <li>
  /// REGISTRY_AND_SHADOW - Your thing index contains registry data and shadow
  /// data.
  /// </li>
  /// <li>
  /// REGISTRY_AND_CONNECTIVITY_STATUS - Your thing index contains registry data
  /// and thing connectivity status data.
  /// </li>
  /// <li>
  /// REGISTRY_AND_SHADOW_AND_CONNECTIVITY_STATUS - Your thing index contains
  /// registry data, shadow data, and thing connectivity status data.
  /// </li>
  /// <li>
  /// MULTI_INDEXING_MODE - Your thing index contains multiple data sources. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_GetIndexingConfiguration.html">GetIndexingConfiguration</a>.
  /// </li>
  /// </ul>
  final String? schema;

  DescribeIndexResponse({
    this.indexName,
    this.indexStatus,
    this.schema,
  });

  factory DescribeIndexResponse.fromJson(Map<String, dynamic> json) {
    return DescribeIndexResponse(
      indexName: json['indexName'] as String?,
      indexStatus:
          (json['indexStatus'] as String?)?.let(IndexStatus.fromString),
      schema: json['schema'] as String?,
    );
  }
}

class DescribeJobExecutionResponse {
  /// Information about the job execution.
  final JobExecution? execution;

  DescribeJobExecutionResponse({
    this.execution,
  });

  factory DescribeJobExecutionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeJobExecutionResponse(
      execution: json['execution'] != null
          ? JobExecution.fromJson(json['execution'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeJobResponse {
  /// An S3 link to the job document.
  final String? documentSource;

  /// Information about the job.
  final Job? job;

  DescribeJobResponse({
    this.documentSource,
    this.job,
  });

  factory DescribeJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeJobResponse(
      documentSource: json['documentSource'] as String?,
      job: json['job'] != null
          ? Job.fromJson(json['job'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeJobTemplateResponse {
  final AbortConfig? abortConfig;

  /// The time, in seconds since the epoch, when the job template was created.
  final DateTime? createdAt;

  /// A description of the job template.
  final String? description;

  /// The package version Amazon Resource Names (ARNs) that are installed on the
  /// device when the job successfully completes. The package version must be in
  /// either the Published or Deprecated state when the job deploys. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/preparing-to-use-software-package-catalog.html#package-version-lifecycle">Package
  /// version lifecycle</a>.
  ///
  /// <b>Note:</b>The following Length Constraints relates to a single ARN. Up to
  /// 25 package version ARNs are allowed.
  final List<String>? destinationPackageVersions;

  /// The job document.
  final String? document;

  /// An S3 link to the job document.
  final String? documentSource;

  /// The configuration that determines how many retries are allowed for each
  /// failure type for a job.
  final JobExecutionsRetryConfig? jobExecutionsRetryConfig;
  final JobExecutionsRolloutConfig? jobExecutionsRolloutConfig;

  /// The ARN of the job template.
  final String? jobTemplateArn;

  /// The unique identifier of the job template.
  final String? jobTemplateId;

  /// Allows you to configure an optional maintenance window for the rollout of a
  /// job document to all devices in the target group for a job.
  final List<MaintenanceWindow>? maintenanceWindows;
  final PresignedUrlConfig? presignedUrlConfig;
  final TimeoutConfig? timeoutConfig;

  DescribeJobTemplateResponse({
    this.abortConfig,
    this.createdAt,
    this.description,
    this.destinationPackageVersions,
    this.document,
    this.documentSource,
    this.jobExecutionsRetryConfig,
    this.jobExecutionsRolloutConfig,
    this.jobTemplateArn,
    this.jobTemplateId,
    this.maintenanceWindows,
    this.presignedUrlConfig,
    this.timeoutConfig,
  });

  factory DescribeJobTemplateResponse.fromJson(Map<String, dynamic> json) {
    return DescribeJobTemplateResponse(
      abortConfig: json['abortConfig'] != null
          ? AbortConfig.fromJson(json['abortConfig'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      destinationPackageVersions: (json['destinationPackageVersions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      document: json['document'] as String?,
      documentSource: json['documentSource'] as String?,
      jobExecutionsRetryConfig: json['jobExecutionsRetryConfig'] != null
          ? JobExecutionsRetryConfig.fromJson(
              json['jobExecutionsRetryConfig'] as Map<String, dynamic>)
          : null,
      jobExecutionsRolloutConfig: json['jobExecutionsRolloutConfig'] != null
          ? JobExecutionsRolloutConfig.fromJson(
              json['jobExecutionsRolloutConfig'] as Map<String, dynamic>)
          : null,
      jobTemplateArn: json['jobTemplateArn'] as String?,
      jobTemplateId: json['jobTemplateId'] as String?,
      maintenanceWindows: (json['maintenanceWindows'] as List?)
          ?.nonNulls
          .map((e) => MaintenanceWindow.fromJson(e as Map<String, dynamic>))
          .toList(),
      presignedUrlConfig: json['presignedUrlConfig'] != null
          ? PresignedUrlConfig.fromJson(
              json['presignedUrlConfig'] as Map<String, dynamic>)
          : null,
      timeoutConfig: json['timeoutConfig'] != null
          ? TimeoutConfig.fromJson(
              json['timeoutConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeManagedJobTemplateResponse {
  /// The unique description of a managed template.
  final String? description;

  /// The document schema for a managed job template.
  final String? document;

  /// A map of key-value pairs that you can use as guidance to specify the inputs
  /// for creating a job from a managed template.
  /// <note>
  /// <code>documentParameters</code> can only be used when creating jobs from
  /// Amazon Web Services managed templates. This parameter can't be used with
  /// custom job templates or to create jobs from them.
  /// </note>
  final List<DocumentParameter>? documentParameters;

  /// A list of environments that are supported with the managed job template.
  final List<String>? environments;

  /// The unique Amazon Resource Name (ARN) of the managed template.
  final String? templateArn;

  /// The unique name of a managed template, such as <code>AWS-Reboot</code>.
  final String? templateName;

  /// The version for a managed template.
  final String? templateVersion;

  DescribeManagedJobTemplateResponse({
    this.description,
    this.document,
    this.documentParameters,
    this.environments,
    this.templateArn,
    this.templateName,
    this.templateVersion,
  });

  factory DescribeManagedJobTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeManagedJobTemplateResponse(
      description: json['description'] as String?,
      document: json['document'] as String?,
      documentParameters: (json['documentParameters'] as List?)
          ?.nonNulls
          .map((e) => DocumentParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      environments: (json['environments'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      templateArn: json['templateArn'] as String?,
      templateName: json['templateName'] as String?,
      templateVersion: json['templateVersion'] as String?,
    );
  }
}

class DescribeMitigationActionResponse {
  /// The ARN that identifies this migration action.
  final String? actionArn;

  /// A unique identifier for this action.
  final String? actionId;

  /// The friendly name that uniquely identifies the mitigation action.
  final String? actionName;

  /// Parameters that control how the mitigation action is applied, specific to
  /// the type of mitigation action.
  final MitigationActionParams? actionParams;

  /// The type of mitigation action.
  final MitigationActionType? actionType;

  /// The date and time when the mitigation action was added to your Amazon Web
  /// Services accounts.
  final DateTime? creationDate;

  /// The date and time when the mitigation action was last changed.
  final DateTime? lastModifiedDate;

  /// The ARN of the IAM role used to apply this action.
  final String? roleArn;

  DescribeMitigationActionResponse({
    this.actionArn,
    this.actionId,
    this.actionName,
    this.actionParams,
    this.actionType,
    this.creationDate,
    this.lastModifiedDate,
    this.roleArn,
  });

  factory DescribeMitigationActionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeMitigationActionResponse(
      actionArn: json['actionArn'] as String?,
      actionId: json['actionId'] as String?,
      actionName: json['actionName'] as String?,
      actionParams: json['actionParams'] != null
          ? MitigationActionParams.fromJson(
              json['actionParams'] as Map<String, dynamic>)
          : null,
      actionType:
          (json['actionType'] as String?)?.let(MitigationActionType.fromString),
      creationDate: timeStampFromJson(json['creationDate']),
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      roleArn: json['roleArn'] as String?,
    );
  }
}

class DescribeProvisioningTemplateResponse {
  /// The date when the provisioning template was created.
  final DateTime? creationDate;

  /// The default fleet template version ID.
  final int? defaultVersionId;

  /// The description of the provisioning template.
  final String? description;

  /// True if the provisioning template is enabled, otherwise false.
  final bool? enabled;

  /// The date when the provisioning template was last modified.
  final DateTime? lastModifiedDate;

  /// Gets information about a pre-provisioned hook.
  final ProvisioningHook? preProvisioningHook;

  /// The ARN of the role associated with the provisioning template. This IoT role
  /// grants permission to provision a device.
  final String? provisioningRoleArn;

  /// The ARN of the provisioning template.
  final String? templateArn;

  /// The JSON formatted contents of the provisioning template.
  final String? templateBody;

  /// The name of the provisioning template.
  final String? templateName;

  /// The type you define in a provisioning template. You can create a template
  /// with only one type. You can't change the template type after its creation.
  /// The default value is <code>FLEET_PROVISIONING</code>. For more information
  /// about provisioning template, see: <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/provision-template.html">Provisioning
  /// template</a>.
  final TemplateType? type;

  DescribeProvisioningTemplateResponse({
    this.creationDate,
    this.defaultVersionId,
    this.description,
    this.enabled,
    this.lastModifiedDate,
    this.preProvisioningHook,
    this.provisioningRoleArn,
    this.templateArn,
    this.templateBody,
    this.templateName,
    this.type,
  });

  factory DescribeProvisioningTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeProvisioningTemplateResponse(
      creationDate: timeStampFromJson(json['creationDate']),
      defaultVersionId: json['defaultVersionId'] as int?,
      description: json['description'] as String?,
      enabled: json['enabled'] as bool?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      preProvisioningHook: json['preProvisioningHook'] != null
          ? ProvisioningHook.fromJson(
              json['preProvisioningHook'] as Map<String, dynamic>)
          : null,
      provisioningRoleArn: json['provisioningRoleArn'] as String?,
      templateArn: json['templateArn'] as String?,
      templateBody: json['templateBody'] as String?,
      templateName: json['templateName'] as String?,
      type: (json['type'] as String?)?.let(TemplateType.fromString),
    );
  }
}

class DescribeProvisioningTemplateVersionResponse {
  /// The date when the provisioning template version was created.
  final DateTime? creationDate;

  /// True if the provisioning template version is the default version.
  final bool? isDefaultVersion;

  /// The JSON formatted contents of the provisioning template version.
  final String? templateBody;

  /// The provisioning template version ID.
  final int? versionId;

  DescribeProvisioningTemplateVersionResponse({
    this.creationDate,
    this.isDefaultVersion,
    this.templateBody,
    this.versionId,
  });

  factory DescribeProvisioningTemplateVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeProvisioningTemplateVersionResponse(
      creationDate: timeStampFromJson(json['creationDate']),
      isDefaultVersion: json['isDefaultVersion'] as bool?,
      templateBody: json['templateBody'] as String?,
      versionId: json['versionId'] as int?,
    );
  }
}

class DescribeRoleAliasResponse {
  /// The role alias description.
  final RoleAliasDescription? roleAliasDescription;

  DescribeRoleAliasResponse({
    this.roleAliasDescription,
  });

  factory DescribeRoleAliasResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRoleAliasResponse(
      roleAliasDescription: json['roleAliasDescription'] != null
          ? RoleAliasDescription.fromJson(
              json['roleAliasDescription'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeScheduledAuditResponse {
  /// The day of the month on which the scheduled audit takes place. This is will
  /// be <code>1</code> through <code>31</code> or <code>LAST</code>. If days
  /// <code>29</code>-<code>31</code> are specified, and the month does not have
  /// that many days, the audit takes place on the <code>LAST</code> day of the
  /// month.
  final String? dayOfMonth;

  /// The day of the week on which the scheduled audit takes place, either one of
  /// <code>SUN</code>, <code>MON</code>, <code>TUE</code>, <code>WED</code>,
  /// <code>THU</code>, <code>FRI</code>, or <code>SAT</code>.
  final DayOfWeek? dayOfWeek;

  /// How often the scheduled audit takes place, either one of <code>DAILY</code>,
  /// <code>WEEKLY</code>, <code>BIWEEKLY</code>, or <code>MONTHLY</code>. The
  /// start time of each audit is determined by the system.
  final AuditFrequency? frequency;

  /// The ARN of the scheduled audit.
  final String? scheduledAuditArn;

  /// The name of the scheduled audit.
  final String? scheduledAuditName;

  /// Which checks are performed during the scheduled audit. Checks must be
  /// enabled for your account. (Use
  /// <code>DescribeAccountAuditConfiguration</code> to see the list of all
  /// checks, including those that are enabled or use
  /// <code>UpdateAccountAuditConfiguration</code> to select which checks are
  /// enabled.)
  final List<String>? targetCheckNames;

  DescribeScheduledAuditResponse({
    this.dayOfMonth,
    this.dayOfWeek,
    this.frequency,
    this.scheduledAuditArn,
    this.scheduledAuditName,
    this.targetCheckNames,
  });

  factory DescribeScheduledAuditResponse.fromJson(Map<String, dynamic> json) {
    return DescribeScheduledAuditResponse(
      dayOfMonth: json['dayOfMonth'] as String?,
      dayOfWeek: (json['dayOfWeek'] as String?)?.let(DayOfWeek.fromString),
      frequency: (json['frequency'] as String?)?.let(AuditFrequency.fromString),
      scheduledAuditArn: json['scheduledAuditArn'] as String?,
      scheduledAuditName: json['scheduledAuditName'] as String?,
      targetCheckNames: (json['targetCheckNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }
}

class DescribeSecurityProfileResponse {
  /// <i>Please use
  /// <a>DescribeSecurityProfileResponse$additionalMetricsToRetainV2</a>
  /// instead.</i>
  ///
  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the profile's <code>behaviors</code>, but it
  /// is also retained for any metric specified here.
  final List<String>? additionalMetricsToRetain;

  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the profile's behaviors, but it is also
  /// retained for any metric specified here.
  final List<MetricToRetain>? additionalMetricsToRetainV2;

  /// Where the alerts are sent. (Alerts are always sent to the console.)
  final Map<AlertTargetType, AlertTarget>? alertTargets;

  /// Specifies the behaviors that, when violated by a device (thing), cause an
  /// alert.
  final List<Behavior>? behaviors;

  /// The time the security profile was created.
  final DateTime? creationDate;

  /// The time the security profile was last modified.
  final DateTime? lastModifiedDate;

  /// Specifies the MQTT topic and role ARN required for metric export.
  final MetricsExportConfig? metricsExportConfig;

  /// The ARN of the security profile.
  final String? securityProfileArn;

  /// A description of the security profile (associated with the security profile
  /// when it was created or updated).
  final String? securityProfileDescription;

  /// The name of the security profile.
  final String? securityProfileName;

  /// The version of the security profile. A new version is generated whenever the
  /// security profile is updated.
  final int? version;

  DescribeSecurityProfileResponse({
    this.additionalMetricsToRetain,
    this.additionalMetricsToRetainV2,
    this.alertTargets,
    this.behaviors,
    this.creationDate,
    this.lastModifiedDate,
    this.metricsExportConfig,
    this.securityProfileArn,
    this.securityProfileDescription,
    this.securityProfileName,
    this.version,
  });

  factory DescribeSecurityProfileResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSecurityProfileResponse(
      additionalMetricsToRetain: (json['additionalMetricsToRetain'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      additionalMetricsToRetainV2:
          (json['additionalMetricsToRetainV2'] as List?)
              ?.nonNulls
              .map((e) => MetricToRetain.fromJson(e as Map<String, dynamic>))
              .toList(),
      alertTargets: (json['alertTargets'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(AlertTargetType.fromString(k),
              AlertTarget.fromJson(e as Map<String, dynamic>))),
      behaviors: (json['behaviors'] as List?)
          ?.nonNulls
          .map((e) => Behavior.fromJson(e as Map<String, dynamic>))
          .toList(),
      creationDate: timeStampFromJson(json['creationDate']),
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      metricsExportConfig: json['metricsExportConfig'] != null
          ? MetricsExportConfig.fromJson(
              json['metricsExportConfig'] as Map<String, dynamic>)
          : null,
      securityProfileArn: json['securityProfileArn'] as String?,
      securityProfileDescription: json['securityProfileDescription'] as String?,
      securityProfileName: json['securityProfileName'] as String?,
      version: json['version'] as int?,
    );
  }
}

class DescribeStreamResponse {
  /// Information about the stream.
  final StreamInfo? streamInfo;

  DescribeStreamResponse({
    this.streamInfo,
  });

  factory DescribeStreamResponse.fromJson(Map<String, dynamic> json) {
    return DescribeStreamResponse(
      streamInfo: json['streamInfo'] != null
          ? StreamInfo.fromJson(json['streamInfo'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeThingGroupResponse {
  /// The dynamic thing group index name.
  final String? indexName;

  /// The dynamic thing group search query string.
  final String? queryString;

  /// The dynamic thing group query version.
  final String? queryVersion;

  /// The dynamic thing group status.
  final DynamicGroupStatus? status;

  /// The thing group ARN.
  final String? thingGroupArn;

  /// The thing group ID.
  final String? thingGroupId;

  /// Thing group metadata.
  final ThingGroupMetadata? thingGroupMetadata;

  /// The name of the thing group.
  final String? thingGroupName;

  /// The thing group properties.
  final ThingGroupProperties? thingGroupProperties;

  /// The version of the thing group.
  final int? version;

  DescribeThingGroupResponse({
    this.indexName,
    this.queryString,
    this.queryVersion,
    this.status,
    this.thingGroupArn,
    this.thingGroupId,
    this.thingGroupMetadata,
    this.thingGroupName,
    this.thingGroupProperties,
    this.version,
  });

  factory DescribeThingGroupResponse.fromJson(Map<String, dynamic> json) {
    return DescribeThingGroupResponse(
      indexName: json['indexName'] as String?,
      queryString: json['queryString'] as String?,
      queryVersion: json['queryVersion'] as String?,
      status: (json['status'] as String?)?.let(DynamicGroupStatus.fromString),
      thingGroupArn: json['thingGroupArn'] as String?,
      thingGroupId: json['thingGroupId'] as String?,
      thingGroupMetadata: json['thingGroupMetadata'] != null
          ? ThingGroupMetadata.fromJson(
              json['thingGroupMetadata'] as Map<String, dynamic>)
          : null,
      thingGroupName: json['thingGroupName'] as String?,
      thingGroupProperties: json['thingGroupProperties'] != null
          ? ThingGroupProperties.fromJson(
              json['thingGroupProperties'] as Map<String, dynamic>)
          : null,
      version: json['version'] as int?,
    );
  }
}

class DescribeThingRegistrationTaskResponse {
  /// The task creation date.
  final DateTime? creationDate;

  /// The number of things that failed to be provisioned.
  final int? failureCount;

  /// The S3 bucket that contains the input file.
  final String? inputFileBucket;

  /// The input file key.
  final String? inputFileKey;

  /// The date when the task was last modified.
  final DateTime? lastModifiedDate;

  /// The message.
  final String? message;

  /// The progress of the bulk provisioning task expressed as a percentage.
  final int? percentageProgress;

  /// The role ARN that grants access to the input file bucket.
  final String? roleArn;

  /// The status of the bulk thing provisioning task.
  final Status? status;

  /// The number of things successfully provisioned.
  final int? successCount;

  /// The task ID.
  final String? taskId;

  /// The task's template.
  final String? templateBody;

  DescribeThingRegistrationTaskResponse({
    this.creationDate,
    this.failureCount,
    this.inputFileBucket,
    this.inputFileKey,
    this.lastModifiedDate,
    this.message,
    this.percentageProgress,
    this.roleArn,
    this.status,
    this.successCount,
    this.taskId,
    this.templateBody,
  });

  factory DescribeThingRegistrationTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeThingRegistrationTaskResponse(
      creationDate: timeStampFromJson(json['creationDate']),
      failureCount: json['failureCount'] as int?,
      inputFileBucket: json['inputFileBucket'] as String?,
      inputFileKey: json['inputFileKey'] as String?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      message: json['message'] as String?,
      percentageProgress: json['percentageProgress'] as int?,
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.let(Status.fromString),
      successCount: json['successCount'] as int?,
      taskId: json['taskId'] as String?,
      templateBody: json['templateBody'] as String?,
    );
  }
}

/// The output from the DescribeThing operation.
class DescribeThingResponse {
  /// The thing attributes.
  final Map<String, String>? attributes;

  /// The name of the billing group the thing belongs to.
  final String? billingGroupName;

  /// The default MQTT client ID. For a typical device, the thing name is also
  /// used as the default MQTT client ID. Although we don’t require a mapping
  /// between a thing's registry name and its use of MQTT client IDs,
  /// certificates, or shadow state, we recommend that you choose a thing name and
  /// use it as the MQTT client ID for the registry and the Device Shadow service.
  ///
  /// This lets you better organize your IoT fleet without removing the
  /// flexibility of the underlying device certificate model or shadows.
  final String? defaultClientId;

  /// The ARN of the thing to describe.
  final String? thingArn;

  /// The ID of the thing to describe.
  final String? thingId;

  /// The name of the thing.
  final String? thingName;

  /// The thing type name.
  final String? thingTypeName;

  /// The current version of the thing record in the registry.
  /// <note>
  /// To avoid unintentional changes to the information in the registry, you can
  /// pass the version information in the <code>expectedVersion</code> parameter
  /// of the <code>UpdateThing</code> and <code>DeleteThing</code> calls.
  /// </note>
  final int? version;

  DescribeThingResponse({
    this.attributes,
    this.billingGroupName,
    this.defaultClientId,
    this.thingArn,
    this.thingId,
    this.thingName,
    this.thingTypeName,
    this.version,
  });

  factory DescribeThingResponse.fromJson(Map<String, dynamic> json) {
    return DescribeThingResponse(
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      billingGroupName: json['billingGroupName'] as String?,
      defaultClientId: json['defaultClientId'] as String?,
      thingArn: json['thingArn'] as String?,
      thingId: json['thingId'] as String?,
      thingName: json['thingName'] as String?,
      thingTypeName: json['thingTypeName'] as String?,
      version: json['version'] as int?,
    );
  }
}

/// The output for the DescribeThingType operation.
class DescribeThingTypeResponse {
  /// The thing type ARN.
  final String? thingTypeArn;

  /// The thing type ID.
  final String? thingTypeId;

  /// The ThingTypeMetadata contains additional information about the thing type
  /// including: creation date and time, a value indicating whether the thing type
  /// is deprecated, and a date and time when it was deprecated.
  final ThingTypeMetadata? thingTypeMetadata;

  /// The name of the thing type.
  final String? thingTypeName;

  /// The ThingTypeProperties contains information about the thing type including
  /// description, and a list of searchable thing attribute names.
  final ThingTypeProperties? thingTypeProperties;

  DescribeThingTypeResponse({
    this.thingTypeArn,
    this.thingTypeId,
    this.thingTypeMetadata,
    this.thingTypeName,
    this.thingTypeProperties,
  });

  factory DescribeThingTypeResponse.fromJson(Map<String, dynamic> json) {
    return DescribeThingTypeResponse(
      thingTypeArn: json['thingTypeArn'] as String?,
      thingTypeId: json['thingTypeId'] as String?,
      thingTypeMetadata: json['thingTypeMetadata'] != null
          ? ThingTypeMetadata.fromJson(
              json['thingTypeMetadata'] as Map<String, dynamic>)
          : null,
      thingTypeName: json['thingTypeName'] as String?,
      thingTypeProperties: json['thingTypeProperties'] != null
          ? ThingTypeProperties.fromJson(
              json['thingTypeProperties'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Describes the location of the updated firmware.
class Destination {
  /// Describes the location in S3 of the updated firmware.
  final S3Destination? s3Destination;

  Destination({
    this.s3Destination,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      s3Destination: json['s3Destination'] != null
          ? S3Destination.fromJson(
              json['s3Destination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Destination = this.s3Destination;
    return {
      if (s3Destination != null) 's3Destination': s3Destination,
    };
  }
}

class DetachSecurityProfileResponse {
  DetachSecurityProfileResponse();

  factory DetachSecurityProfileResponse.fromJson(Map<String, dynamic> _) {
    return DetachSecurityProfileResponse();
  }
}

/// The output from the DetachThingPrincipal operation.
class DetachThingPrincipalResponse {
  DetachThingPrincipalResponse();

  factory DetachThingPrincipalResponse.fromJson(Map<String, dynamic> _) {
    return DetachThingPrincipalResponse();
  }
}

/// Describes which mitigation actions should be executed.
class DetectMitigationActionExecution {
  /// The friendly name that uniquely identifies the mitigation action.
  final String? actionName;

  /// The error code of a mitigation action.
  final String? errorCode;

  /// The date a mitigation action ended.
  final DateTime? executionEndDate;

  /// The date a mitigation action was started.
  final DateTime? executionStartDate;

  /// The message of a mitigation action.
  final String? message;

  /// The status of a mitigation action.
  final DetectMitigationActionExecutionStatus? status;

  /// The unique identifier of the task.
  final String? taskId;

  /// The name of the thing.
  final String? thingName;

  /// The unique identifier of the violation.
  final String? violationId;

  DetectMitigationActionExecution({
    this.actionName,
    this.errorCode,
    this.executionEndDate,
    this.executionStartDate,
    this.message,
    this.status,
    this.taskId,
    this.thingName,
    this.violationId,
  });

  factory DetectMitigationActionExecution.fromJson(Map<String, dynamic> json) {
    return DetectMitigationActionExecution(
      actionName: json['actionName'] as String?,
      errorCode: json['errorCode'] as String?,
      executionEndDate: timeStampFromJson(json['executionEndDate']),
      executionStartDate: timeStampFromJson(json['executionStartDate']),
      message: json['message'] as String?,
      status: (json['status'] as String?)
          ?.let(DetectMitigationActionExecutionStatus.fromString),
      taskId: json['taskId'] as String?,
      thingName: json['thingName'] as String?,
      violationId: json['violationId'] as String?,
    );
  }
}

enum DetectMitigationActionExecutionStatus {
  inProgress('IN_PROGRESS'),
  successful('SUCCESSFUL'),
  failed('FAILED'),
  skipped('SKIPPED'),
  ;

  final String value;

  const DetectMitigationActionExecutionStatus(this.value);

  static DetectMitigationActionExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DetectMitigationActionExecutionStatus'));
}

/// The statistics of a mitigation action task.
class DetectMitigationActionsTaskStatistics {
  /// The actions that were performed.
  final int? actionsExecuted;

  /// The actions that failed.
  final int? actionsFailed;

  /// The actions that were skipped.
  final int? actionsSkipped;

  DetectMitigationActionsTaskStatistics({
    this.actionsExecuted,
    this.actionsFailed,
    this.actionsSkipped,
  });

  factory DetectMitigationActionsTaskStatistics.fromJson(
      Map<String, dynamic> json) {
    return DetectMitigationActionsTaskStatistics(
      actionsExecuted: json['actionsExecuted'] as int?,
      actionsFailed: json['actionsFailed'] as int?,
      actionsSkipped: json['actionsSkipped'] as int?,
    );
  }
}

enum DetectMitigationActionsTaskStatus {
  inProgress('IN_PROGRESS'),
  successful('SUCCESSFUL'),
  failed('FAILED'),
  canceled('CANCELED'),
  ;

  final String value;

  const DetectMitigationActionsTaskStatus(this.value);

  static DetectMitigationActionsTaskStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DetectMitigationActionsTaskStatus'));
}

/// The summary of the mitigation action tasks.
class DetectMitigationActionsTaskSummary {
  /// The definition of the actions.
  final List<MitigationAction>? actionsDefinition;

  /// Includes only active violations.
  final bool? onlyActiveViolationsIncluded;

  /// Includes suppressed alerts.
  final bool? suppressedAlertsIncluded;

  /// Specifies the ML Detect findings to which the mitigation actions are
  /// applied.
  final DetectMitigationActionsTaskTarget? target;

  /// The date the task ended.
  final DateTime? taskEndTime;

  /// The unique identifier of the task.
  final String? taskId;

  /// The date the task started.
  final DateTime? taskStartTime;

  /// The statistics of a mitigation action task.
  final DetectMitigationActionsTaskStatistics? taskStatistics;

  /// The status of the task.
  final DetectMitigationActionsTaskStatus? taskStatus;

  /// Specifies the time period of which violation events occurred between.
  final ViolationEventOccurrenceRange? violationEventOccurrenceRange;

  DetectMitigationActionsTaskSummary({
    this.actionsDefinition,
    this.onlyActiveViolationsIncluded,
    this.suppressedAlertsIncluded,
    this.target,
    this.taskEndTime,
    this.taskId,
    this.taskStartTime,
    this.taskStatistics,
    this.taskStatus,
    this.violationEventOccurrenceRange,
  });

  factory DetectMitigationActionsTaskSummary.fromJson(
      Map<String, dynamic> json) {
    return DetectMitigationActionsTaskSummary(
      actionsDefinition: (json['actionsDefinition'] as List?)
          ?.nonNulls
          .map((e) => MitigationAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      onlyActiveViolationsIncluded:
          json['onlyActiveViolationsIncluded'] as bool?,
      suppressedAlertsIncluded: json['suppressedAlertsIncluded'] as bool?,
      target: json['target'] != null
          ? DetectMitigationActionsTaskTarget.fromJson(
              json['target'] as Map<String, dynamic>)
          : null,
      taskEndTime: timeStampFromJson(json['taskEndTime']),
      taskId: json['taskId'] as String?,
      taskStartTime: timeStampFromJson(json['taskStartTime']),
      taskStatistics: json['taskStatistics'] != null
          ? DetectMitigationActionsTaskStatistics.fromJson(
              json['taskStatistics'] as Map<String, dynamic>)
          : null,
      taskStatus: (json['taskStatus'] as String?)
          ?.let(DetectMitigationActionsTaskStatus.fromString),
      violationEventOccurrenceRange:
          json['violationEventOccurrenceRange'] != null
              ? ViolationEventOccurrenceRange.fromJson(
                  json['violationEventOccurrenceRange'] as Map<String, dynamic>)
              : null,
    );
  }
}

/// The target of a mitigation action task.
class DetectMitigationActionsTaskTarget {
  /// The name of the behavior.
  final String? behaviorName;

  /// The name of the security profile.
  final String? securityProfileName;

  /// The unique identifiers of the violations.
  final List<String>? violationIds;

  DetectMitigationActionsTaskTarget({
    this.behaviorName,
    this.securityProfileName,
    this.violationIds,
  });

  factory DetectMitigationActionsTaskTarget.fromJson(
      Map<String, dynamic> json) {
    return DetectMitigationActionsTaskTarget(
      behaviorName: json['behaviorName'] as String?,
      securityProfileName: json['securityProfileName'] as String?,
      violationIds: (json['violationIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final behaviorName = this.behaviorName;
    final securityProfileName = this.securityProfileName;
    final violationIds = this.violationIds;
    return {
      if (behaviorName != null) 'behaviorName': behaviorName,
      if (securityProfileName != null)
        'securityProfileName': securityProfileName,
      if (violationIds != null) 'violationIds': violationIds,
    };
  }
}

enum DeviceCertificateUpdateAction {
  deactivate('DEACTIVATE'),
  ;

  final String value;

  const DeviceCertificateUpdateAction(this.value);

  static DeviceCertificateUpdateAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DeviceCertificateUpdateAction'));
}

enum DeviceDefenderIndexingMode {
  off('OFF'),
  violations('VIOLATIONS'),
  ;

  final String value;

  const DeviceDefenderIndexingMode(this.value);

  static DeviceDefenderIndexingMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DeviceDefenderIndexingMode'));
}

enum DimensionType {
  topicFilter('TOPIC_FILTER'),
  ;

  final String value;

  const DimensionType(this.value);

  static DimensionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DimensionType'));
}

enum DimensionValueOperator {
  $in('IN'),
  notIn('NOT_IN'),
  ;

  final String value;

  const DimensionValueOperator(this.value);

  static DimensionValueOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DimensionValueOperator'));
}

/// A map of key-value pairs containing the patterns that need to be replaced in
/// a managed template job document schema. You can use the description of each
/// key as a guidance to specify the inputs during runtime when creating a job.
/// <note>
/// <code>documentParameters</code> can only be used when creating jobs from
/// Amazon Web Services managed templates. This parameter can't be used with
/// custom job templates or to create jobs from them.
/// </note>
class DocumentParameter {
  /// Description of the map field containing the patterns that need to be
  /// replaced in a managed template job document schema.
  final String? description;

  /// An example illustrating a pattern that need to be replaced in a managed
  /// template job document schema.
  final String? example;

  /// Key of the map field containing the patterns that need to be replaced in a
  /// managed template job document schema.
  final String? key;

  /// Specifies whether a pattern that needs to be replaced in a managed template
  /// job document schema is optional or required.
  final bool? optional;

  /// A regular expression of the patterns that need to be replaced in a managed
  /// template job document schema.
  final String? regex;

  DocumentParameter({
    this.description,
    this.example,
    this.key,
    this.optional,
    this.regex,
  });

  factory DocumentParameter.fromJson(Map<String, dynamic> json) {
    return DocumentParameter(
      description: json['description'] as String?,
      example: json['example'] as String?,
      key: json['key'] as String?,
      optional: json['optional'] as bool?,
      regex: json['regex'] as String?,
    );
  }
}

enum DomainConfigurationStatus {
  enabled('ENABLED'),
  disabled('DISABLED'),
  ;

  final String value;

  const DomainConfigurationStatus(this.value);

  static DomainConfigurationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DomainConfigurationStatus'));
}

/// The summary of a domain configuration. A domain configuration specifies
/// custom IoT-specific information about a domain. A domain configuration can
/// be associated with an Amazon Web Services-managed domain (for example,
/// dbc123defghijk.iot.us-west-2.amazonaws.com), a customer managed domain, or a
/// default endpoint.
///
/// <ul>
/// <li>
/// Data
/// </li>
/// <li>
/// Jobs
/// </li>
/// <li>
/// CredentialProvider
/// </li>
/// </ul>
class DomainConfigurationSummary {
  /// The ARN of the domain configuration.
  final String? domainConfigurationArn;

  /// The name of the domain configuration. This value must be unique to a region.
  final String? domainConfigurationName;

  /// The type of service delivered by the endpoint.
  final ServiceType? serviceType;

  DomainConfigurationSummary({
    this.domainConfigurationArn,
    this.domainConfigurationName,
    this.serviceType,
  });

  factory DomainConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return DomainConfigurationSummary(
      domainConfigurationArn: json['domainConfigurationArn'] as String?,
      domainConfigurationName: json['domainConfigurationName'] as String?,
      serviceType:
          (json['serviceType'] as String?)?.let(ServiceType.fromString),
    );
  }
}

enum DomainType {
  endpoint('ENDPOINT'),
  awsManaged('AWS_MANAGED'),
  customerManaged('CUSTOMER_MANAGED'),
  ;

  final String value;

  const DomainType(this.value);

  static DomainType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum DomainType'));
}

enum DynamicGroupStatus {
  active('ACTIVE'),
  building('BUILDING'),
  rebuilding('REBUILDING'),
  ;

  final String value;

  const DynamicGroupStatus(this.value);

  static DynamicGroupStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum DynamicGroupStatus'));
}

/// Describes an action to write to a DynamoDB table.
///
/// The <code>tableName</code>, <code>hashKeyField</code>, and
/// <code>rangeKeyField</code> values must match the values used when you
/// created the table.
///
/// The <code>hashKeyValue</code> and <code>rangeKeyvalue</code> fields use a
/// substitution template syntax. These templates provide data at runtime. The
/// syntax is as follows: ${<i>sql-expression</i>}.
///
/// You can specify any valid expression in a WHERE or SELECT clause, including
/// JSON properties, comparisons, calculations, and functions. For example, the
/// following field uses the third level of the topic:
///
/// <code>"hashKeyValue": "${topic(3)}"</code>
///
/// The following field uses the timestamp:
///
/// <code>"rangeKeyValue": "${timestamp()}"</code>
class DynamoDBAction {
  /// The hash key name.
  final String hashKeyField;

  /// The hash key value.
  final String hashKeyValue;

  /// The ARN of the IAM role that grants access to the DynamoDB table.
  final String roleArn;

  /// The name of the DynamoDB table.
  final String tableName;

  /// The hash key type. Valid values are "STRING" or "NUMBER"
  final DynamoKeyType? hashKeyType;

  /// The type of operation to be performed. This follows the substitution
  /// template, so it can be <code>${operation}</code>, but the substitution must
  /// result in one of the following: <code>INSERT</code>, <code>UPDATE</code>, or
  /// <code>DELETE</code>.
  final String? operation;

  /// The action payload. This name can be customized.
  final String? payloadField;

  /// The range key name.
  final String? rangeKeyField;

  /// The range key type. Valid values are "STRING" or "NUMBER"
  final DynamoKeyType? rangeKeyType;

  /// The range key value.
  final String? rangeKeyValue;

  DynamoDBAction({
    required this.hashKeyField,
    required this.hashKeyValue,
    required this.roleArn,
    required this.tableName,
    this.hashKeyType,
    this.operation,
    this.payloadField,
    this.rangeKeyField,
    this.rangeKeyType,
    this.rangeKeyValue,
  });

  factory DynamoDBAction.fromJson(Map<String, dynamic> json) {
    return DynamoDBAction(
      hashKeyField: json['hashKeyField'] as String,
      hashKeyValue: json['hashKeyValue'] as String,
      roleArn: json['roleArn'] as String,
      tableName: json['tableName'] as String,
      hashKeyType:
          (json['hashKeyType'] as String?)?.let(DynamoKeyType.fromString),
      operation: json['operation'] as String?,
      payloadField: json['payloadField'] as String?,
      rangeKeyField: json['rangeKeyField'] as String?,
      rangeKeyType:
          (json['rangeKeyType'] as String?)?.let(DynamoKeyType.fromString),
      rangeKeyValue: json['rangeKeyValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hashKeyField = this.hashKeyField;
    final hashKeyValue = this.hashKeyValue;
    final roleArn = this.roleArn;
    final tableName = this.tableName;
    final hashKeyType = this.hashKeyType;
    final operation = this.operation;
    final payloadField = this.payloadField;
    final rangeKeyField = this.rangeKeyField;
    final rangeKeyType = this.rangeKeyType;
    final rangeKeyValue = this.rangeKeyValue;
    return {
      'hashKeyField': hashKeyField,
      'hashKeyValue': hashKeyValue,
      'roleArn': roleArn,
      'tableName': tableName,
      if (hashKeyType != null) 'hashKeyType': hashKeyType.value,
      if (operation != null) 'operation': operation,
      if (payloadField != null) 'payloadField': payloadField,
      if (rangeKeyField != null) 'rangeKeyField': rangeKeyField,
      if (rangeKeyType != null) 'rangeKeyType': rangeKeyType.value,
      if (rangeKeyValue != null) 'rangeKeyValue': rangeKeyValue,
    };
  }
}

/// Describes an action to write to a DynamoDB table.
///
/// This DynamoDB action writes each attribute in the message payload into it's
/// own column in the DynamoDB table.
class DynamoDBv2Action {
  /// Specifies the DynamoDB table to which the message data will be written. For
  /// example:
  ///
  /// <code>{ "dynamoDBv2": { "roleArn": "aws:iam:12341251:my-role" "putItem": {
  /// "tableName": "my-table" } } }</code>
  ///
  /// Each attribute in the message payload will be written to a separate column
  /// in the DynamoDB database.
  final PutItemInput putItem;

  /// The ARN of the IAM role that grants access to the DynamoDB table.
  final String roleArn;

  DynamoDBv2Action({
    required this.putItem,
    required this.roleArn,
  });

  factory DynamoDBv2Action.fromJson(Map<String, dynamic> json) {
    return DynamoDBv2Action(
      putItem: PutItemInput.fromJson(json['putItem'] as Map<String, dynamic>),
      roleArn: json['roleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final putItem = this.putItem;
    final roleArn = this.roleArn;
    return {
      'putItem': putItem,
      'roleArn': roleArn,
    };
  }
}

enum DynamoKeyType {
  string('STRING'),
  number('NUMBER'),
  ;

  final String value;

  const DynamoKeyType(this.value);

  static DynamoKeyType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DynamoKeyType'));
}

/// The policy that has the effect on the authorization results.
class EffectivePolicy {
  /// The policy ARN.
  final String? policyArn;

  /// The IAM policy document.
  final String? policyDocument;

  /// The policy name.
  final String? policyName;

  EffectivePolicy({
    this.policyArn,
    this.policyDocument,
    this.policyName,
  });

  factory EffectivePolicy.fromJson(Map<String, dynamic> json) {
    return EffectivePolicy(
      policyArn: json['policyArn'] as String?,
      policyDocument: json['policyDocument'] as String?,
      policyName: json['policyName'] as String?,
    );
  }
}

/// Describes an action that writes data to an Amazon OpenSearch Service domain.
/// <note>
/// The <code>Elasticsearch</code> action can only be used by existing rule
/// actions. To create a new rule action or to update an existing rule action,
/// use the <code>OpenSearch</code> rule action instead. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/iot/latest/apireference/API_OpenSearchAction.html">OpenSearchAction</a>.
/// </note>
class ElasticsearchAction {
  /// The endpoint of your OpenSearch domain.
  final String endpoint;

  /// The unique identifier for the document you are storing.
  final String id;

  /// The index where you want to store your data.
  final String index;

  /// The IAM role ARN that has access to OpenSearch.
  final String roleArn;

  /// The type of document you are storing.
  final String type;

  ElasticsearchAction({
    required this.endpoint,
    required this.id,
    required this.index,
    required this.roleArn,
    required this.type,
  });

  factory ElasticsearchAction.fromJson(Map<String, dynamic> json) {
    return ElasticsearchAction(
      endpoint: json['endpoint'] as String,
      id: json['id'] as String,
      index: json['index'] as String,
      roleArn: json['roleArn'] as String,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final id = this.id;
    final index = this.index;
    final roleArn = this.roleArn;
    final type = this.type;
    return {
      'endpoint': endpoint,
      'id': id,
      'index': index,
      'roleArn': roleArn,
      'type': type,
    };
  }
}

/// Parameters used when defining a mitigation action that enable Amazon Web
/// Services IoT Core logging.
class EnableIoTLoggingParams {
  /// Specifies the type of information to be logged.
  final LogLevel logLevel;

  /// The Amazon Resource Name (ARN) of the IAM role used for logging.
  final String roleArnForLogging;

  EnableIoTLoggingParams({
    required this.logLevel,
    required this.roleArnForLogging,
  });

  factory EnableIoTLoggingParams.fromJson(Map<String, dynamic> json) {
    return EnableIoTLoggingParams(
      logLevel: LogLevel.fromString((json['logLevel'] as String)),
      roleArnForLogging: json['roleArnForLogging'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final logLevel = this.logLevel;
    final roleArnForLogging = this.roleArnForLogging;
    return {
      'logLevel': logLevel.value,
      'roleArnForLogging': roleArnForLogging,
    };
  }
}

/// Error information.
class ErrorInfo {
  /// The error code.
  final String? code;

  /// The error message.
  final String? message;

  ErrorInfo({
    this.code,
    this.message,
  });

  factory ErrorInfo.fromJson(Map<String, dynamic> json) {
    return ErrorInfo(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );
  }
}

enum EventType {
  thing('THING'),
  thingGroup('THING_GROUP'),
  thingType('THING_TYPE'),
  thingGroupMembership('THING_GROUP_MEMBERSHIP'),
  thingGroupHierarchy('THING_GROUP_HIERARCHY'),
  thingTypeAssociation('THING_TYPE_ASSOCIATION'),
  job('JOB'),
  jobExecution('JOB_EXECUTION'),
  policy('POLICY'),
  certificate('CERTIFICATE'),
  caCertificate('CA_CERTIFICATE'),
  ;

  final String value;

  const EventType(this.value);

  static EventType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum EventType'));
}

/// Information that explicitly denies authorization.
class ExplicitDeny {
  /// The policies that denied the authorization.
  final List<Policy>? policies;

  ExplicitDeny({
    this.policies,
  });

  factory ExplicitDeny.fromJson(Map<String, dynamic> json) {
    return ExplicitDeny(
      policies: (json['policies'] as List?)
          ?.nonNulls
          .map((e) => Policy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Allows you to create an exponential rate of rollout for a job.
class ExponentialRolloutRate {
  /// The minimum number of things that will be notified of a pending job, per
  /// minute at the start of job rollout. This parameter allows you to define the
  /// initial rate of rollout.
  final int baseRatePerMinute;

  /// The exponential factor to increase the rate of rollout for a job.
  ///
  /// Amazon Web Services IoT Core supports up to one digit after the decimal (for
  /// example, 1.5, but not 1.55).
  final double incrementFactor;

  /// The criteria to initiate the increase in rate of rollout for a job.
  final RateIncreaseCriteria rateIncreaseCriteria;

  ExponentialRolloutRate({
    required this.baseRatePerMinute,
    required this.incrementFactor,
    required this.rateIncreaseCriteria,
  });

  factory ExponentialRolloutRate.fromJson(Map<String, dynamic> json) {
    return ExponentialRolloutRate(
      baseRatePerMinute: json['baseRatePerMinute'] as int,
      incrementFactor: json['incrementFactor'] as double,
      rateIncreaseCriteria: RateIncreaseCriteria.fromJson(
          json['rateIncreaseCriteria'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final baseRatePerMinute = this.baseRatePerMinute;
    final incrementFactor = this.incrementFactor;
    final rateIncreaseCriteria = this.rateIncreaseCriteria;
    return {
      'baseRatePerMinute': baseRatePerMinute,
      'incrementFactor': incrementFactor,
      'rateIncreaseCriteria': rateIncreaseCriteria,
    };
  }
}

/// Describes the name and data type at a field.
class Field {
  /// The name of the field.
  final String? name;

  /// The data type of the field.
  final FieldType? type;

  Field({
    this.name,
    this.type,
  });

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      name: json['name'] as String?,
      type: (json['type'] as String?)?.let(FieldType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      if (name != null) 'name': name,
      if (type != null) 'type': type.value,
    };
  }
}

enum FieldType {
  number('Number'),
  string('String'),
  boolean('Boolean'),
  ;

  final String value;

  const FieldType(this.value);

  static FieldType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum FieldType'));
}

/// The location of the OTA update.
class FileLocation {
  /// The location of the updated firmware in S3.
  final S3Location? s3Location;

  /// The stream that contains the OTA update.
  final Stream? stream;

  FileLocation({
    this.s3Location,
    this.stream,
  });

  factory FileLocation.fromJson(Map<String, dynamic> json) {
    return FileLocation(
      s3Location: json['s3Location'] != null
          ? S3Location.fromJson(json['s3Location'] as Map<String, dynamic>)
          : null,
      stream: json['stream'] != null
          ? Stream.fromJson(json['stream'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    final stream = this.stream;
    return {
      if (s3Location != null) 's3Location': s3Location,
      if (stream != null) 'stream': stream,
    };
  }
}

/// Describes an action that writes data to an Amazon Kinesis Firehose stream.
class FirehoseAction {
  /// The delivery stream name.
  final String deliveryStreamName;

  /// The IAM role that grants access to the Amazon Kinesis Firehose stream.
  final String roleArn;

  /// Whether to deliver the Kinesis Data Firehose stream as a batch by using <a
  /// href="https://docs.aws.amazon.com/firehose/latest/APIReference/API_PutRecordBatch.html">
  /// <code>PutRecordBatch</code> </a>. The default value is <code>false</code>.
  ///
  /// When <code>batchMode</code> is <code>true</code> and the rule's SQL
  /// statement evaluates to an Array, each Array element forms one record in the
  /// <a
  /// href="https://docs.aws.amazon.com/firehose/latest/APIReference/API_PutRecordBatch.html">
  /// <code>PutRecordBatch</code> </a> request. The resulting array can't have
  /// more than 500 records.
  final bool? batchMode;

  /// A character separator that will be used to separate records written to the
  /// Firehose stream. Valid values are: '\n' (newline), '\t' (tab), '\r\n'
  /// (Windows newline), ',' (comma).
  final String? separator;

  FirehoseAction({
    required this.deliveryStreamName,
    required this.roleArn,
    this.batchMode,
    this.separator,
  });

  factory FirehoseAction.fromJson(Map<String, dynamic> json) {
    return FirehoseAction(
      deliveryStreamName: json['deliveryStreamName'] as String,
      roleArn: json['roleArn'] as String,
      batchMode: json['batchMode'] as bool?,
      separator: json['separator'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStreamName = this.deliveryStreamName;
    final roleArn = this.roleArn;
    final batchMode = this.batchMode;
    final separator = this.separator;
    return {
      'deliveryStreamName': deliveryStreamName,
      'roleArn': roleArn,
      if (batchMode != null) 'batchMode': batchMode,
      if (separator != null) 'separator': separator,
    };
  }
}

/// The name and ARN of a fleet metric.
class FleetMetricNameAndArn {
  /// The fleet metric ARN.
  final String? metricArn;

  /// The fleet metric name.
  final String? metricName;

  FleetMetricNameAndArn({
    this.metricArn,
    this.metricName,
  });

  factory FleetMetricNameAndArn.fromJson(Map<String, dynamic> json) {
    return FleetMetricNameAndArn(
      metricArn: json['metricArn'] as String?,
      metricName: json['metricName'] as String?,
    );
  }
}

enum FleetMetricUnit {
  seconds('Seconds'),
  microseconds('Microseconds'),
  milliseconds('Milliseconds'),
  bytes('Bytes'),
  kilobytes('Kilobytes'),
  megabytes('Megabytes'),
  gigabytes('Gigabytes'),
  terabytes('Terabytes'),
  bits('Bits'),
  kilobits('Kilobits'),
  megabits('Megabits'),
  gigabits('Gigabits'),
  terabits('Terabits'),
  percent('Percent'),
  count('Count'),
  bytesSecond('Bytes/Second'),
  kilobytesSecond('Kilobytes/Second'),
  megabytesSecond('Megabytes/Second'),
  gigabytesSecond('Gigabytes/Second'),
  terabytesSecond('Terabytes/Second'),
  bitsSecond('Bits/Second'),
  kilobitsSecond('Kilobits/Second'),
  megabitsSecond('Megabits/Second'),
  gigabitsSecond('Gigabits/Second'),
  terabitsSecond('Terabits/Second'),
  countSecond('Count/Second'),
  none('None'),
  ;

  final String value;

  const FleetMetricUnit(this.value);

  static FleetMetricUnit fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum FleetMetricUnit'));
}

/// A geolocation target that you select to index. Each geolocation target
/// contains a <code>name</code> and <code>order</code> key-value pair that
/// specifies the geolocation target fields.
class GeoLocationTarget {
  /// The <code>name</code> of the geolocation target field. If the target field
  /// is part of a named shadow, you must select the named shadow using the
  /// <code>namedShadow</code> filter.
  final String? name;

  /// The <code>order</code> of the geolocation target field. This field is
  /// optional. The default value is <code>LatLon</code>.
  final TargetFieldOrder? order;

  GeoLocationTarget({
    this.name,
    this.order,
  });

  factory GeoLocationTarget.fromJson(Map<String, dynamic> json) {
    return GeoLocationTarget(
      name: json['name'] as String?,
      order: (json['order'] as String?)?.let(TargetFieldOrder.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final order = this.order;
    return {
      if (name != null) 'name': name,
      if (order != null) 'order': order.value,
    };
  }
}

class GetBehaviorModelTrainingSummariesResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  final String? nextToken;

  /// A list of all ML Detect behaviors and their model status for a given
  /// Security Profile.
  final List<BehaviorModelTrainingSummary>? summaries;

  GetBehaviorModelTrainingSummariesResponse({
    this.nextToken,
    this.summaries,
  });

  factory GetBehaviorModelTrainingSummariesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetBehaviorModelTrainingSummariesResponse(
      nextToken: json['nextToken'] as String?,
      summaries: (json['summaries'] as List?)
          ?.nonNulls
          .map((e) =>
              BehaviorModelTrainingSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetBucketsAggregationResponse {
  /// The main part of the response with a list of buckets. Each bucket contains a
  /// <code>keyValue</code> and a <code>count</code>.
  ///
  /// <code>keyValue</code>: The aggregation field value counted for the
  /// particular bucket.
  ///
  /// <code>count</code>: The number of documents that have that value.
  final List<Bucket>? buckets;

  /// The total number of things that fit the query string criteria.
  final int? totalCount;

  GetBucketsAggregationResponse({
    this.buckets,
    this.totalCount,
  });

  factory GetBucketsAggregationResponse.fromJson(Map<String, dynamic> json) {
    return GetBucketsAggregationResponse(
      buckets: (json['buckets'] as List?)
          ?.nonNulls
          .map((e) => Bucket.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );
  }
}

class GetCardinalityResponse {
  /// The approximate count of unique values that match the query.
  final int? cardinality;

  GetCardinalityResponse({
    this.cardinality,
  });

  factory GetCardinalityResponse.fromJson(Map<String, dynamic> json) {
    return GetCardinalityResponse(
      cardinality: json['cardinality'] as int?,
    );
  }
}

class GetEffectivePoliciesResponse {
  /// The effective policies.
  final List<EffectivePolicy>? effectivePolicies;

  GetEffectivePoliciesResponse({
    this.effectivePolicies,
  });

  factory GetEffectivePoliciesResponse.fromJson(Map<String, dynamic> json) {
    return GetEffectivePoliciesResponse(
      effectivePolicies: (json['effectivePolicies'] as List?)
          ?.nonNulls
          .map((e) => EffectivePolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetIndexingConfigurationResponse {
  /// The index configuration.
  final ThingGroupIndexingConfiguration? thingGroupIndexingConfiguration;

  /// Thing indexing configuration.
  final ThingIndexingConfiguration? thingIndexingConfiguration;

  GetIndexingConfigurationResponse({
    this.thingGroupIndexingConfiguration,
    this.thingIndexingConfiguration,
  });

  factory GetIndexingConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetIndexingConfigurationResponse(
      thingGroupIndexingConfiguration:
          json['thingGroupIndexingConfiguration'] != null
              ? ThingGroupIndexingConfiguration.fromJson(
                  json['thingGroupIndexingConfiguration']
                      as Map<String, dynamic>)
              : null,
      thingIndexingConfiguration: json['thingIndexingConfiguration'] != null
          ? ThingIndexingConfiguration.fromJson(
              json['thingIndexingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetJobDocumentResponse {
  /// The job document content.
  final String? document;

  GetJobDocumentResponse({
    this.document,
  });

  factory GetJobDocumentResponse.fromJson(Map<String, dynamic> json) {
    return GetJobDocumentResponse(
      document: json['document'] as String?,
    );
  }
}

/// The output from the GetLoggingOptions operation.
class GetLoggingOptionsResponse {
  /// The logging level.
  final LogLevel? logLevel;

  /// The ARN of the IAM role that grants access.
  final String? roleArn;

  GetLoggingOptionsResponse({
    this.logLevel,
    this.roleArn,
  });

  factory GetLoggingOptionsResponse.fromJson(Map<String, dynamic> json) {
    return GetLoggingOptionsResponse(
      logLevel: (json['logLevel'] as String?)?.let(LogLevel.fromString),
      roleArn: json['roleArn'] as String?,
    );
  }
}

class GetOTAUpdateResponse {
  /// The OTA update info.
  final OTAUpdateInfo? otaUpdateInfo;

  GetOTAUpdateResponse({
    this.otaUpdateInfo,
  });

  factory GetOTAUpdateResponse.fromJson(Map<String, dynamic> json) {
    return GetOTAUpdateResponse(
      otaUpdateInfo: json['otaUpdateInfo'] != null
          ? OTAUpdateInfo.fromJson(
              json['otaUpdateInfo'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetPackageConfigurationResponse {
  /// The version that is associated to a specific job.
  final VersionUpdateByJobsConfig? versionUpdateByJobsConfig;

  GetPackageConfigurationResponse({
    this.versionUpdateByJobsConfig,
  });

  factory GetPackageConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetPackageConfigurationResponse(
      versionUpdateByJobsConfig: json['versionUpdateByJobsConfig'] != null
          ? VersionUpdateByJobsConfig.fromJson(
              json['versionUpdateByJobsConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetPackageResponse {
  /// The date the package was created.
  final DateTime? creationDate;

  /// The name of the default package version.
  final String? defaultVersionName;

  /// The package description.
  final String? description;

  /// The date when the package was last updated.
  final DateTime? lastModifiedDate;

  /// The ARN for the package.
  final String? packageArn;

  /// The name of the software package.
  final String? packageName;

  GetPackageResponse({
    this.creationDate,
    this.defaultVersionName,
    this.description,
    this.lastModifiedDate,
    this.packageArn,
    this.packageName,
  });

  factory GetPackageResponse.fromJson(Map<String, dynamic> json) {
    return GetPackageResponse(
      creationDate: timeStampFromJson(json['creationDate']),
      defaultVersionName: json['defaultVersionName'] as String?,
      description: json['description'] as String?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      packageArn: json['packageArn'] as String?,
      packageName: json['packageName'] as String?,
    );
  }
}

class GetPackageVersionResponse {
  /// Metadata that were added to the package version that can be used to define a
  /// package version’s configuration.
  final Map<String, String>? attributes;

  /// The date when the package version was created.
  final DateTime? creationDate;

  /// The package version description.
  final String? description;

  /// Error reason for a package version failure during creation or update.
  final String? errorReason;

  /// The date when the package version was last updated.
  final DateTime? lastModifiedDate;

  /// The name of the software package.
  final String? packageName;

  /// The ARN for the package version.
  final String? packageVersionArn;

  /// The status associated to the package version. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/preparing-to-use-software-package-catalog.html#package-version-lifecycle">Package
  /// version lifecycle</a>.
  final PackageVersionStatus? status;

  /// The name of the package version.
  final String? versionName;

  GetPackageVersionResponse({
    this.attributes,
    this.creationDate,
    this.description,
    this.errorReason,
    this.lastModifiedDate,
    this.packageName,
    this.packageVersionArn,
    this.status,
    this.versionName,
  });

  factory GetPackageVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetPackageVersionResponse(
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      creationDate: timeStampFromJson(json['creationDate']),
      description: json['description'] as String?,
      errorReason: json['errorReason'] as String?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      packageName: json['packageName'] as String?,
      packageVersionArn: json['packageVersionArn'] as String?,
      status: (json['status'] as String?)?.let(PackageVersionStatus.fromString),
      versionName: json['versionName'] as String?,
    );
  }
}

class GetPercentilesResponse {
  /// The percentile values of the aggregated fields.
  final List<PercentPair>? percentiles;

  GetPercentilesResponse({
    this.percentiles,
  });

  factory GetPercentilesResponse.fromJson(Map<String, dynamic> json) {
    return GetPercentilesResponse(
      percentiles: (json['percentiles'] as List?)
          ?.nonNulls
          .map((e) => PercentPair.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The output from the GetPolicy operation.
class GetPolicyResponse {
  /// The date the policy was created.
  final DateTime? creationDate;

  /// The default policy version ID.
  final String? defaultVersionId;

  /// The generation ID of the policy.
  final String? generationId;

  /// The date the policy was last modified.
  final DateTime? lastModifiedDate;

  /// The policy ARN.
  final String? policyArn;

  /// The JSON document that describes the policy.
  final String? policyDocument;

  /// The policy name.
  final String? policyName;

  GetPolicyResponse({
    this.creationDate,
    this.defaultVersionId,
    this.generationId,
    this.lastModifiedDate,
    this.policyArn,
    this.policyDocument,
    this.policyName,
  });

  factory GetPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetPolicyResponse(
      creationDate: timeStampFromJson(json['creationDate']),
      defaultVersionId: json['defaultVersionId'] as String?,
      generationId: json['generationId'] as String?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      policyArn: json['policyArn'] as String?,
      policyDocument: json['policyDocument'] as String?,
      policyName: json['policyName'] as String?,
    );
  }
}

/// The output from the GetPolicyVersion operation.
class GetPolicyVersionResponse {
  /// The date the policy was created.
  final DateTime? creationDate;

  /// The generation ID of the policy version.
  final String? generationId;

  /// Specifies whether the policy version is the default.
  final bool? isDefaultVersion;

  /// The date the policy was last modified.
  final DateTime? lastModifiedDate;

  /// The policy ARN.
  final String? policyArn;

  /// The JSON document that describes the policy.
  final String? policyDocument;

  /// The policy name.
  final String? policyName;

  /// The policy version ID.
  final String? policyVersionId;

  GetPolicyVersionResponse({
    this.creationDate,
    this.generationId,
    this.isDefaultVersion,
    this.lastModifiedDate,
    this.policyArn,
    this.policyDocument,
    this.policyName,
    this.policyVersionId,
  });

  factory GetPolicyVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetPolicyVersionResponse(
      creationDate: timeStampFromJson(json['creationDate']),
      generationId: json['generationId'] as String?,
      isDefaultVersion: json['isDefaultVersion'] as bool?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      policyArn: json['policyArn'] as String?,
      policyDocument: json['policyDocument'] as String?,
      policyName: json['policyName'] as String?,
      policyVersionId: json['policyVersionId'] as String?,
    );
  }
}

/// The output from the GetRegistrationCode operation.
class GetRegistrationCodeResponse {
  /// The CA certificate registration code.
  final String? registrationCode;

  GetRegistrationCodeResponse({
    this.registrationCode,
  });

  factory GetRegistrationCodeResponse.fromJson(Map<String, dynamic> json) {
    return GetRegistrationCodeResponse(
      registrationCode: json['registrationCode'] as String?,
    );
  }
}

class GetStatisticsResponse {
  /// The statistics returned by the Fleet Indexing service based on the query and
  /// aggregation field.
  final Statistics? statistics;

  GetStatisticsResponse({
    this.statistics,
  });

  factory GetStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return GetStatisticsResponse(
      statistics: json['statistics'] != null
          ? Statistics.fromJson(json['statistics'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetTopicRuleDestinationResponse {
  /// The topic rule destination.
  final TopicRuleDestination? topicRuleDestination;

  GetTopicRuleDestinationResponse({
    this.topicRuleDestination,
  });

  factory GetTopicRuleDestinationResponse.fromJson(Map<String, dynamic> json) {
    return GetTopicRuleDestinationResponse(
      topicRuleDestination: json['topicRuleDestination'] != null
          ? TopicRuleDestination.fromJson(
              json['topicRuleDestination'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// The output from the GetTopicRule operation.
class GetTopicRuleResponse {
  /// The rule.
  final TopicRule? rule;

  /// The rule ARN.
  final String? ruleArn;

  GetTopicRuleResponse({
    this.rule,
    this.ruleArn,
  });

  factory GetTopicRuleResponse.fromJson(Map<String, dynamic> json) {
    return GetTopicRuleResponse(
      rule: json['rule'] != null
          ? TopicRule.fromJson(json['rule'] as Map<String, dynamic>)
          : null,
      ruleArn: json['ruleArn'] as String?,
    );
  }
}

class GetV2LoggingOptionsResponse {
  /// The default log level.
  final LogLevel? defaultLogLevel;

  /// Disables all logs.
  final bool? disableAllLogs;

  /// The IAM role ARN IoT uses to write to your CloudWatch logs.
  final String? roleArn;

  GetV2LoggingOptionsResponse({
    this.defaultLogLevel,
    this.disableAllLogs,
    this.roleArn,
  });

  factory GetV2LoggingOptionsResponse.fromJson(Map<String, dynamic> json) {
    return GetV2LoggingOptionsResponse(
      defaultLogLevel:
          (json['defaultLogLevel'] as String?)?.let(LogLevel.fromString),
      disableAllLogs: json['disableAllLogs'] as bool?,
      roleArn: json['roleArn'] as String?,
    );
  }
}

/// The name and ARN of a group.
class GroupNameAndArn {
  /// The group ARN.
  final String? groupArn;

  /// The group name.
  final String? groupName;

  GroupNameAndArn({
    this.groupArn,
    this.groupName,
  });

  factory GroupNameAndArn.fromJson(Map<String, dynamic> json) {
    return GroupNameAndArn(
      groupArn: json['groupArn'] as String?,
      groupName: json['groupName'] as String?,
    );
  }
}

/// Send data to an HTTPS endpoint.
class HttpAction {
  /// The endpoint URL. If substitution templates are used in the URL, you must
  /// also specify a <code>confirmationUrl</code>. If this is a new destination, a
  /// new <code>TopicRuleDestination</code> is created if possible.
  final String url;

  /// The authentication method to use when sending data to an HTTPS endpoint.
  final HttpAuthorization? auth;

  /// The URL to which IoT sends a confirmation message. The value of the
  /// confirmation URL must be a prefix of the endpoint URL. If you do not specify
  /// a confirmation URL IoT uses the endpoint URL as the confirmation URL. If you
  /// use substitution templates in the confirmationUrl, you must create and
  /// enable topic rule destinations that match each possible value of the
  /// substitution template before traffic is allowed to your endpoint URL.
  final String? confirmationUrl;

  /// The HTTP headers to send with the message data.
  final List<HttpActionHeader>? headers;

  HttpAction({
    required this.url,
    this.auth,
    this.confirmationUrl,
    this.headers,
  });

  factory HttpAction.fromJson(Map<String, dynamic> json) {
    return HttpAction(
      url: json['url'] as String,
      auth: json['auth'] != null
          ? HttpAuthorization.fromJson(json['auth'] as Map<String, dynamic>)
          : null,
      confirmationUrl: json['confirmationUrl'] as String?,
      headers: (json['headers'] as List?)
          ?.nonNulls
          .map((e) => HttpActionHeader.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    final auth = this.auth;
    final confirmationUrl = this.confirmationUrl;
    final headers = this.headers;
    return {
      'url': url,
      if (auth != null) 'auth': auth,
      if (confirmationUrl != null) 'confirmationUrl': confirmationUrl,
      if (headers != null) 'headers': headers,
    };
  }
}

/// The HTTP action header.
class HttpActionHeader {
  /// The HTTP header key.
  final String key;

  /// The HTTP header value. Substitution templates are supported.
  final String value;

  HttpActionHeader({
    required this.key,
    required this.value,
  });

  factory HttpActionHeader.fromJson(Map<String, dynamic> json) {
    return HttpActionHeader(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// The authorization method used to send messages.
class HttpAuthorization {
  /// Use Sig V4 authorization. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4 Signing Process</a>.
  final SigV4Authorization? sigv4;

  HttpAuthorization({
    this.sigv4,
  });

  factory HttpAuthorization.fromJson(Map<String, dynamic> json) {
    return HttpAuthorization(
      sigv4: json['sigv4'] != null
          ? SigV4Authorization.fromJson(json['sigv4'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sigv4 = this.sigv4;
    return {
      if (sigv4 != null) 'sigv4': sigv4,
    };
  }
}

/// Specifies the HTTP context to use for the test authorizer request.
class HttpContext {
  /// The header keys and values in an HTTP authorization request.
  final Map<String, String>? headers;

  /// The query string keys and values in an HTTP authorization request.
  final String? queryString;

  HttpContext({
    this.headers,
    this.queryString,
  });

  Map<String, dynamic> toJson() {
    final headers = this.headers;
    final queryString = this.queryString;
    return {
      if (headers != null) 'headers': headers,
      if (queryString != null) 'queryString': queryString,
    };
  }
}

/// HTTP URL destination configuration used by the topic rule's HTTP action.
class HttpUrlDestinationConfiguration {
  /// The URL IoT uses to confirm ownership of or access to the topic rule
  /// destination URL.
  final String confirmationUrl;

  HttpUrlDestinationConfiguration({
    required this.confirmationUrl,
  });

  Map<String, dynamic> toJson() {
    final confirmationUrl = this.confirmationUrl;
    return {
      'confirmationUrl': confirmationUrl,
    };
  }
}

/// HTTP URL destination properties.
class HttpUrlDestinationProperties {
  /// The URL used to confirm the HTTP topic rule destination URL.
  final String? confirmationUrl;

  HttpUrlDestinationProperties({
    this.confirmationUrl,
  });

  factory HttpUrlDestinationProperties.fromJson(Map<String, dynamic> json) {
    return HttpUrlDestinationProperties(
      confirmationUrl: json['confirmationUrl'] as String?,
    );
  }
}

/// Information about an HTTP URL destination.
class HttpUrlDestinationSummary {
  /// The URL used to confirm ownership of or access to the HTTP topic rule
  /// destination URL.
  final String? confirmationUrl;

  HttpUrlDestinationSummary({
    this.confirmationUrl,
  });

  factory HttpUrlDestinationSummary.fromJson(Map<String, dynamic> json) {
    return HttpUrlDestinationSummary(
      confirmationUrl: json['confirmationUrl'] as String?,
    );
  }
}

/// Information that implicitly denies authorization. When policy doesn't
/// explicitly deny or allow an action on a resource it is considered an
/// implicit deny.
class ImplicitDeny {
  /// Policies that don't contain a matching allow or deny statement for the
  /// specified action on the specified resource.
  final List<Policy>? policies;

  ImplicitDeny({
    this.policies,
  });

  factory ImplicitDeny.fromJson(Map<String, dynamic> json) {
    return ImplicitDeny(
      policies: (json['policies'] as List?)
          ?.nonNulls
          .map((e) => Policy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum IndexStatus {
  active('ACTIVE'),
  building('BUILDING'),
  rebuilding('REBUILDING'),
  ;

  final String value;

  const IndexStatus(this.value);

  static IndexStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum IndexStatus'));
}

/// Provides additional selections for named shadows and geolocation data.
///
/// To add named shadows to your fleet indexing configuration, set
/// <code>namedShadowIndexingMode</code> to be ON and specify your shadow names
/// in <code>namedShadowNames</code> filter.
///
/// To add geolocation data to your fleet indexing configuration:
///
/// <ul>
/// <li>
/// If you store geolocation data in a class/unnamed shadow, set
/// <code>thingIndexingMode</code> to be <code>REGISTRY_AND_SHADOW</code> and
/// specify your geolocation data in <code>geoLocations</code> filter.
/// </li>
/// <li>
/// If you store geolocation data in a named shadow, set
/// <code>namedShadowIndexingMode</code> to be <code>ON</code>, add the shadow
/// name in <code>namedShadowNames</code> filter, and specify your geolocation
/// data in <code>geoLocations</code> filter. For more information, see <a
/// href="https://docs.aws.amazon.com/iot/latest/developerguide/managing-fleet-index.html">Managing
/// fleet indexing</a>.
/// </li>
/// </ul>
class IndexingFilter {
  /// The list of geolocation targets that you select to index. The default
  /// maximum number of geolocation targets for indexing is <code>1</code>. To
  /// increase the limit, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/iot_device_management.html#fleet-indexing-limits">Amazon
  /// Web Services IoT Device Management Quotas</a> in the <i>Amazon Web Services
  /// General Reference</i>.
  final List<GeoLocationTarget>? geoLocations;

  /// The shadow names that you select to index. The default maximum number of
  /// shadow names for indexing is 10. To increase the limit, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/iot_device_management.html#fleet-indexing-limits">Amazon
  /// Web Services IoT Device Management Quotas</a> in the <i>Amazon Web Services
  /// General Reference</i>.
  final List<String>? namedShadowNames;

  IndexingFilter({
    this.geoLocations,
    this.namedShadowNames,
  });

  factory IndexingFilter.fromJson(Map<String, dynamic> json) {
    return IndexingFilter(
      geoLocations: (json['geoLocations'] as List?)
          ?.nonNulls
          .map((e) => GeoLocationTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
      namedShadowNames: (json['namedShadowNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final geoLocations = this.geoLocations;
    final namedShadowNames = this.namedShadowNames;
    return {
      if (geoLocations != null) 'geoLocations': geoLocations,
      if (namedShadowNames != null) 'namedShadowNames': namedShadowNames,
    };
  }
}

/// Sends message data to an IoT Analytics channel.
class IotAnalyticsAction {
  /// Whether to process the action as a batch. The default value is
  /// <code>false</code>.
  ///
  /// When <code>batchMode</code> is <code>true</code> and the rule SQL statement
  /// evaluates to an Array, each Array element is delivered as a separate message
  /// when passed by <a
  /// href="https://docs.aws.amazon.com/iotanalytics/latest/APIReference/API_BatchPutMessage.html">
  /// <code>BatchPutMessage</code> </a> to the IoT Analytics channel. The
  /// resulting array can't have more than 100 messages.
  final bool? batchMode;

  /// (deprecated) The ARN of the IoT Analytics channel to which message data will
  /// be sent.
  final String? channelArn;

  /// The name of the IoT Analytics channel to which message data will be sent.
  final String? channelName;

  /// The ARN of the role which has a policy that grants IoT Analytics permission
  /// to send message data via IoT Analytics (iotanalytics:BatchPutMessage).
  final String? roleArn;

  IotAnalyticsAction({
    this.batchMode,
    this.channelArn,
    this.channelName,
    this.roleArn,
  });

  factory IotAnalyticsAction.fromJson(Map<String, dynamic> json) {
    return IotAnalyticsAction(
      batchMode: json['batchMode'] as bool?,
      channelArn: json['channelArn'] as String?,
      channelName: json['channelName'] as String?,
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchMode = this.batchMode;
    final channelArn = this.channelArn;
    final channelName = this.channelName;
    final roleArn = this.roleArn;
    return {
      if (batchMode != null) 'batchMode': batchMode,
      if (channelArn != null) 'channelArn': channelArn,
      if (channelName != null) 'channelName': channelName,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// Sends an input to an IoT Events detector.
class IotEventsAction {
  /// The name of the IoT Events input.
  final String inputName;

  /// The ARN of the role that grants IoT permission to send an input to an IoT
  /// Events detector. ("Action":"iotevents:BatchPutMessage").
  final String roleArn;

  /// Whether to process the event actions as a batch. The default value is
  /// <code>false</code>.
  ///
  /// When <code>batchMode</code> is <code>true</code>, you can't specify a
  /// <code>messageId</code>.
  ///
  /// When <code>batchMode</code> is <code>true</code> and the rule SQL statement
  /// evaluates to an Array, each Array element is treated as a separate message
  /// when it's sent to IoT Events by calling <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_iotevents-data_BatchPutMessage.html">
  /// <code>BatchPutMessage</code> </a>. The resulting array can't have more than
  /// 10 messages.
  final bool? batchMode;

  /// The ID of the message. The default <code>messageId</code> is a new UUID
  /// value.
  ///
  /// When <code>batchMode</code> is <code>true</code>, you can't specify a
  /// <code>messageId</code>--a new UUID value will be assigned.
  ///
  /// Assign a value to this property to ensure that only one input (message) with
  /// a given <code>messageId</code> will be processed by an IoT Events detector.
  final String? messageId;

  IotEventsAction({
    required this.inputName,
    required this.roleArn,
    this.batchMode,
    this.messageId,
  });

  factory IotEventsAction.fromJson(Map<String, dynamic> json) {
    return IotEventsAction(
      inputName: json['inputName'] as String,
      roleArn: json['roleArn'] as String,
      batchMode: json['batchMode'] as bool?,
      messageId: json['messageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputName = this.inputName;
    final roleArn = this.roleArn;
    final batchMode = this.batchMode;
    final messageId = this.messageId;
    return {
      'inputName': inputName,
      'roleArn': roleArn,
      if (batchMode != null) 'batchMode': batchMode,
      if (messageId != null) 'messageId': messageId,
    };
  }
}

/// Describes an action to send data from an MQTT message that triggered the
/// rule to IoT SiteWise asset properties.
class IotSiteWiseAction {
  /// A list of asset property value entries.
  final List<PutAssetPropertyValueEntry> putAssetPropertyValueEntries;

  /// The ARN of the role that grants IoT permission to send an asset property
  /// value to IoT SiteWise. (<code>"Action":
  /// "iotsitewise:BatchPutAssetPropertyValue"</code>). The trust policy can
  /// restrict access to specific asset hierarchy paths.
  final String roleArn;

  IotSiteWiseAction({
    required this.putAssetPropertyValueEntries,
    required this.roleArn,
  });

  factory IotSiteWiseAction.fromJson(Map<String, dynamic> json) {
    return IotSiteWiseAction(
      putAssetPropertyValueEntries: (json['putAssetPropertyValueEntries']
              as List)
          .nonNulls
          .map((e) =>
              PutAssetPropertyValueEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: json['roleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final putAssetPropertyValueEntries = this.putAssetPropertyValueEntries;
    final roleArn = this.roleArn;
    return {
      'putAssetPropertyValueEntries': putAssetPropertyValueEntries,
      'roleArn': roleArn,
    };
  }
}

/// The certificate issuer indentifier.
class IssuerCertificateIdentifier {
  /// The issuer certificate serial number.
  final String? issuerCertificateSerialNumber;

  /// The subject of the issuer certificate.
  final String? issuerCertificateSubject;

  /// The issuer ID.
  final String? issuerId;

  IssuerCertificateIdentifier({
    this.issuerCertificateSerialNumber,
    this.issuerCertificateSubject,
    this.issuerId,
  });

  factory IssuerCertificateIdentifier.fromJson(Map<String, dynamic> json) {
    return IssuerCertificateIdentifier(
      issuerCertificateSerialNumber:
          json['issuerCertificateSerialNumber'] as String?,
      issuerCertificateSubject: json['issuerCertificateSubject'] as String?,
      issuerId: json['issuerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final issuerCertificateSerialNumber = this.issuerCertificateSerialNumber;
    final issuerCertificateSubject = this.issuerCertificateSubject;
    final issuerId = this.issuerId;
    return {
      if (issuerCertificateSerialNumber != null)
        'issuerCertificateSerialNumber': issuerCertificateSerialNumber,
      if (issuerCertificateSubject != null)
        'issuerCertificateSubject': issuerCertificateSubject,
      if (issuerId != null) 'issuerId': issuerId,
    };
  }
}

/// The <code>Job</code> object contains details about a job.
class Job {
  /// Configuration for criteria to abort the job.
  final AbortConfig? abortConfig;

  /// If the job was updated, describes the reason for the update.
  final String? comment;

  /// The time, in seconds since the epoch, when the job was completed.
  final DateTime? completedAt;

  /// The time, in seconds since the epoch, when the job was created.
  final DateTime? createdAt;

  /// A short text description of the job.
  final String? description;

  /// The package version Amazon Resource Names (ARNs) that are installed on the
  /// device when the job successfully completes. The package version must be in
  /// either the Published or Deprecated state when the job deploys. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/preparing-to-use-software-package-catalog.html#package-version-lifecycle">Package
  /// version lifecycle</a>.The package version must be in either the Published or
  /// Deprecated state when the job deploys. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/preparing-to-use-software-package-catalog.html#package-version-lifecycle">Package
  /// version lifecycle</a>.
  ///
  /// <b>Note:</b>The following Length Constraints relates to a single ARN. Up to
  /// 25 package version ARNs are allowed.
  final List<String>? destinationPackageVersions;

  /// A key-value map that pairs the patterns that need to be replaced in a
  /// managed template job document schema. You can use the description of each
  /// key as a guidance to specify the inputs during runtime when creating a job.
  /// <note>
  /// <code>documentParameters</code> can only be used when creating jobs from
  /// Amazon Web Services managed templates. This parameter can't be used with
  /// custom job templates or to create jobs from them.
  /// </note>
  final Map<String, String>? documentParameters;

  /// Will be <code>true</code> if the job was canceled with the optional
  /// <code>force</code> parameter set to <code>true</code>.
  final bool? forceCanceled;

  /// Indicates whether a job is concurrent. Will be true when a job is rolling
  /// out new job executions or canceling previously created executions, otherwise
  /// false.
  final bool? isConcurrent;

  /// An ARN identifying the job with format
  /// "arn:aws:iot:region:account:job/jobId".
  final String? jobArn;

  /// The configuration for the criteria to retry the job.
  final JobExecutionsRetryConfig? jobExecutionsRetryConfig;

  /// Allows you to create a staged rollout of a job.
  final JobExecutionsRolloutConfig? jobExecutionsRolloutConfig;

  /// The unique identifier you assigned to this job when it was created.
  final String? jobId;

  /// Details about the job process.
  final JobProcessDetails? jobProcessDetails;

  /// The ARN of the job template used to create the job.
  final String? jobTemplateArn;

  /// The time, in seconds since the epoch, when the job was last updated.
  final DateTime? lastUpdatedAt;

  /// The namespace used to indicate that a job is a customer-managed job.
  ///
  /// When you specify a value for this parameter, Amazon Web Services IoT Core
  /// sends jobs notifications to MQTT topics that contain the value in the
  /// following format.
  ///
  /// <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code>
  /// <note>
  /// The <code>namespaceId</code> feature is only supported by IoT Greengrass at
  /// this time. For more information, see <a
  /// href="https://docs.aws.amazon.com/greengrass/v2/developerguide/setting-up.html">Setting
  /// up IoT Greengrass core devices.</a>
  /// </note>
  final String? namespaceId;

  /// Configuration for pre-signed S3 URLs.
  final PresignedUrlConfig? presignedUrlConfig;

  /// If the job was updated, provides the reason code for the update.
  final String? reasonCode;

  /// Displays the next seven maintenance window occurrences and their start
  /// times.
  final List<ScheduledJobRollout>? scheduledJobRollouts;

  /// The configuration that allows you to schedule a job for a future date and
  /// time in addition to specifying the end behavior for each job execution.
  final SchedulingConfig? schedulingConfig;

  /// The status of the job, one of <code>IN_PROGRESS</code>,
  /// <code>CANCELED</code>, <code>DELETION_IN_PROGRESS</code> or
  /// <code>COMPLETED</code>.
  final JobStatus? status;

  /// Specifies whether the job will continue to run (CONTINUOUS), or will be
  /// complete after all those things specified as targets have completed the job
  /// (SNAPSHOT). If continuous, the job may also be run on a thing when a change
  /// is detected in a target. For example, a job will run on a device when the
  /// thing representing the device is added to a target group, even after the job
  /// was completed by all things originally in the group.
  /// <note>
  /// We recommend that you use continuous jobs instead of snapshot jobs for
  /// dynamic thing group targets. By using continuous jobs, devices that join the
  /// group receive the job execution even after the job has been created.
  /// </note>
  final TargetSelection? targetSelection;

  /// A list of IoT things and thing groups to which the job should be sent.
  final List<String>? targets;

  /// Specifies the amount of time each device has to finish its execution of the
  /// job. A timer is started when the job execution status is set to
  /// <code>IN_PROGRESS</code>. If the job execution status is not set to another
  /// terminal state before the timer expires, it will be automatically set to
  /// <code>TIMED_OUT</code>.
  final TimeoutConfig? timeoutConfig;

  Job({
    this.abortConfig,
    this.comment,
    this.completedAt,
    this.createdAt,
    this.description,
    this.destinationPackageVersions,
    this.documentParameters,
    this.forceCanceled,
    this.isConcurrent,
    this.jobArn,
    this.jobExecutionsRetryConfig,
    this.jobExecutionsRolloutConfig,
    this.jobId,
    this.jobProcessDetails,
    this.jobTemplateArn,
    this.lastUpdatedAt,
    this.namespaceId,
    this.presignedUrlConfig,
    this.reasonCode,
    this.scheduledJobRollouts,
    this.schedulingConfig,
    this.status,
    this.targetSelection,
    this.targets,
    this.timeoutConfig,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      abortConfig: json['abortConfig'] != null
          ? AbortConfig.fromJson(json['abortConfig'] as Map<String, dynamic>)
          : null,
      comment: json['comment'] as String?,
      completedAt: timeStampFromJson(json['completedAt']),
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      destinationPackageVersions: (json['destinationPackageVersions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      documentParameters: (json['documentParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      forceCanceled: json['forceCanceled'] as bool?,
      isConcurrent: json['isConcurrent'] as bool?,
      jobArn: json['jobArn'] as String?,
      jobExecutionsRetryConfig: json['jobExecutionsRetryConfig'] != null
          ? JobExecutionsRetryConfig.fromJson(
              json['jobExecutionsRetryConfig'] as Map<String, dynamic>)
          : null,
      jobExecutionsRolloutConfig: json['jobExecutionsRolloutConfig'] != null
          ? JobExecutionsRolloutConfig.fromJson(
              json['jobExecutionsRolloutConfig'] as Map<String, dynamic>)
          : null,
      jobId: json['jobId'] as String?,
      jobProcessDetails: json['jobProcessDetails'] != null
          ? JobProcessDetails.fromJson(
              json['jobProcessDetails'] as Map<String, dynamic>)
          : null,
      jobTemplateArn: json['jobTemplateArn'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      namespaceId: json['namespaceId'] as String?,
      presignedUrlConfig: json['presignedUrlConfig'] != null
          ? PresignedUrlConfig.fromJson(
              json['presignedUrlConfig'] as Map<String, dynamic>)
          : null,
      reasonCode: json['reasonCode'] as String?,
      scheduledJobRollouts: (json['scheduledJobRollouts'] as List?)
          ?.nonNulls
          .map((e) => ScheduledJobRollout.fromJson(e as Map<String, dynamic>))
          .toList(),
      schedulingConfig: json['schedulingConfig'] != null
          ? SchedulingConfig.fromJson(
              json['schedulingConfig'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(JobStatus.fromString),
      targetSelection:
          (json['targetSelection'] as String?)?.let(TargetSelection.fromString),
      targets:
          (json['targets'] as List?)?.nonNulls.map((e) => e as String).toList(),
      timeoutConfig: json['timeoutConfig'] != null
          ? TimeoutConfig.fromJson(
              json['timeoutConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum JobEndBehavior {
  stopRollout('STOP_ROLLOUT'),
  cancel('CANCEL'),
  forceCancel('FORCE_CANCEL'),
  ;

  final String value;

  const JobEndBehavior(this.value);

  static JobEndBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum JobEndBehavior'));
}

/// The job execution object represents the execution of a job on a particular
/// device.
class JobExecution {
  /// The estimated number of seconds that remain before the job execution status
  /// will be changed to <code>TIMED_OUT</code>. The timeout interval can be
  /// anywhere between 1 minute and 7 days (1 to 10080 minutes). The actual job
  /// execution timeout can occur up to 60 seconds later than the estimated
  /// duration. This value will not be included if the job execution has reached a
  /// terminal status.
  final int? approximateSecondsBeforeTimedOut;

  /// A string (consisting of the digits "0" through "9") which identifies this
  /// particular job execution on this particular device. It can be used in
  /// commands which return or update job execution information.
  final int? executionNumber;

  /// Will be <code>true</code> if the job execution was canceled with the
  /// optional <code>force</code> parameter set to <code>true</code>.
  final bool? forceCanceled;

  /// The unique identifier you assigned to the job when it was created.
  final String? jobId;

  /// The time, in seconds since the epoch, when the job execution was last
  /// updated.
  final DateTime? lastUpdatedAt;

  /// The time, in seconds since the epoch, when the job execution was queued.
  final DateTime? queuedAt;

  /// The time, in seconds since the epoch, when the job execution started.
  final DateTime? startedAt;

  /// The status of the job execution (IN_PROGRESS, QUEUED, FAILED, SUCCEEDED,
  /// TIMED_OUT, CANCELED, or REJECTED).
  final JobExecutionStatus? status;

  /// A collection of name/value pairs that describe the status of the job
  /// execution.
  final JobExecutionStatusDetails? statusDetails;

  /// The ARN of the thing on which the job execution is running.
  final String? thingArn;

  /// The version of the job execution. Job execution versions are incremented
  /// each time they are updated by a device.
  final int? versionNumber;

  JobExecution({
    this.approximateSecondsBeforeTimedOut,
    this.executionNumber,
    this.forceCanceled,
    this.jobId,
    this.lastUpdatedAt,
    this.queuedAt,
    this.startedAt,
    this.status,
    this.statusDetails,
    this.thingArn,
    this.versionNumber,
  });

  factory JobExecution.fromJson(Map<String, dynamic> json) {
    return JobExecution(
      approximateSecondsBeforeTimedOut:
          json['approximateSecondsBeforeTimedOut'] as int?,
      executionNumber: json['executionNumber'] as int?,
      forceCanceled: json['forceCanceled'] as bool?,
      jobId: json['jobId'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      queuedAt: timeStampFromJson(json['queuedAt']),
      startedAt: timeStampFromJson(json['startedAt']),
      status: (json['status'] as String?)?.let(JobExecutionStatus.fromString),
      statusDetails: json['statusDetails'] != null
          ? JobExecutionStatusDetails.fromJson(
              json['statusDetails'] as Map<String, dynamic>)
          : null,
      thingArn: json['thingArn'] as String?,
      versionNumber: json['versionNumber'] as int?,
    );
  }
}

enum JobExecutionFailureType {
  failed('FAILED'),
  rejected('REJECTED'),
  timedOut('TIMED_OUT'),
  all('ALL'),
  ;

  final String value;

  const JobExecutionFailureType(this.value);

  static JobExecutionFailureType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum JobExecutionFailureType'));
}

enum JobExecutionStatus {
  queued('QUEUED'),
  inProgress('IN_PROGRESS'),
  succeeded('SUCCEEDED'),
  failed('FAILED'),
  timedOut('TIMED_OUT'),
  rejected('REJECTED'),
  removed('REMOVED'),
  canceled('CANCELED'),
  ;

  final String value;

  const JobExecutionStatus(this.value);

  static JobExecutionStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum JobExecutionStatus'));
}

/// Details of the job execution status.
class JobExecutionStatusDetails {
  /// The job execution status.
  final Map<String, String>? detailsMap;

  JobExecutionStatusDetails({
    this.detailsMap,
  });

  factory JobExecutionStatusDetails.fromJson(Map<String, dynamic> json) {
    return JobExecutionStatusDetails(
      detailsMap: (json['detailsMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

/// The job execution summary.
class JobExecutionSummary {
  /// A string (consisting of the digits "0" through "9") which identifies this
  /// particular job execution on this particular device. It can be used later in
  /// commands which return or update job execution information.
  final int? executionNumber;

  /// The time, in seconds since the epoch, when the job execution was last
  /// updated.
  final DateTime? lastUpdatedAt;

  /// The time, in seconds since the epoch, when the job execution was queued.
  final DateTime? queuedAt;

  /// The number that indicates how many retry attempts have been completed for
  /// this job on this device.
  final int? retryAttempt;

  /// The time, in seconds since the epoch, when the job execution started.
  final DateTime? startedAt;

  /// The status of the job execution.
  final JobExecutionStatus? status;

  JobExecutionSummary({
    this.executionNumber,
    this.lastUpdatedAt,
    this.queuedAt,
    this.retryAttempt,
    this.startedAt,
    this.status,
  });

  factory JobExecutionSummary.fromJson(Map<String, dynamic> json) {
    return JobExecutionSummary(
      executionNumber: json['executionNumber'] as int?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      queuedAt: timeStampFromJson(json['queuedAt']),
      retryAttempt: json['retryAttempt'] as int?,
      startedAt: timeStampFromJson(json['startedAt']),
      status: (json['status'] as String?)?.let(JobExecutionStatus.fromString),
    );
  }
}

/// Contains a summary of information about job executions for a specific job.
class JobExecutionSummaryForJob {
  /// Contains a subset of information about a job execution.
  final JobExecutionSummary? jobExecutionSummary;

  /// The ARN of the thing on which the job execution is running.
  final String? thingArn;

  JobExecutionSummaryForJob({
    this.jobExecutionSummary,
    this.thingArn,
  });

  factory JobExecutionSummaryForJob.fromJson(Map<String, dynamic> json) {
    return JobExecutionSummaryForJob(
      jobExecutionSummary: json['jobExecutionSummary'] != null
          ? JobExecutionSummary.fromJson(
              json['jobExecutionSummary'] as Map<String, dynamic>)
          : null,
      thingArn: json['thingArn'] as String?,
    );
  }
}

/// The job execution summary for a thing.
class JobExecutionSummaryForThing {
  /// Contains a subset of information about a job execution.
  final JobExecutionSummary? jobExecutionSummary;

  /// The unique identifier you assigned to this job when it was created.
  final String? jobId;

  JobExecutionSummaryForThing({
    this.jobExecutionSummary,
    this.jobId,
  });

  factory JobExecutionSummaryForThing.fromJson(Map<String, dynamic> json) {
    return JobExecutionSummaryForThing(
      jobExecutionSummary: json['jobExecutionSummary'] != null
          ? JobExecutionSummary.fromJson(
              json['jobExecutionSummary'] as Map<String, dynamic>)
          : null,
      jobId: json['jobId'] as String?,
    );
  }
}

/// The configuration that determines how many retries are allowed for each
/// failure type for a job.
class JobExecutionsRetryConfig {
  /// The list of criteria that determines how many retries are allowed for each
  /// failure type for a job.
  final List<RetryCriteria> criteriaList;

  JobExecutionsRetryConfig({
    required this.criteriaList,
  });

  factory JobExecutionsRetryConfig.fromJson(Map<String, dynamic> json) {
    return JobExecutionsRetryConfig(
      criteriaList: (json['criteriaList'] as List)
          .nonNulls
          .map((e) => RetryCriteria.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final criteriaList = this.criteriaList;
    return {
      'criteriaList': criteriaList,
    };
  }
}

/// Allows you to create a staged rollout of a job.
class JobExecutionsRolloutConfig {
  /// The rate of increase for a job rollout. This parameter allows you to define
  /// an exponential rate for a job rollout.
  final ExponentialRolloutRate? exponentialRate;

  /// The maximum number of things that will be notified of a pending job, per
  /// minute. This parameter allows you to create a staged rollout.
  final int? maximumPerMinute;

  JobExecutionsRolloutConfig({
    this.exponentialRate,
    this.maximumPerMinute,
  });

  factory JobExecutionsRolloutConfig.fromJson(Map<String, dynamic> json) {
    return JobExecutionsRolloutConfig(
      exponentialRate: json['exponentialRate'] != null
          ? ExponentialRolloutRate.fromJson(
              json['exponentialRate'] as Map<String, dynamic>)
          : null,
      maximumPerMinute: json['maximumPerMinute'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final exponentialRate = this.exponentialRate;
    final maximumPerMinute = this.maximumPerMinute;
    return {
      if (exponentialRate != null) 'exponentialRate': exponentialRate,
      if (maximumPerMinute != null) 'maximumPerMinute': maximumPerMinute,
    };
  }
}

/// The job process details.
class JobProcessDetails {
  /// The number of things that cancelled the job.
  final int? numberOfCanceledThings;

  /// The number of things that failed executing the job.
  final int? numberOfFailedThings;

  /// The number of things currently executing the job.
  final int? numberOfInProgressThings;

  /// The number of things that are awaiting execution of the job.
  final int? numberOfQueuedThings;

  /// The number of things that rejected the job.
  final int? numberOfRejectedThings;

  /// The number of things that are no longer scheduled to execute the job because
  /// they have been deleted or have been removed from the group that was a target
  /// of the job.
  final int? numberOfRemovedThings;

  /// The number of things which successfully completed the job.
  final int? numberOfSucceededThings;

  /// The number of things whose job execution status is <code>TIMED_OUT</code>.
  final int? numberOfTimedOutThings;

  /// The target devices to which the job execution is being rolled out. This
  /// value will be null after the job execution has finished rolling out to all
  /// the target devices.
  final List<String>? processingTargets;

  JobProcessDetails({
    this.numberOfCanceledThings,
    this.numberOfFailedThings,
    this.numberOfInProgressThings,
    this.numberOfQueuedThings,
    this.numberOfRejectedThings,
    this.numberOfRemovedThings,
    this.numberOfSucceededThings,
    this.numberOfTimedOutThings,
    this.processingTargets,
  });

  factory JobProcessDetails.fromJson(Map<String, dynamic> json) {
    return JobProcessDetails(
      numberOfCanceledThings: json['numberOfCanceledThings'] as int?,
      numberOfFailedThings: json['numberOfFailedThings'] as int?,
      numberOfInProgressThings: json['numberOfInProgressThings'] as int?,
      numberOfQueuedThings: json['numberOfQueuedThings'] as int?,
      numberOfRejectedThings: json['numberOfRejectedThings'] as int?,
      numberOfRemovedThings: json['numberOfRemovedThings'] as int?,
      numberOfSucceededThings: json['numberOfSucceededThings'] as int?,
      numberOfTimedOutThings: json['numberOfTimedOutThings'] as int?,
      processingTargets: (json['processingTargets'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }
}

enum JobStatus {
  inProgress('IN_PROGRESS'),
  canceled('CANCELED'),
  completed('COMPLETED'),
  deletionInProgress('DELETION_IN_PROGRESS'),
  scheduled('SCHEDULED'),
  ;

  final String value;

  const JobStatus(this.value);

  static JobStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum JobStatus'));
}

/// The job summary.
class JobSummary {
  /// The time, in seconds since the epoch, when the job completed.
  final DateTime? completedAt;

  /// The time, in seconds since the epoch, when the job was created.
  final DateTime? createdAt;

  /// Indicates whether a job is concurrent. Will be true when a job is rolling
  /// out new job executions or canceling previously created executions, otherwise
  /// false.
  final bool? isConcurrent;

  /// The job ARN.
  final String? jobArn;

  /// The unique identifier you assigned to this job when it was created.
  final String? jobId;

  /// The time, in seconds since the epoch, when the job was last updated.
  final DateTime? lastUpdatedAt;

  /// The job summary status.
  final JobStatus? status;

  /// Specifies whether the job will continue to run (CONTINUOUS), or will be
  /// complete after all those things specified as targets have completed the job
  /// (SNAPSHOT). If continuous, the job may also be run on a thing when a change
  /// is detected in a target. For example, a job will run on a thing when the
  /// thing is added to a target group, even after the job was completed by all
  /// things originally in the group.
  /// <note>
  /// We recommend that you use continuous jobs instead of snapshot jobs for
  /// dynamic thing group targets. By using continuous jobs, devices that join the
  /// group receive the job execution even after the job has been created.
  /// </note>
  final TargetSelection? targetSelection;

  /// The ID of the thing group.
  final String? thingGroupId;

  JobSummary({
    this.completedAt,
    this.createdAt,
    this.isConcurrent,
    this.jobArn,
    this.jobId,
    this.lastUpdatedAt,
    this.status,
    this.targetSelection,
    this.thingGroupId,
  });

  factory JobSummary.fromJson(Map<String, dynamic> json) {
    return JobSummary(
      completedAt: timeStampFromJson(json['completedAt']),
      createdAt: timeStampFromJson(json['createdAt']),
      isConcurrent: json['isConcurrent'] as bool?,
      jobArn: json['jobArn'] as String?,
      jobId: json['jobId'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      status: (json['status'] as String?)?.let(JobStatus.fromString),
      targetSelection:
          (json['targetSelection'] as String?)?.let(TargetSelection.fromString),
      thingGroupId: json['thingGroupId'] as String?,
    );
  }
}

/// An object that contains information about the job template.
class JobTemplateSummary {
  /// The time, in seconds since the epoch, when the job template was created.
  final DateTime? createdAt;

  /// A description of the job template.
  final String? description;

  /// The ARN of the job template.
  final String? jobTemplateArn;

  /// The unique identifier of the job template.
  final String? jobTemplateId;

  JobTemplateSummary({
    this.createdAt,
    this.description,
    this.jobTemplateArn,
    this.jobTemplateId,
  });

  factory JobTemplateSummary.fromJson(Map<String, dynamic> json) {
    return JobTemplateSummary(
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      jobTemplateArn: json['jobTemplateArn'] as String?,
      jobTemplateId: json['jobTemplateId'] as String?,
    );
  }
}

/// Send messages to an Amazon Managed Streaming for Apache Kafka (Amazon MSK)
/// or self-managed Apache Kafka cluster.
class KafkaAction {
  /// Properties of the Apache Kafka producer client.
  final Map<String, String> clientProperties;

  /// The ARN of Kafka action's VPC <code>TopicRuleDestination</code>.
  final String destinationArn;

  /// The Kafka topic for messages to be sent to the Kafka broker.
  final String topic;

  /// The list of Kafka headers that you specify.
  final List<KafkaActionHeader>? headers;

  /// The Kafka message key.
  final String? key;

  /// The Kafka message partition.
  final String? partition;

  KafkaAction({
    required this.clientProperties,
    required this.destinationArn,
    required this.topic,
    this.headers,
    this.key,
    this.partition,
  });

  factory KafkaAction.fromJson(Map<String, dynamic> json) {
    return KafkaAction(
      clientProperties: (json['clientProperties'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      destinationArn: json['destinationArn'] as String,
      topic: json['topic'] as String,
      headers: (json['headers'] as List?)
          ?.nonNulls
          .map((e) => KafkaActionHeader.fromJson(e as Map<String, dynamic>))
          .toList(),
      key: json['key'] as String?,
      partition: json['partition'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientProperties = this.clientProperties;
    final destinationArn = this.destinationArn;
    final topic = this.topic;
    final headers = this.headers;
    final key = this.key;
    final partition = this.partition;
    return {
      'clientProperties': clientProperties,
      'destinationArn': destinationArn,
      'topic': topic,
      if (headers != null) 'headers': headers,
      if (key != null) 'key': key,
      if (partition != null) 'partition': partition,
    };
  }
}

/// Specifies a Kafka header using key-value pairs when you create a Rule’s
/// Kafka Action. You can use these headers to route data from IoT clients to
/// downstream Kafka clusters without modifying your message payload.
///
/// For more information about Rule's Kafka action, see <a
/// href="https://docs.aws.amazon.com/iot/latest/developerguide/apache-kafka-rule-action.html">Apache
/// Kafka</a>.
class KafkaActionHeader {
  /// The key of the Kafka header.
  final String key;

  /// The value of the Kafka header.
  final String value;

  KafkaActionHeader({
    required this.key,
    required this.value,
  });

  factory KafkaActionHeader.fromJson(Map<String, dynamic> json) {
    return KafkaActionHeader(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// Describes a key pair.
class KeyPair {
  /// The private key.
  final String? privateKey;

  /// The public key.
  final String? publicKey;

  KeyPair({
    this.privateKey,
    this.publicKey,
  });

  factory KeyPair.fromJson(Map<String, dynamic> json) {
    return KeyPair(
      privateKey: json['PrivateKey'] as String?,
      publicKey: json['PublicKey'] as String?,
    );
  }
}

/// Describes an action to write data to an Amazon Kinesis stream.
class KinesisAction {
  /// The ARN of the IAM role that grants access to the Amazon Kinesis stream.
  final String roleArn;

  /// The name of the Amazon Kinesis stream.
  final String streamName;

  /// The partition key.
  final String? partitionKey;

  KinesisAction({
    required this.roleArn,
    required this.streamName,
    this.partitionKey,
  });

  factory KinesisAction.fromJson(Map<String, dynamic> json) {
    return KinesisAction(
      roleArn: json['roleArn'] as String,
      streamName: json['streamName'] as String,
      partitionKey: json['partitionKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final streamName = this.streamName;
    final partitionKey = this.partitionKey;
    return {
      'roleArn': roleArn,
      'streamName': streamName,
      if (partitionKey != null) 'partitionKey': partitionKey,
    };
  }
}

/// Describes an action to invoke a Lambda function.
class LambdaAction {
  /// The ARN of the Lambda function.
  final String functionArn;

  LambdaAction({
    required this.functionArn,
  });

  factory LambdaAction.fromJson(Map<String, dynamic> json) {
    return LambdaAction(
      functionArn: json['functionArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final functionArn = this.functionArn;
    return {
      'functionArn': functionArn,
    };
  }
}

class ListActiveViolationsResponse {
  /// The list of active violations.
  final List<ActiveViolation>? activeViolations;

  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  final String? nextToken;

  ListActiveViolationsResponse({
    this.activeViolations,
    this.nextToken,
  });

  factory ListActiveViolationsResponse.fromJson(Map<String, dynamic> json) {
    return ListActiveViolationsResponse(
      activeViolations: (json['activeViolations'] as List?)
          ?.nonNulls
          .map((e) => ActiveViolation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListAttachedPoliciesResponse {
  /// The token to retrieve the next set of results, or ``null`` if there are no
  /// more results.
  final String? nextMarker;

  /// The policies.
  final List<Policy>? policies;

  ListAttachedPoliciesResponse({
    this.nextMarker,
    this.policies,
  });

  factory ListAttachedPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListAttachedPoliciesResponse(
      nextMarker: json['nextMarker'] as String?,
      policies: (json['policies'] as List?)
          ?.nonNulls
          .map((e) => Policy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListAuditFindingsResponse {
  /// The findings (results) of the audit.
  final List<AuditFinding>? findings;

  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  final String? nextToken;

  ListAuditFindingsResponse({
    this.findings,
    this.nextToken,
  });

  factory ListAuditFindingsResponse.fromJson(Map<String, dynamic> json) {
    return ListAuditFindingsResponse(
      findings: (json['findings'] as List?)
          ?.nonNulls
          .map((e) => AuditFinding.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListAuditMitigationActionsExecutionsResponse {
  /// A set of task execution results based on the input parameters. Details
  /// include the mitigation action applied, start time, and task status.
  final List<AuditMitigationActionExecutionMetadata>? actionsExecutions;

  /// The token for the next set of results.
  final String? nextToken;

  ListAuditMitigationActionsExecutionsResponse({
    this.actionsExecutions,
    this.nextToken,
  });

  factory ListAuditMitigationActionsExecutionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAuditMitigationActionsExecutionsResponse(
      actionsExecutions: (json['actionsExecutions'] as List?)
          ?.nonNulls
          .map((e) => AuditMitigationActionExecutionMetadata.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListAuditMitigationActionsTasksResponse {
  /// The token for the next set of results.
  final String? nextToken;

  /// The collection of audit mitigation tasks that matched the filter criteria.
  final List<AuditMitigationActionsTaskMetadata>? tasks;

  ListAuditMitigationActionsTasksResponse({
    this.nextToken,
    this.tasks,
  });

  factory ListAuditMitigationActionsTasksResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAuditMitigationActionsTasksResponse(
      nextToken: json['nextToken'] as String?,
      tasks: (json['tasks'] as List?)
          ?.nonNulls
          .map((e) => AuditMitigationActionsTaskMetadata.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListAuditSuppressionsResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  final String? nextToken;

  /// List of audit suppressions.
  final List<AuditSuppression>? suppressions;

  ListAuditSuppressionsResponse({
    this.nextToken,
    this.suppressions,
  });

  factory ListAuditSuppressionsResponse.fromJson(Map<String, dynamic> json) {
    return ListAuditSuppressionsResponse(
      nextToken: json['nextToken'] as String?,
      suppressions: (json['suppressions'] as List?)
          ?.nonNulls
          .map((e) => AuditSuppression.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListAuditTasksResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  final String? nextToken;

  /// The audits that were performed during the specified time period.
  final List<AuditTaskMetadata>? tasks;

  ListAuditTasksResponse({
    this.nextToken,
    this.tasks,
  });

  factory ListAuditTasksResponse.fromJson(Map<String, dynamic> json) {
    return ListAuditTasksResponse(
      nextToken: json['nextToken'] as String?,
      tasks: (json['tasks'] as List?)
          ?.nonNulls
          .map((e) => AuditTaskMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListAuthorizersResponse {
  /// The authorizers.
  final List<AuthorizerSummary>? authorizers;

  /// A marker used to get the next set of results.
  final String? nextMarker;

  ListAuthorizersResponse({
    this.authorizers,
    this.nextMarker,
  });

  factory ListAuthorizersResponse.fromJson(Map<String, dynamic> json) {
    return ListAuthorizersResponse(
      authorizers: (json['authorizers'] as List?)
          ?.nonNulls
          .map((e) => AuthorizerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['nextMarker'] as String?,
    );
  }
}

class ListBillingGroupsResponse {
  /// The list of billing groups.
  final List<GroupNameAndArn>? billingGroups;

  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  ListBillingGroupsResponse({
    this.billingGroups,
    this.nextToken,
  });

  factory ListBillingGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListBillingGroupsResponse(
      billingGroups: (json['billingGroups'] as List?)
          ?.nonNulls
          .map((e) => GroupNameAndArn.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

/// The output from the ListCACertificates operation.
class ListCACertificatesResponse {
  /// The CA certificates registered in your Amazon Web Services account.
  final List<CACertificate>? certificates;

  /// The current position within the list of CA certificates.
  final String? nextMarker;

  ListCACertificatesResponse({
    this.certificates,
    this.nextMarker,
  });

  factory ListCACertificatesResponse.fromJson(Map<String, dynamic> json) {
    return ListCACertificatesResponse(
      certificates: (json['certificates'] as List?)
          ?.nonNulls
          .map((e) => CACertificate.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['nextMarker'] as String?,
    );
  }
}

class ListCertificateProvidersResponse {
  /// The list of certificate providers in your Amazon Web Services account.
  final List<CertificateProviderSummary>? certificateProviders;

  /// The token for the next set of results, or <code>null</code> if there are no
  /// more results.
  final String? nextToken;

  ListCertificateProvidersResponse({
    this.certificateProviders,
    this.nextToken,
  });

  factory ListCertificateProvidersResponse.fromJson(Map<String, dynamic> json) {
    return ListCertificateProvidersResponse(
      certificateProviders: (json['certificateProviders'] as List?)
          ?.nonNulls
          .map((e) =>
              CertificateProviderSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

/// The output of the ListCertificatesByCA operation.
class ListCertificatesByCAResponse {
  /// The device certificates signed by the specified CA certificate.
  final List<Certificate>? certificates;

  /// The marker for the next set of results, or null if there are no additional
  /// results.
  final String? nextMarker;

  ListCertificatesByCAResponse({
    this.certificates,
    this.nextMarker,
  });

  factory ListCertificatesByCAResponse.fromJson(Map<String, dynamic> json) {
    return ListCertificatesByCAResponse(
      certificates: (json['certificates'] as List?)
          ?.nonNulls
          .map((e) => Certificate.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['nextMarker'] as String?,
    );
  }
}

/// The output of the ListCertificates operation.
class ListCertificatesResponse {
  /// The descriptions of the certificates.
  final List<Certificate>? certificates;

  /// The marker for the next set of results, or null if there are no additional
  /// results.
  final String? nextMarker;

  ListCertificatesResponse({
    this.certificates,
    this.nextMarker,
  });

  factory ListCertificatesResponse.fromJson(Map<String, dynamic> json) {
    return ListCertificatesResponse(
      certificates: (json['certificates'] as List?)
          ?.nonNulls
          .map((e) => Certificate.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['nextMarker'] as String?,
    );
  }
}

class ListCustomMetricsResponse {
  /// The name of the custom metric.
  final List<String>? metricNames;

  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  final String? nextToken;

  ListCustomMetricsResponse({
    this.metricNames,
    this.nextToken,
  });

  factory ListCustomMetricsResponse.fromJson(Map<String, dynamic> json) {
    return ListCustomMetricsResponse(
      metricNames: (json['metricNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListDetectMitigationActionsExecutionsResponse {
  /// List of actions executions.
  final List<DetectMitigationActionExecution>? actionsExecutions;

  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  final String? nextToken;

  ListDetectMitigationActionsExecutionsResponse({
    this.actionsExecutions,
    this.nextToken,
  });

  factory ListDetectMitigationActionsExecutionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDetectMitigationActionsExecutionsResponse(
      actionsExecutions: (json['actionsExecutions'] as List?)
          ?.nonNulls
          .map((e) => DetectMitigationActionExecution.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListDetectMitigationActionsTasksResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  final String? nextToken;

  /// The collection of ML Detect mitigation tasks that matched the filter
  /// criteria.
  final List<DetectMitigationActionsTaskSummary>? tasks;

  ListDetectMitigationActionsTasksResponse({
    this.nextToken,
    this.tasks,
  });

  factory ListDetectMitigationActionsTasksResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDetectMitigationActionsTasksResponse(
      nextToken: json['nextToken'] as String?,
      tasks: (json['tasks'] as List?)
          ?.nonNulls
          .map((e) => DetectMitigationActionsTaskSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListDimensionsResponse {
  /// A list of the names of the defined dimensions. Use
  /// <code>DescribeDimension</code> to get details for a dimension.
  final List<String>? dimensionNames;

  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  final String? nextToken;

  ListDimensionsResponse({
    this.dimensionNames,
    this.nextToken,
  });

  factory ListDimensionsResponse.fromJson(Map<String, dynamic> json) {
    return ListDimensionsResponse(
      dimensionNames: (json['dimensionNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListDomainConfigurationsResponse {
  /// A list of objects that contain summary information about the user's domain
  /// configurations.
  final List<DomainConfigurationSummary>? domainConfigurations;

  /// The marker for the next set of results.
  final String? nextMarker;

  ListDomainConfigurationsResponse({
    this.domainConfigurations,
    this.nextMarker,
  });

  factory ListDomainConfigurationsResponse.fromJson(Map<String, dynamic> json) {
    return ListDomainConfigurationsResponse(
      domainConfigurations: (json['domainConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              DomainConfigurationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['nextMarker'] as String?,
    );
  }
}

class ListFleetMetricsResponse {
  /// The list of fleet metrics objects.
  final List<FleetMetricNameAndArn>? fleetMetrics;

  /// The token for the next set of results. Will not be returned if the operation
  /// has returned all results.
  final String? nextToken;

  ListFleetMetricsResponse({
    this.fleetMetrics,
    this.nextToken,
  });

  factory ListFleetMetricsResponse.fromJson(Map<String, dynamic> json) {
    return ListFleetMetricsResponse(
      fleetMetrics: (json['fleetMetrics'] as List?)
          ?.nonNulls
          .map((e) => FleetMetricNameAndArn.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListIndicesResponse {
  /// The index names.
  final List<String>? indexNames;

  /// The token used to get the next set of results, or <code>null</code> if there
  /// are no additional results.
  final String? nextToken;

  ListIndicesResponse({
    this.indexNames,
    this.nextToken,
  });

  factory ListIndicesResponse.fromJson(Map<String, dynamic> json) {
    return ListIndicesResponse(
      indexNames: (json['indexNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListJobExecutionsForJobResponse {
  /// A list of job execution summaries.
  final List<JobExecutionSummaryForJob>? executionSummaries;

  /// The token for the next set of results, or <b>null</b> if there are no
  /// additional results.
  final String? nextToken;

  ListJobExecutionsForJobResponse({
    this.executionSummaries,
    this.nextToken,
  });

  factory ListJobExecutionsForJobResponse.fromJson(Map<String, dynamic> json) {
    return ListJobExecutionsForJobResponse(
      executionSummaries: (json['executionSummaries'] as List?)
          ?.nonNulls
          .map((e) =>
              JobExecutionSummaryForJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListJobExecutionsForThingResponse {
  /// A list of job execution summaries.
  final List<JobExecutionSummaryForThing>? executionSummaries;

  /// The token for the next set of results, or <b>null</b> if there are no
  /// additional results.
  final String? nextToken;

  ListJobExecutionsForThingResponse({
    this.executionSummaries,
    this.nextToken,
  });

  factory ListJobExecutionsForThingResponse.fromJson(
      Map<String, dynamic> json) {
    return ListJobExecutionsForThingResponse(
      executionSummaries: (json['executionSummaries'] as List?)
          ?.nonNulls
          .map((e) =>
              JobExecutionSummaryForThing.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListJobTemplatesResponse {
  /// A list of objects that contain information about the job templates.
  final List<JobTemplateSummary>? jobTemplates;

  /// The token for the next set of results, or <b>null</b> if there are no
  /// additional results.
  final String? nextToken;

  ListJobTemplatesResponse({
    this.jobTemplates,
    this.nextToken,
  });

  factory ListJobTemplatesResponse.fromJson(Map<String, dynamic> json) {
    return ListJobTemplatesResponse(
      jobTemplates: (json['jobTemplates'] as List?)
          ?.nonNulls
          .map((e) => JobTemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListJobsResponse {
  /// A list of jobs.
  final List<JobSummary>? jobs;

  /// The token for the next set of results, or <b>null</b> if there are no
  /// additional results.
  final String? nextToken;

  ListJobsResponse({
    this.jobs,
    this.nextToken,
  });

  factory ListJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListJobsResponse(
      jobs: (json['jobs'] as List?)
          ?.nonNulls
          .map((e) => JobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListManagedJobTemplatesResponse {
  /// A list of managed job templates that are returned.
  final List<ManagedJobTemplateSummary>? managedJobTemplates;

  /// The token to retrieve the next set of results.
  final String? nextToken;

  ListManagedJobTemplatesResponse({
    this.managedJobTemplates,
    this.nextToken,
  });

  factory ListManagedJobTemplatesResponse.fromJson(Map<String, dynamic> json) {
    return ListManagedJobTemplatesResponse(
      managedJobTemplates: (json['managedJobTemplates'] as List?)
          ?.nonNulls
          .map((e) =>
              ManagedJobTemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListMetricValuesResponse {
  /// The data the thing reports for the metric during the specified time period.
  final List<MetricDatum>? metricDatumList;

  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  final String? nextToken;

  ListMetricValuesResponse({
    this.metricDatumList,
    this.nextToken,
  });

  factory ListMetricValuesResponse.fromJson(Map<String, dynamic> json) {
    return ListMetricValuesResponse(
      metricDatumList: (json['metricDatumList'] as List?)
          ?.nonNulls
          .map((e) => MetricDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListMitigationActionsResponse {
  /// A set of actions that matched the specified filter criteria.
  final List<MitigationActionIdentifier>? actionIdentifiers;

  /// The token for the next set of results.
  final String? nextToken;

  ListMitigationActionsResponse({
    this.actionIdentifiers,
    this.nextToken,
  });

  factory ListMitigationActionsResponse.fromJson(Map<String, dynamic> json) {
    return ListMitigationActionsResponse(
      actionIdentifiers: (json['actionIdentifiers'] as List?)
          ?.nonNulls
          .map((e) =>
              MitigationActionIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListOTAUpdatesResponse {
  /// A token to use to get the next set of results.
  final String? nextToken;

  /// A list of OTA update jobs.
  final List<OTAUpdateSummary>? otaUpdates;

  ListOTAUpdatesResponse({
    this.nextToken,
    this.otaUpdates,
  });

  factory ListOTAUpdatesResponse.fromJson(Map<String, dynamic> json) {
    return ListOTAUpdatesResponse(
      nextToken: json['nextToken'] as String?,
      otaUpdates: (json['otaUpdates'] as List?)
          ?.nonNulls
          .map((e) => OTAUpdateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The output from the ListOutgoingCertificates operation.
class ListOutgoingCertificatesResponse {
  /// The marker for the next set of results.
  final String? nextMarker;

  /// The certificates that are being transferred but not yet accepted.
  final List<OutgoingCertificate>? outgoingCertificates;

  ListOutgoingCertificatesResponse({
    this.nextMarker,
    this.outgoingCertificates,
  });

  factory ListOutgoingCertificatesResponse.fromJson(Map<String, dynamic> json) {
    return ListOutgoingCertificatesResponse(
      nextMarker: json['nextMarker'] as String?,
      outgoingCertificates: (json['outgoingCertificates'] as List?)
          ?.nonNulls
          .map((e) => OutgoingCertificate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListPackageVersionsResponse {
  /// The token for the next set of results.
  final String? nextToken;

  /// Lists the package versions associated to the package.
  final List<PackageVersionSummary>? packageVersionSummaries;

  ListPackageVersionsResponse({
    this.nextToken,
    this.packageVersionSummaries,
  });

  factory ListPackageVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListPackageVersionsResponse(
      nextToken: json['nextToken'] as String?,
      packageVersionSummaries: (json['packageVersionSummaries'] as List?)
          ?.nonNulls
          .map((e) => PackageVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListPackagesResponse {
  /// The token for the next set of results.
  final String? nextToken;

  /// The software package summary.
  final List<PackageSummary>? packageSummaries;

  ListPackagesResponse({
    this.nextToken,
    this.packageSummaries,
  });

  factory ListPackagesResponse.fromJson(Map<String, dynamic> json) {
    return ListPackagesResponse(
      nextToken: json['nextToken'] as String?,
      packageSummaries: (json['packageSummaries'] as List?)
          ?.nonNulls
          .map((e) => PackageSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The output from the ListPolicies operation.
class ListPoliciesResponse {
  /// The marker for the next set of results, or null if there are no additional
  /// results.
  final String? nextMarker;

  /// The descriptions of the policies.
  final List<Policy>? policies;

  ListPoliciesResponse({
    this.nextMarker,
    this.policies,
  });

  factory ListPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListPoliciesResponse(
      nextMarker: json['nextMarker'] as String?,
      policies: (json['policies'] as List?)
          ?.nonNulls
          .map((e) => Policy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The output from the ListPolicyPrincipals operation.
class ListPolicyPrincipalsResponse {
  /// The marker for the next set of results, or null if there are no additional
  /// results.
  final String? nextMarker;

  /// The descriptions of the principals.
  final List<String>? principals;

  ListPolicyPrincipalsResponse({
    this.nextMarker,
    this.principals,
  });

  factory ListPolicyPrincipalsResponse.fromJson(Map<String, dynamic> json) {
    return ListPolicyPrincipalsResponse(
      nextMarker: json['nextMarker'] as String?,
      principals: (json['principals'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }
}

/// The output from the ListPolicyVersions operation.
class ListPolicyVersionsResponse {
  /// The policy versions.
  final List<PolicyVersion>? policyVersions;

  ListPolicyVersionsResponse({
    this.policyVersions,
  });

  factory ListPolicyVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListPolicyVersionsResponse(
      policyVersions: (json['policyVersions'] as List?)
          ?.nonNulls
          .map((e) => PolicyVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The output from the ListPrincipalPolicies operation.
class ListPrincipalPoliciesResponse {
  /// The marker for the next set of results, or null if there are no additional
  /// results.
  final String? nextMarker;

  /// The policies.
  final List<Policy>? policies;

  ListPrincipalPoliciesResponse({
    this.nextMarker,
    this.policies,
  });

  factory ListPrincipalPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListPrincipalPoliciesResponse(
      nextMarker: json['nextMarker'] as String?,
      policies: (json['policies'] as List?)
          ?.nonNulls
          .map((e) => Policy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The output from the ListPrincipalThings operation.
class ListPrincipalThingsResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  /// The things.
  final List<String>? things;

  ListPrincipalThingsResponse({
    this.nextToken,
    this.things,
  });

  factory ListPrincipalThingsResponse.fromJson(Map<String, dynamic> json) {
    return ListPrincipalThingsResponse(
      nextToken: json['nextToken'] as String?,
      things:
          (json['things'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }
}

class ListProvisioningTemplateVersionsResponse {
  /// A token to retrieve the next set of results.
  final String? nextToken;

  /// The list of provisioning template versions.
  final List<ProvisioningTemplateVersionSummary>? versions;

  ListProvisioningTemplateVersionsResponse({
    this.nextToken,
    this.versions,
  });

  factory ListProvisioningTemplateVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListProvisioningTemplateVersionsResponse(
      nextToken: json['nextToken'] as String?,
      versions: (json['versions'] as List?)
          ?.nonNulls
          .map((e) => ProvisioningTemplateVersionSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListProvisioningTemplatesResponse {
  /// A token to retrieve the next set of results.
  final String? nextToken;

  /// A list of provisioning templates
  final List<ProvisioningTemplateSummary>? templates;

  ListProvisioningTemplatesResponse({
    this.nextToken,
    this.templates,
  });

  factory ListProvisioningTemplatesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListProvisioningTemplatesResponse(
      nextToken: json['nextToken'] as String?,
      templates: (json['templates'] as List?)
          ?.nonNulls
          .map((e) =>
              ProvisioningTemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListRelatedResourcesForAuditFindingResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> for the first API call.
  final String? nextToken;

  /// The related resources.
  final List<RelatedResource>? relatedResources;

  ListRelatedResourcesForAuditFindingResponse({
    this.nextToken,
    this.relatedResources,
  });

  factory ListRelatedResourcesForAuditFindingResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRelatedResourcesForAuditFindingResponse(
      nextToken: json['nextToken'] as String?,
      relatedResources: (json['relatedResources'] as List?)
          ?.nonNulls
          .map((e) => RelatedResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListRoleAliasesResponse {
  /// A marker used to get the next set of results.
  final String? nextMarker;

  /// The role aliases.
  final List<String>? roleAliases;

  ListRoleAliasesResponse({
    this.nextMarker,
    this.roleAliases,
  });

  factory ListRoleAliasesResponse.fromJson(Map<String, dynamic> json) {
    return ListRoleAliasesResponse(
      nextMarker: json['nextMarker'] as String?,
      roleAliases: (json['roleAliases'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }
}

class ListScheduledAuditsResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  final String? nextToken;

  /// The list of scheduled audits.
  final List<ScheduledAuditMetadata>? scheduledAudits;

  ListScheduledAuditsResponse({
    this.nextToken,
    this.scheduledAudits,
  });

  factory ListScheduledAuditsResponse.fromJson(Map<String, dynamic> json) {
    return ListScheduledAuditsResponse(
      nextToken: json['nextToken'] as String?,
      scheduledAudits: (json['scheduledAudits'] as List?)
          ?.nonNulls
          .map(
              (e) => ScheduledAuditMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListSecurityProfilesForTargetResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  final String? nextToken;

  /// A list of security profiles and their associated targets.
  final List<SecurityProfileTargetMapping>? securityProfileTargetMappings;

  ListSecurityProfilesForTargetResponse({
    this.nextToken,
    this.securityProfileTargetMappings,
  });

  factory ListSecurityProfilesForTargetResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSecurityProfilesForTargetResponse(
      nextToken: json['nextToken'] as String?,
      securityProfileTargetMappings: (json['securityProfileTargetMappings']
              as List?)
          ?.nonNulls
          .map((e) =>
              SecurityProfileTargetMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListSecurityProfilesResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  final String? nextToken;

  /// A list of security profile identifiers (names and ARNs).
  final List<SecurityProfileIdentifier>? securityProfileIdentifiers;

  ListSecurityProfilesResponse({
    this.nextToken,
    this.securityProfileIdentifiers,
  });

  factory ListSecurityProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListSecurityProfilesResponse(
      nextToken: json['nextToken'] as String?,
      securityProfileIdentifiers: (json['securityProfileIdentifiers'] as List?)
          ?.nonNulls
          .map((e) =>
              SecurityProfileIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListStreamsResponse {
  /// A token used to get the next set of results.
  final String? nextToken;

  /// A list of streams.
  final List<StreamSummary>? streams;

  ListStreamsResponse({
    this.nextToken,
    this.streams,
  });

  factory ListStreamsResponse.fromJson(Map<String, dynamic> json) {
    return ListStreamsResponse(
      nextToken: json['nextToken'] as String?,
      streams: (json['streams'] as List?)
          ?.nonNulls
          .map((e) => StreamSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListTagsForResourceResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  /// The list of tags assigned to the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextToken: json['nextToken'] as String?,
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListTargetsForPolicyResponse {
  /// A marker used to get the next set of results.
  final String? nextMarker;

  /// The policy targets.
  final List<String>? targets;

  ListTargetsForPolicyResponse({
    this.nextMarker,
    this.targets,
  });

  factory ListTargetsForPolicyResponse.fromJson(Map<String, dynamic> json) {
    return ListTargetsForPolicyResponse(
      nextMarker: json['nextMarker'] as String?,
      targets:
          (json['targets'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }
}

class ListTargetsForSecurityProfileResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  final String? nextToken;

  /// The thing groups to which the security profile is attached.
  final List<SecurityProfileTarget>? securityProfileTargets;

  ListTargetsForSecurityProfileResponse({
    this.nextToken,
    this.securityProfileTargets,
  });

  factory ListTargetsForSecurityProfileResponse.fromJson(
      Map<String, dynamic> json) {
    return ListTargetsForSecurityProfileResponse(
      nextToken: json['nextToken'] as String?,
      securityProfileTargets: (json['securityProfileTargets'] as List?)
          ?.nonNulls
          .map((e) => SecurityProfileTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListThingGroupsForThingResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  /// The thing groups.
  final List<GroupNameAndArn>? thingGroups;

  ListThingGroupsForThingResponse({
    this.nextToken,
    this.thingGroups,
  });

  factory ListThingGroupsForThingResponse.fromJson(Map<String, dynamic> json) {
    return ListThingGroupsForThingResponse(
      nextToken: json['nextToken'] as String?,
      thingGroups: (json['thingGroups'] as List?)
          ?.nonNulls
          .map((e) => GroupNameAndArn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListThingGroupsResponse {
  /// The token to use to get the next set of results. Will not be returned if
  /// operation has returned all results.
  final String? nextToken;

  /// The thing groups.
  final List<GroupNameAndArn>? thingGroups;

  ListThingGroupsResponse({
    this.nextToken,
    this.thingGroups,
  });

  factory ListThingGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListThingGroupsResponse(
      nextToken: json['nextToken'] as String?,
      thingGroups: (json['thingGroups'] as List?)
          ?.nonNulls
          .map((e) => GroupNameAndArn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The output from the ListThingPrincipals operation.
class ListThingPrincipalsResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  /// The principals associated with the thing.
  final List<String>? principals;

  ListThingPrincipalsResponse({
    this.nextToken,
    this.principals,
  });

  factory ListThingPrincipalsResponse.fromJson(Map<String, dynamic> json) {
    return ListThingPrincipalsResponse(
      nextToken: json['nextToken'] as String?,
      principals: (json['principals'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }
}

class ListThingRegistrationTaskReportsResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  /// The type of task report.
  final ReportType? reportType;

  /// Links to the task resources.
  final List<String>? resourceLinks;

  ListThingRegistrationTaskReportsResponse({
    this.nextToken,
    this.reportType,
    this.resourceLinks,
  });

  factory ListThingRegistrationTaskReportsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListThingRegistrationTaskReportsResponse(
      nextToken: json['nextToken'] as String?,
      reportType: (json['reportType'] as String?)?.let(ReportType.fromString),
      resourceLinks: (json['resourceLinks'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }
}

class ListThingRegistrationTasksResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  /// A list of bulk thing provisioning task IDs.
  final List<String>? taskIds;

  ListThingRegistrationTasksResponse({
    this.nextToken,
    this.taskIds,
  });

  factory ListThingRegistrationTasksResponse.fromJson(
      Map<String, dynamic> json) {
    return ListThingRegistrationTasksResponse(
      nextToken: json['nextToken'] as String?,
      taskIds:
          (json['taskIds'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }
}

/// The output for the ListThingTypes operation.
class ListThingTypesResponse {
  /// The token for the next set of results. Will not be returned if operation has
  /// returned all results.
  final String? nextToken;

  /// The thing types.
  final List<ThingTypeDefinition>? thingTypes;

  ListThingTypesResponse({
    this.nextToken,
    this.thingTypes,
  });

  factory ListThingTypesResponse.fromJson(Map<String, dynamic> json) {
    return ListThingTypesResponse(
      nextToken: json['nextToken'] as String?,
      thingTypes: (json['thingTypes'] as List?)
          ?.nonNulls
          .map((e) => ThingTypeDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListThingsInBillingGroupResponse {
  /// The token to use to get the next set of results. Will not be returned if
  /// operation has returned all results.
  final String? nextToken;

  /// A list of things in the billing group.
  final List<String>? things;

  ListThingsInBillingGroupResponse({
    this.nextToken,
    this.things,
  });

  factory ListThingsInBillingGroupResponse.fromJson(Map<String, dynamic> json) {
    return ListThingsInBillingGroupResponse(
      nextToken: json['nextToken'] as String?,
      things:
          (json['things'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }
}

class ListThingsInThingGroupResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  /// The things in the specified thing group.
  final List<String>? things;

  ListThingsInThingGroupResponse({
    this.nextToken,
    this.things,
  });

  factory ListThingsInThingGroupResponse.fromJson(Map<String, dynamic> json) {
    return ListThingsInThingGroupResponse(
      nextToken: json['nextToken'] as String?,
      things:
          (json['things'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }
}

/// The output from the ListThings operation.
class ListThingsResponse {
  /// The token to use to get the next set of results. Will not be returned if
  /// operation has returned all results.
  final String? nextToken;

  /// The things.
  final List<ThingAttribute>? things;

  ListThingsResponse({
    this.nextToken,
    this.things,
  });

  factory ListThingsResponse.fromJson(Map<String, dynamic> json) {
    return ListThingsResponse(
      nextToken: json['nextToken'] as String?,
      things: (json['things'] as List?)
          ?.nonNulls
          .map((e) => ThingAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListTopicRuleDestinationsResponse {
  /// Information about a topic rule destination.
  final List<TopicRuleDestinationSummary>? destinationSummaries;

  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  ListTopicRuleDestinationsResponse({
    this.destinationSummaries,
    this.nextToken,
  });

  factory ListTopicRuleDestinationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListTopicRuleDestinationsResponse(
      destinationSummaries: (json['destinationSummaries'] as List?)
          ?.nonNulls
          .map((e) =>
              TopicRuleDestinationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

/// The output from the ListTopicRules operation.
class ListTopicRulesResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  /// The rules.
  final List<TopicRuleListItem>? rules;

  ListTopicRulesResponse({
    this.nextToken,
    this.rules,
  });

  factory ListTopicRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListTopicRulesResponse(
      nextToken: json['nextToken'] as String?,
      rules: (json['rules'] as List?)
          ?.nonNulls
          .map((e) => TopicRuleListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListV2LoggingLevelsResponse {
  /// The logging configuration for a target.
  final List<LogTargetConfiguration>? logTargetConfigurations;

  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  ListV2LoggingLevelsResponse({
    this.logTargetConfigurations,
    this.nextToken,
  });

  factory ListV2LoggingLevelsResponse.fromJson(Map<String, dynamic> json) {
    return ListV2LoggingLevelsResponse(
      logTargetConfigurations: (json['logTargetConfigurations'] as List?)
          ?.nonNulls
          .map(
              (e) => LogTargetConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListViolationEventsResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  final String? nextToken;

  /// The security profile violation alerts issued for this account during the
  /// given time period, potentially filtered by security profile, behavior
  /// violated, or thing (device) violating.
  final List<ViolationEvent>? violationEvents;

  ListViolationEventsResponse({
    this.nextToken,
    this.violationEvents,
  });

  factory ListViolationEventsResponse.fromJson(Map<String, dynamic> json) {
    return ListViolationEventsResponse(
      nextToken: json['nextToken'] as String?,
      violationEvents: (json['violationEvents'] as List?)
          ?.nonNulls
          .map((e) => ViolationEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The Amazon Location rule action sends device location updates from an MQTT
/// message to an Amazon Location tracker resource.
class LocationAction {
  /// The unique ID of the device providing the location data.
  final String deviceId;

  /// A string that evaluates to a double value that represents the latitude of
  /// the device's location.
  final String latitude;

  /// A string that evaluates to a double value that represents the longitude of
  /// the device's location.
  final String longitude;

  /// The IAM role that grants permission to write to the Amazon Location
  /// resource.
  final String roleArn;

  /// The name of the tracker resource in Amazon Location in which the location is
  /// updated.
  final String trackerName;

  /// The time that the location data was sampled. The default value is the time
  /// the MQTT message was processed.
  final LocationTimestamp? timestamp;

  LocationAction({
    required this.deviceId,
    required this.latitude,
    required this.longitude,
    required this.roleArn,
    required this.trackerName,
    this.timestamp,
  });

  factory LocationAction.fromJson(Map<String, dynamic> json) {
    return LocationAction(
      deviceId: json['deviceId'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      roleArn: json['roleArn'] as String,
      trackerName: json['trackerName'] as String,
      timestamp: json['timestamp'] != null
          ? LocationTimestamp.fromJson(
              json['timestamp'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final latitude = this.latitude;
    final longitude = this.longitude;
    final roleArn = this.roleArn;
    final trackerName = this.trackerName;
    final timestamp = this.timestamp;
    return {
      'deviceId': deviceId,
      'latitude': latitude,
      'longitude': longitude,
      'roleArn': roleArn,
      'trackerName': trackerName,
      if (timestamp != null) 'timestamp': timestamp,
    };
  }
}

/// Describes how to interpret an application-defined timestamp value from an
/// MQTT message payload and the precision of that value.
class LocationTimestamp {
  /// An expression that returns a long epoch time value.
  final String value;

  /// The precision of the timestamp value that results from the expression
  /// described in <code>value</code>.
  ///
  /// Valid values: <code>SECONDS</code> | <code>MILLISECONDS</code> |
  /// <code>MICROSECONDS</code> | <code>NANOSECONDS</code>. The default is
  /// <code>MILLISECONDS</code>.
  final String? unit;

  LocationTimestamp({
    required this.value,
    this.unit,
  });

  factory LocationTimestamp.fromJson(Map<String, dynamic> json) {
    return LocationTimestamp(
      value: json['value'] as String,
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final unit = this.unit;
    return {
      'value': value,
      if (unit != null) 'unit': unit,
    };
  }
}

enum LogLevel {
  debug('DEBUG'),
  info('INFO'),
  error('ERROR'),
  warn('WARN'),
  disabled('DISABLED'),
  ;

  final String value;

  const LogLevel(this.value);

  static LogLevel fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum LogLevel'));
}

/// A log target.
class LogTarget {
  /// The target type.
  final LogTargetType targetType;

  /// The target name.
  final String? targetName;

  LogTarget({
    required this.targetType,
    this.targetName,
  });

  factory LogTarget.fromJson(Map<String, dynamic> json) {
    return LogTarget(
      targetType: LogTargetType.fromString((json['targetType'] as String)),
      targetName: json['targetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetType = this.targetType;
    final targetName = this.targetName;
    return {
      'targetType': targetType.value,
      if (targetName != null) 'targetName': targetName,
    };
  }
}

/// The target configuration.
class LogTargetConfiguration {
  /// The logging level.
  final LogLevel? logLevel;

  /// A log target
  final LogTarget? logTarget;

  LogTargetConfiguration({
    this.logLevel,
    this.logTarget,
  });

  factory LogTargetConfiguration.fromJson(Map<String, dynamic> json) {
    return LogTargetConfiguration(
      logLevel: (json['logLevel'] as String?)?.let(LogLevel.fromString),
      logTarget: json['logTarget'] != null
          ? LogTarget.fromJson(json['logTarget'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum LogTargetType {
  $default('DEFAULT'),
  thingGroup('THING_GROUP'),
  clientId('CLIENT_ID'),
  sourceIp('SOURCE_IP'),
  principalId('PRINCIPAL_ID'),
  ;

  final String value;

  const LogTargetType(this.value);

  static LogTargetType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum LogTargetType'));
}

/// Describes the logging options payload.
class LoggingOptionsPayload {
  /// The ARN of the IAM role that grants access.
  final String roleArn;

  /// The log level.
  final LogLevel? logLevel;

  LoggingOptionsPayload({
    required this.roleArn,
    this.logLevel,
  });

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final logLevel = this.logLevel;
    return {
      'roleArn': roleArn,
      if (logLevel != null) 'logLevel': logLevel.value,
    };
  }
}

/// The configuration of an ML Detect Security Profile.
class MachineLearningDetectionConfig {
  /// The sensitivity of anomalous behavior evaluation. Can be <code>Low</code>,
  /// <code>Medium</code>, or <code>High</code>.
  final ConfidenceLevel confidenceLevel;

  MachineLearningDetectionConfig({
    required this.confidenceLevel,
  });

  factory MachineLearningDetectionConfig.fromJson(Map<String, dynamic> json) {
    return MachineLearningDetectionConfig(
      confidenceLevel:
          ConfidenceLevel.fromString((json['confidenceLevel'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final confidenceLevel = this.confidenceLevel;
    return {
      'confidenceLevel': confidenceLevel.value,
    };
  }
}

/// An optional configuration within the <code>SchedulingConfig</code> to setup
/// a recurring maintenance window with a predetermined start time and duration
/// for the rollout of a job document to all devices in a target group for a
/// job.
class MaintenanceWindow {
  /// Displays the duration of the next maintenance window.
  final int durationInMinutes;

  /// Displays the start time of the next maintenance window.
  final String startTime;

  MaintenanceWindow({
    required this.durationInMinutes,
    required this.startTime,
  });

  factory MaintenanceWindow.fromJson(Map<String, dynamic> json) {
    return MaintenanceWindow(
      durationInMinutes: json['durationInMinutes'] as int,
      startTime: json['startTime'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInMinutes = this.durationInMinutes;
    final startTime = this.startTime;
    return {
      'durationInMinutes': durationInMinutes,
      'startTime': startTime,
    };
  }
}

/// An object that contains information about the managed template.
class ManagedJobTemplateSummary {
  /// The description for a managed template.
  final String? description;

  /// A list of environments that are supported with the managed job template.
  final List<String>? environments;

  /// The Amazon Resource Name (ARN) for a managed template.
  final String? templateArn;

  /// The unique Name for a managed template.
  final String? templateName;

  /// The version for a managed template.
  final String? templateVersion;

  ManagedJobTemplateSummary({
    this.description,
    this.environments,
    this.templateArn,
    this.templateName,
    this.templateVersion,
  });

  factory ManagedJobTemplateSummary.fromJson(Map<String, dynamic> json) {
    return ManagedJobTemplateSummary(
      description: json['description'] as String?,
      environments: (json['environments'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      templateArn: json['templateArn'] as String?,
      templateName: json['templateName'] as String?,
      templateVersion: json['templateVersion'] as String?,
    );
  }
}

enum MessageFormat {
  raw('RAW'),
  json('JSON'),
  ;

  final String value;

  const MessageFormat(this.value);

  static MessageFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum MessageFormat'));
}

/// A metric.
class MetricDatum {
  /// The time the metric value was reported.
  final DateTime? timestamp;

  /// The value reported for the metric.
  final MetricValue? value;

  MetricDatum({
    this.timestamp,
    this.value,
  });

  factory MetricDatum.fromJson(Map<String, dynamic> json) {
    return MetricDatum(
      timestamp: timeStampFromJson(json['timestamp']),
      value: json['value'] != null
          ? MetricValue.fromJson(json['value'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// The dimension of a metric.
class MetricDimension {
  /// A unique identifier for the dimension.
  final String dimensionName;

  /// Defines how the <code>dimensionValues</code> of a dimension are interpreted.
  /// For example, for dimension type TOPIC_FILTER, the <code>IN</code> operator,
  /// a message will be counted only if its topic matches one of the topic
  /// filters. With <code>NOT_IN</code> operator, a message will be counted only
  /// if it doesn't match any of the topic filters. The operator is optional: if
  /// it's not provided (is <code>null</code>), it will be interpreted as
  /// <code>IN</code>.
  final DimensionValueOperator? operator;

  MetricDimension({
    required this.dimensionName,
    this.operator,
  });

  factory MetricDimension.fromJson(Map<String, dynamic> json) {
    return MetricDimension(
      dimensionName: json['dimensionName'] as String,
      operator:
          (json['operator'] as String?)?.let(DimensionValueOperator.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionName = this.dimensionName;
    final operator = this.operator;
    return {
      'dimensionName': dimensionName,
      if (operator != null) 'operator': operator.value,
    };
  }
}

/// The metric you want to retain. Dimensions are optional.
class MetricToRetain {
  /// What is measured by the behavior.
  final String metric;

  /// The value indicates exporting metrics related to the <code>MetricToRetain
  /// </code> when it's true.
  final bool? exportMetric;

  /// The dimension of a metric. This can't be used with custom metrics.
  final MetricDimension? metricDimension;

  MetricToRetain({
    required this.metric,
    this.exportMetric,
    this.metricDimension,
  });

  factory MetricToRetain.fromJson(Map<String, dynamic> json) {
    return MetricToRetain(
      metric: json['metric'] as String,
      exportMetric: json['exportMetric'] as bool?,
      metricDimension: json['metricDimension'] != null
          ? MetricDimension.fromJson(
              json['metricDimension'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metric = this.metric;
    final exportMetric = this.exportMetric;
    final metricDimension = this.metricDimension;
    return {
      'metric': metric,
      if (exportMetric != null) 'exportMetric': exportMetric,
      if (metricDimension != null) 'metricDimension': metricDimension,
    };
  }
}

/// The value to be compared with the <code>metric</code>.
class MetricValue {
  /// If the <code>comparisonOperator</code> calls for a set of CIDRs, use this to
  /// specify that set to be compared with the <code>metric</code>.
  final List<String>? cidrs;

  /// If the <code>comparisonOperator</code> calls for a numeric value, use this
  /// to specify that numeric value to be compared with the <code>metric</code>.
  final int? count;

  /// The numeral value of a metric.
  final double? number;

  /// The numeral values of a metric.
  final List<double>? numbers;

  /// If the <code>comparisonOperator</code> calls for a set of ports, use this to
  /// specify that set to be compared with the <code>metric</code>.
  final List<int>? ports;

  /// The string values of a metric.
  final List<String>? strings;

  MetricValue({
    this.cidrs,
    this.count,
    this.number,
    this.numbers,
    this.ports,
    this.strings,
  });

  factory MetricValue.fromJson(Map<String, dynamic> json) {
    return MetricValue(
      cidrs:
          (json['cidrs'] as List?)?.nonNulls.map((e) => e as String).toList(),
      count: json['count'] as int?,
      number: json['number'] as double?,
      numbers:
          (json['numbers'] as List?)?.nonNulls.map((e) => e as double).toList(),
      ports: (json['ports'] as List?)?.nonNulls.map((e) => e as int).toList(),
      strings:
          (json['strings'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cidrs = this.cidrs;
    final count = this.count;
    final number = this.number;
    final numbers = this.numbers;
    final ports = this.ports;
    final strings = this.strings;
    return {
      if (cidrs != null) 'cidrs': cidrs,
      if (count != null) 'count': count,
      if (number != null) 'number': number,
      if (numbers != null) 'numbers': numbers,
      if (ports != null) 'ports': ports,
      if (strings != null) 'strings': strings,
    };
  }
}

/// Set configurations for metrics export.
class MetricsExportConfig {
  /// The MQTT topic that Device Defender Detect should publish messages to for
  /// metrics export.
  final String mqttTopic;

  /// This role ARN has permission to publish MQTT messages, after which Device
  /// Defender Detect can assume the role and publish messages on your behalf.
  final String roleArn;

  MetricsExportConfig({
    required this.mqttTopic,
    required this.roleArn,
  });

  factory MetricsExportConfig.fromJson(Map<String, dynamic> json) {
    return MetricsExportConfig(
      mqttTopic: json['mqttTopic'] as String,
      roleArn: json['roleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final mqttTopic = this.mqttTopic;
    final roleArn = this.roleArn;
    return {
      'mqttTopic': mqttTopic,
      'roleArn': roleArn,
    };
  }
}

/// Describes which changes should be applied as part of a mitigation action.
class MitigationAction {
  /// The set of parameters for this mitigation action. The parameters vary,
  /// depending on the kind of action you apply.
  final MitigationActionParams? actionParams;

  /// A unique identifier for the mitigation action.
  final String? id;

  /// A user-friendly name for the mitigation action.
  final String? name;

  /// The IAM role ARN used to apply this mitigation action.
  final String? roleArn;

  MitigationAction({
    this.actionParams,
    this.id,
    this.name,
    this.roleArn,
  });

  factory MitigationAction.fromJson(Map<String, dynamic> json) {
    return MitigationAction(
      actionParams: json['actionParams'] != null
          ? MitigationActionParams.fromJson(
              json['actionParams'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      name: json['name'] as String?,
      roleArn: json['roleArn'] as String?,
    );
  }
}

/// Information that identifies a mitigation action. This information is
/// returned by ListMitigationActions.
class MitigationActionIdentifier {
  /// The IAM role ARN used to apply this mitigation action.
  final String? actionArn;

  /// The friendly name of the mitigation action.
  final String? actionName;

  /// The date when this mitigation action was created.
  final DateTime? creationDate;

  MitigationActionIdentifier({
    this.actionArn,
    this.actionName,
    this.creationDate,
  });

  factory MitigationActionIdentifier.fromJson(Map<String, dynamic> json) {
    return MitigationActionIdentifier(
      actionArn: json['actionArn'] as String?,
      actionName: json['actionName'] as String?,
      creationDate: timeStampFromJson(json['creationDate']),
    );
  }
}

/// The set of parameters for this mitigation action. You can specify only one
/// type of parameter (in other words, you can apply only one action for each
/// defined mitigation action).
class MitigationActionParams {
  /// Parameters to define a mitigation action that moves devices associated with
  /// a certificate to one or more specified thing groups, typically for
  /// quarantine.
  final AddThingsToThingGroupParams? addThingsToThingGroupParams;

  /// Parameters to define a mitigation action that enables Amazon Web Services
  /// IoT Core logging at a specified level of detail.
  final EnableIoTLoggingParams? enableIoTLoggingParams;

  /// Parameters to define a mitigation action that publishes findings to Amazon
  /// Simple Notification Service (Amazon SNS. You can implement your own custom
  /// actions in response to the Amazon SNS messages.
  final PublishFindingToSnsParams? publishFindingToSnsParams;

  /// Parameters to define a mitigation action that adds a blank policy to
  /// restrict permissions.
  final ReplaceDefaultPolicyVersionParams? replaceDefaultPolicyVersionParams;

  /// Parameters to define a mitigation action that changes the state of the CA
  /// certificate to inactive.
  final UpdateCACertificateParams? updateCACertificateParams;

  /// Parameters to define a mitigation action that changes the state of the
  /// device certificate to inactive.
  final UpdateDeviceCertificateParams? updateDeviceCertificateParams;

  MitigationActionParams({
    this.addThingsToThingGroupParams,
    this.enableIoTLoggingParams,
    this.publishFindingToSnsParams,
    this.replaceDefaultPolicyVersionParams,
    this.updateCACertificateParams,
    this.updateDeviceCertificateParams,
  });

  factory MitigationActionParams.fromJson(Map<String, dynamic> json) {
    return MitigationActionParams(
      addThingsToThingGroupParams: json['addThingsToThingGroupParams'] != null
          ? AddThingsToThingGroupParams.fromJson(
              json['addThingsToThingGroupParams'] as Map<String, dynamic>)
          : null,
      enableIoTLoggingParams: json['enableIoTLoggingParams'] != null
          ? EnableIoTLoggingParams.fromJson(
              json['enableIoTLoggingParams'] as Map<String, dynamic>)
          : null,
      publishFindingToSnsParams: json['publishFindingToSnsParams'] != null
          ? PublishFindingToSnsParams.fromJson(
              json['publishFindingToSnsParams'] as Map<String, dynamic>)
          : null,
      replaceDefaultPolicyVersionParams:
          json['replaceDefaultPolicyVersionParams'] != null
              ? ReplaceDefaultPolicyVersionParams.fromJson(
                  json['replaceDefaultPolicyVersionParams']
                      as Map<String, dynamic>)
              : null,
      updateCACertificateParams: json['updateCACertificateParams'] != null
          ? UpdateCACertificateParams.fromJson(
              json['updateCACertificateParams'] as Map<String, dynamic>)
          : null,
      updateDeviceCertificateParams:
          json['updateDeviceCertificateParams'] != null
              ? UpdateDeviceCertificateParams.fromJson(
                  json['updateDeviceCertificateParams'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addThingsToThingGroupParams = this.addThingsToThingGroupParams;
    final enableIoTLoggingParams = this.enableIoTLoggingParams;
    final publishFindingToSnsParams = this.publishFindingToSnsParams;
    final replaceDefaultPolicyVersionParams =
        this.replaceDefaultPolicyVersionParams;
    final updateCACertificateParams = this.updateCACertificateParams;
    final updateDeviceCertificateParams = this.updateDeviceCertificateParams;
    return {
      if (addThingsToThingGroupParams != null)
        'addThingsToThingGroupParams': addThingsToThingGroupParams,
      if (enableIoTLoggingParams != null)
        'enableIoTLoggingParams': enableIoTLoggingParams,
      if (publishFindingToSnsParams != null)
        'publishFindingToSnsParams': publishFindingToSnsParams,
      if (replaceDefaultPolicyVersionParams != null)
        'replaceDefaultPolicyVersionParams': replaceDefaultPolicyVersionParams,
      if (updateCACertificateParams != null)
        'updateCACertificateParams': updateCACertificateParams,
      if (updateDeviceCertificateParams != null)
        'updateDeviceCertificateParams': updateDeviceCertificateParams,
    };
  }
}

enum MitigationActionType {
  updateDeviceCertificate('UPDATE_DEVICE_CERTIFICATE'),
  updateCaCertificate('UPDATE_CA_CERTIFICATE'),
  addThingsToThingGroup('ADD_THINGS_TO_THING_GROUP'),
  replaceDefaultPolicyVersion('REPLACE_DEFAULT_POLICY_VERSION'),
  enableIotLogging('ENABLE_IOT_LOGGING'),
  publishFindingToSns('PUBLISH_FINDING_TO_SNS'),
  ;

  final String value;

  const MitigationActionType(this.value);

  static MitigationActionType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum MitigationActionType'));
}

enum ModelStatus {
  pendingBuild('PENDING_BUILD'),
  active('ACTIVE'),
  expired('EXPIRED'),
  ;

  final String value;

  const ModelStatus(this.value);

  static ModelStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ModelStatus'));
}

/// Specifies the MQTT context to use for the test authorizer request
class MqttContext {
  /// The value of the <code>clientId</code> key in an MQTT authorization request.
  final String? clientId;

  /// The value of the <code>password</code> key in an MQTT authorization request.
  final Uint8List? password;

  /// The value of the <code>username</code> key in an MQTT authorization request.
  final String? username;

  MqttContext({
    this.clientId,
    this.password,
    this.username,
  });

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final password = this.password;
    final username = this.username;
    return {
      if (clientId != null) 'clientId': clientId,
      if (password != null) 'password': base64Encode(password),
      if (username != null) 'username': username,
    };
  }
}

/// Specifies MQTT Version 5.0 headers information. For more information, see <a
/// href="https://docs.aws.amazon.com/iot/latest/developerguide/mqtt.html">
/// MQTT</a> from Amazon Web Services IoT Core Developer Guide.
class MqttHeaders {
  /// A UTF-8 encoded string that describes the content of the publishing message.
  ///
  /// For more information, see <a
  /// href="https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901118">
  /// Content Type</a> from the MQTT Version 5.0 specification.
  ///
  /// Supports <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-substitution-templates.html">substitution
  /// templates</a>.
  final String? contentType;

  /// The base64-encoded binary data used by the sender of the request message to
  /// identify which request the response message is for when it's received.
  ///
  /// For more information, see <a
  /// href="https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901115">
  /// Correlation Data</a> from the MQTT Version 5.0 specification.
  /// <note>
  /// This binary data must be based64-encoded.
  /// </note>
  /// Supports <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-substitution-templates.html">substitution
  /// templates</a>.
  final String? correlationData;

  /// A user-defined integer value that will persist a message at the message
  /// broker for a specified amount of time to ensure that the message will expire
  /// if it's no longer relevant to the subscriber. The value of
  /// <code>messageExpiry</code> represents the number of seconds before it
  /// expires. For more information about the limits of
  /// <code>messageExpiry</code>, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/mqtt.html">Amazon
  /// Web Services IoT Core message broker and protocol limits and quotas </a>
  /// from the Amazon Web Services Reference Guide.
  ///
  /// Supports <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-substitution-templates.html">substitution
  /// templates</a>.
  final String? messageExpiry;

  /// An <code>Enum</code> string value that indicates whether the payload is
  /// formatted as UTF-8.
  ///
  /// Valid values are <code>UNSPECIFIED_BYTES</code> and <code>UTF8_DATA</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901111">
  /// Payload Format Indicator</a> from the MQTT Version 5.0 specification.
  ///
  /// Supports <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-substitution-templates.html">substitution
  /// templates</a>.
  final String? payloadFormatIndicator;

  /// A UTF-8 encoded string that's used as the topic name for a response message.
  /// The response topic is used to describe the topic which the receiver should
  /// publish to as part of the request-response flow. The topic must not contain
  /// wildcard characters.
  ///
  /// For more information, see <a
  /// href="https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901114">
  /// Response Topic</a> from the MQTT Version 5.0 specification.
  ///
  /// Supports <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-substitution-templates.html">substitution
  /// templates</a>.
  final String? responseTopic;

  /// An array of key-value pairs that you define in the MQTT5 header.
  final List<UserProperty>? userProperties;

  MqttHeaders({
    this.contentType,
    this.correlationData,
    this.messageExpiry,
    this.payloadFormatIndicator,
    this.responseTopic,
    this.userProperties,
  });

  factory MqttHeaders.fromJson(Map<String, dynamic> json) {
    return MqttHeaders(
      contentType: json['contentType'] as String?,
      correlationData: json['correlationData'] as String?,
      messageExpiry: json['messageExpiry'] as String?,
      payloadFormatIndicator: json['payloadFormatIndicator'] as String?,
      responseTopic: json['responseTopic'] as String?,
      userProperties: (json['userProperties'] as List?)
          ?.nonNulls
          .map((e) => UserProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final correlationData = this.correlationData;
    final messageExpiry = this.messageExpiry;
    final payloadFormatIndicator = this.payloadFormatIndicator;
    final responseTopic = this.responseTopic;
    final userProperties = this.userProperties;
    return {
      if (contentType != null) 'contentType': contentType,
      if (correlationData != null) 'correlationData': correlationData,
      if (messageExpiry != null) 'messageExpiry': messageExpiry,
      if (payloadFormatIndicator != null)
        'payloadFormatIndicator': payloadFormatIndicator,
      if (responseTopic != null) 'responseTopic': responseTopic,
      if (userProperties != null) 'userProperties': userProperties,
    };
  }
}

enum NamedShadowIndexingMode {
  off('OFF'),
  on('ON'),
  ;

  final String value;

  const NamedShadowIndexingMode(this.value);

  static NamedShadowIndexingMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum NamedShadowIndexingMode'));
}

/// Information about the resource that was noncompliant with the audit check.
class NonCompliantResource {
  /// Other information about the noncompliant resource.
  final Map<String, String>? additionalInfo;

  /// Information that identifies the noncompliant resource.
  final ResourceIdentifier? resourceIdentifier;

  /// The type of the noncompliant resource.
  final ResourceType? resourceType;

  NonCompliantResource({
    this.additionalInfo,
    this.resourceIdentifier,
    this.resourceType,
  });

  factory NonCompliantResource.fromJson(Map<String, dynamic> json) {
    return NonCompliantResource(
      additionalInfo: (json['additionalInfo'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resourceIdentifier: json['resourceIdentifier'] != null
          ? ResourceIdentifier.fromJson(
              json['resourceIdentifier'] as Map<String, dynamic>)
          : null,
      resourceType:
          (json['resourceType'] as String?)?.let(ResourceType.fromString),
    );
  }
}

/// Describes a file to be associated with an OTA update.
class OTAUpdateFile {
  /// A list of name-attribute pairs. They won't be sent to devices as a part of
  /// the Job document.
  final Map<String, String>? attributes;

  /// The code signing method of the file.
  final CodeSigning? codeSigning;

  /// The location of the updated firmware.
  final FileLocation? fileLocation;

  /// The name of the file.
  final String? fileName;

  /// An integer value you can include in the job document to allow your devices
  /// to identify the type of file received from the cloud.
  final int? fileType;

  /// The file version.
  final String? fileVersion;

  OTAUpdateFile({
    this.attributes,
    this.codeSigning,
    this.fileLocation,
    this.fileName,
    this.fileType,
    this.fileVersion,
  });

  factory OTAUpdateFile.fromJson(Map<String, dynamic> json) {
    return OTAUpdateFile(
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      codeSigning: json['codeSigning'] != null
          ? CodeSigning.fromJson(json['codeSigning'] as Map<String, dynamic>)
          : null,
      fileLocation: json['fileLocation'] != null
          ? FileLocation.fromJson(json['fileLocation'] as Map<String, dynamic>)
          : null,
      fileName: json['fileName'] as String?,
      fileType: json['fileType'] as int?,
      fileVersion: json['fileVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final codeSigning = this.codeSigning;
    final fileLocation = this.fileLocation;
    final fileName = this.fileName;
    final fileType = this.fileType;
    final fileVersion = this.fileVersion;
    return {
      if (attributes != null) 'attributes': attributes,
      if (codeSigning != null) 'codeSigning': codeSigning,
      if (fileLocation != null) 'fileLocation': fileLocation,
      if (fileName != null) 'fileName': fileName,
      if (fileType != null) 'fileType': fileType,
      if (fileVersion != null) 'fileVersion': fileVersion,
    };
  }
}

/// Information about an OTA update.
class OTAUpdateInfo {
  /// A collection of name/value pairs
  final Map<String, String>? additionalParameters;

  /// The IoT job ARN associated with the OTA update.
  final String? awsIotJobArn;

  /// The IoT job ID associated with the OTA update.
  final String? awsIotJobId;

  /// Configuration for the rollout of OTA updates.
  final AwsJobExecutionsRolloutConfig? awsJobExecutionsRolloutConfig;

  /// Configuration information for pre-signed URLs. Valid when
  /// <code>protocols</code> contains HTTP.
  final AwsJobPresignedUrlConfig? awsJobPresignedUrlConfig;

  /// The date when the OTA update was created.
  final DateTime? creationDate;

  /// A description of the OTA update.
  final String? description;

  /// Error information associated with the OTA update.
  final ErrorInfo? errorInfo;

  /// The date when the OTA update was last updated.
  final DateTime? lastModifiedDate;

  /// The OTA update ARN.
  final String? otaUpdateArn;

  /// A list of files associated with the OTA update.
  final List<OTAUpdateFile>? otaUpdateFiles;

  /// The OTA update ID.
  final String? otaUpdateId;

  /// The status of the OTA update.
  final OTAUpdateStatus? otaUpdateStatus;

  /// The protocol used to transfer the OTA update image. Valid values are [HTTP],
  /// [MQTT], [HTTP, MQTT]. When both HTTP and MQTT are specified, the target
  /// device can choose the protocol.
  final List<Protocol>? protocols;

  /// Specifies whether the OTA update will continue to run (CONTINUOUS), or will
  /// be complete after all those things specified as targets have completed the
  /// OTA update (SNAPSHOT). If continuous, the OTA update may also be run on a
  /// thing when a change is detected in a target. For example, an OTA update will
  /// run on a thing when the thing is added to a target group, even after the OTA
  /// update was completed by all things originally in the group.
  final TargetSelection? targetSelection;

  /// The targets of the OTA update.
  final List<String>? targets;

  OTAUpdateInfo({
    this.additionalParameters,
    this.awsIotJobArn,
    this.awsIotJobId,
    this.awsJobExecutionsRolloutConfig,
    this.awsJobPresignedUrlConfig,
    this.creationDate,
    this.description,
    this.errorInfo,
    this.lastModifiedDate,
    this.otaUpdateArn,
    this.otaUpdateFiles,
    this.otaUpdateId,
    this.otaUpdateStatus,
    this.protocols,
    this.targetSelection,
    this.targets,
  });

  factory OTAUpdateInfo.fromJson(Map<String, dynamic> json) {
    return OTAUpdateInfo(
      additionalParameters:
          (json['additionalParameters'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      awsIotJobArn: json['awsIotJobArn'] as String?,
      awsIotJobId: json['awsIotJobId'] as String?,
      awsJobExecutionsRolloutConfig:
          json['awsJobExecutionsRolloutConfig'] != null
              ? AwsJobExecutionsRolloutConfig.fromJson(
                  json['awsJobExecutionsRolloutConfig'] as Map<String, dynamic>)
              : null,
      awsJobPresignedUrlConfig: json['awsJobPresignedUrlConfig'] != null
          ? AwsJobPresignedUrlConfig.fromJson(
              json['awsJobPresignedUrlConfig'] as Map<String, dynamic>)
          : null,
      creationDate: timeStampFromJson(json['creationDate']),
      description: json['description'] as String?,
      errorInfo: json['errorInfo'] != null
          ? ErrorInfo.fromJson(json['errorInfo'] as Map<String, dynamic>)
          : null,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      otaUpdateArn: json['otaUpdateArn'] as String?,
      otaUpdateFiles: (json['otaUpdateFiles'] as List?)
          ?.nonNulls
          .map((e) => OTAUpdateFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      otaUpdateId: json['otaUpdateId'] as String?,
      otaUpdateStatus:
          (json['otaUpdateStatus'] as String?)?.let(OTAUpdateStatus.fromString),
      protocols: (json['protocols'] as List?)
          ?.nonNulls
          .map((e) => Protocol.fromString((e as String)))
          .toList(),
      targetSelection:
          (json['targetSelection'] as String?)?.let(TargetSelection.fromString),
      targets:
          (json['targets'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }
}

enum OTAUpdateStatus {
  createPending('CREATE_PENDING'),
  createInProgress('CREATE_IN_PROGRESS'),
  createComplete('CREATE_COMPLETE'),
  createFailed('CREATE_FAILED'),
  deleteInProgress('DELETE_IN_PROGRESS'),
  deleteFailed('DELETE_FAILED'),
  ;

  final String value;

  const OTAUpdateStatus(this.value);

  static OTAUpdateStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum OTAUpdateStatus'));
}

/// An OTA update summary.
class OTAUpdateSummary {
  /// The date when the OTA update was created.
  final DateTime? creationDate;

  /// The OTA update ARN.
  final String? otaUpdateArn;

  /// The OTA update ID.
  final String? otaUpdateId;

  OTAUpdateSummary({
    this.creationDate,
    this.otaUpdateArn,
    this.otaUpdateId,
  });

  factory OTAUpdateSummary.fromJson(Map<String, dynamic> json) {
    return OTAUpdateSummary(
      creationDate: timeStampFromJson(json['creationDate']),
      otaUpdateArn: json['otaUpdateArn'] as String?,
      otaUpdateId: json['otaUpdateId'] as String?,
    );
  }
}

/// Describes an action that writes data to an Amazon OpenSearch Service domain.
class OpenSearchAction {
  /// The endpoint of your OpenSearch domain.
  final String endpoint;

  /// The unique identifier for the document you are storing.
  final String id;

  /// The OpenSearch index where you want to store your data.
  final String index;

  /// The IAM role ARN that has access to OpenSearch.
  final String roleArn;

  /// The type of document you are storing.
  final String type;

  OpenSearchAction({
    required this.endpoint,
    required this.id,
    required this.index,
    required this.roleArn,
    required this.type,
  });

  factory OpenSearchAction.fromJson(Map<String, dynamic> json) {
    return OpenSearchAction(
      endpoint: json['endpoint'] as String,
      id: json['id'] as String,
      index: json['index'] as String,
      roleArn: json['roleArn'] as String,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final id = this.id;
    final index = this.index;
    final roleArn = this.roleArn;
    final type = this.type;
    return {
      'endpoint': endpoint,
      'id': id,
      'index': index,
      'roleArn': roleArn,
      'type': type,
    };
  }
}

/// A certificate that has been transferred but not yet accepted.
class OutgoingCertificate {
  /// The certificate ARN.
  final String? certificateArn;

  /// The certificate ID.
  final String? certificateId;

  /// The certificate creation date.
  final DateTime? creationDate;

  /// The date the transfer was initiated.
  final DateTime? transferDate;

  /// The transfer message.
  final String? transferMessage;

  /// The Amazon Web Services account to which the transfer was made.
  final String? transferredTo;

  OutgoingCertificate({
    this.certificateArn,
    this.certificateId,
    this.creationDate,
    this.transferDate,
    this.transferMessage,
    this.transferredTo,
  });

  factory OutgoingCertificate.fromJson(Map<String, dynamic> json) {
    return OutgoingCertificate(
      certificateArn: json['certificateArn'] as String?,
      certificateId: json['certificateId'] as String?,
      creationDate: timeStampFromJson(json['creationDate']),
      transferDate: timeStampFromJson(json['transferDate']),
      transferMessage: json['transferMessage'] as String?,
      transferredTo: json['transferredTo'] as String?,
    );
  }
}

/// A summary of information about a software package.
class PackageSummary {
  /// The date that the package was created.
  final DateTime? creationDate;

  /// The name of the default package version.
  final String? defaultVersionName;

  /// The date that the package was last updated.
  final DateTime? lastModifiedDate;

  /// The name for the target software package.
  final String? packageName;

  PackageSummary({
    this.creationDate,
    this.defaultVersionName,
    this.lastModifiedDate,
    this.packageName,
  });

  factory PackageSummary.fromJson(Map<String, dynamic> json) {
    return PackageSummary(
      creationDate: timeStampFromJson(json['creationDate']),
      defaultVersionName: json['defaultVersionName'] as String?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      packageName: json['packageName'] as String?,
    );
  }
}

enum PackageVersionAction {
  publish('PUBLISH'),
  deprecate('DEPRECATE'),
  ;

  final String value;

  const PackageVersionAction(this.value);

  static PackageVersionAction fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum PackageVersionAction'));
}

enum PackageVersionStatus {
  draft('DRAFT'),
  published('PUBLISHED'),
  deprecated('DEPRECATED'),
  ;

  final String value;

  const PackageVersionStatus(this.value);

  static PackageVersionStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum PackageVersionStatus'));
}

/// A summary of information about a package version.
class PackageVersionSummary {
  /// The date that the package version was created.
  final DateTime? creationDate;

  /// The date that the package version was last updated.
  final DateTime? lastModifiedDate;

  /// The name of the associated software package.
  final String? packageName;

  /// The status of the package version. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/preparing-to-use-software-package-catalog.html#package-version-lifecycle">Package
  /// version lifecycle</a>.
  final PackageVersionStatus? status;

  /// The name of the target package version.
  final String? versionName;

  PackageVersionSummary({
    this.creationDate,
    this.lastModifiedDate,
    this.packageName,
    this.status,
    this.versionName,
  });

  factory PackageVersionSummary.fromJson(Map<String, dynamic> json) {
    return PackageVersionSummary(
      creationDate: timeStampFromJson(json['creationDate']),
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      packageName: json['packageName'] as String?,
      status: (json['status'] as String?)?.let(PackageVersionStatus.fromString),
      versionName: json['versionName'] as String?,
    );
  }
}

/// Describes the percentile and percentile value.
class PercentPair {
  /// The percentile.
  final double? percent;

  /// The value of the percentile.
  final double? value;

  PercentPair({
    this.percent,
    this.value,
  });

  factory PercentPair.fromJson(Map<String, dynamic> json) {
    return PercentPair(
      percent: json['percent'] as double?,
      value: json['value'] as double?,
    );
  }
}

/// Describes an IoT policy.
class Policy {
  /// The policy ARN.
  final String? policyArn;

  /// The policy name.
  final String? policyName;

  Policy({
    this.policyArn,
    this.policyName,
  });

  factory Policy.fromJson(Map<String, dynamic> json) {
    return Policy(
      policyArn: json['policyArn'] as String?,
      policyName: json['policyName'] as String?,
    );
  }
}

enum PolicyTemplateName {
  blankPolicy('BLANK_POLICY'),
  ;

  final String value;

  const PolicyTemplateName(this.value);

  static PolicyTemplateName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum PolicyTemplateName'));
}

/// Describes a policy version.
class PolicyVersion {
  /// The date and time the policy was created.
  final DateTime? createDate;

  /// Specifies whether the policy version is the default.
  final bool? isDefaultVersion;

  /// The policy version ID.
  final String? versionId;

  PolicyVersion({
    this.createDate,
    this.isDefaultVersion,
    this.versionId,
  });

  factory PolicyVersion.fromJson(Map<String, dynamic> json) {
    return PolicyVersion(
      createDate: timeStampFromJson(json['createDate']),
      isDefaultVersion: json['isDefaultVersion'] as bool?,
      versionId: json['versionId'] as String?,
    );
  }
}

/// Information about the version of the policy associated with the resource.
class PolicyVersionIdentifier {
  /// The name of the policy.
  final String? policyName;

  /// The ID of the version of the policy associated with the resource.
  final String? policyVersionId;

  PolicyVersionIdentifier({
    this.policyName,
    this.policyVersionId,
  });

  factory PolicyVersionIdentifier.fromJson(Map<String, dynamic> json) {
    return PolicyVersionIdentifier(
      policyName: json['policyName'] as String?,
      policyVersionId: json['policyVersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyName = this.policyName;
    final policyVersionId = this.policyVersionId;
    return {
      if (policyName != null) 'policyName': policyName,
      if (policyVersionId != null) 'policyVersionId': policyVersionId,
    };
  }
}

/// Configuration for pre-signed S3 URLs.
class PresignedUrlConfig {
  /// How long (in seconds) pre-signed URLs are valid. Valid values are 60 - 3600,
  /// the default value is 3600 seconds. Pre-signed URLs are generated when Jobs
  /// receives an MQTT request for the job document.
  final int? expiresInSec;

  /// The ARN of an IAM role that grants permission to download files from the S3
  /// bucket where the job data/updates are stored. The role must also grant
  /// permission for IoT to download the files.
  /// <important>
  /// For information about addressing the confused deputy problem, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/cross-service-confused-deputy-prevention.html">cross-service
  /// confused deputy prevention</a> in the <i>Amazon Web Services IoT Core
  /// developer guide</i>.
  /// </important>
  final String? roleArn;

  PresignedUrlConfig({
    this.expiresInSec,
    this.roleArn,
  });

  factory PresignedUrlConfig.fromJson(Map<String, dynamic> json) {
    return PresignedUrlConfig(
      expiresInSec: json['expiresInSec'] as int?,
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expiresInSec = this.expiresInSec;
    final roleArn = this.roleArn;
    return {
      if (expiresInSec != null) 'expiresInSec': expiresInSec,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

enum Protocol {
  mqtt('MQTT'),
  http('HTTP'),
  ;

  final String value;

  const Protocol(this.value);

  static Protocol fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum Protocol'));
}

/// Structure that contains <code>payloadVersion</code> and
/// <code>targetArn</code>.
class ProvisioningHook {
  /// The ARN of the target function.
  ///
  /// <i>Note:</i> Only Lambda functions are currently supported.
  final String targetArn;

  /// The payload that was sent to the target function.
  ///
  /// <i>Note:</i> Only Lambda functions are currently supported.
  final String? payloadVersion;

  ProvisioningHook({
    required this.targetArn,
    this.payloadVersion,
  });

  factory ProvisioningHook.fromJson(Map<String, dynamic> json) {
    return ProvisioningHook(
      targetArn: json['targetArn'] as String,
      payloadVersion: json['payloadVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetArn = this.targetArn;
    final payloadVersion = this.payloadVersion;
    return {
      'targetArn': targetArn,
      if (payloadVersion != null) 'payloadVersion': payloadVersion,
    };
  }
}

/// A summary of information about a provisioning template.
class ProvisioningTemplateSummary {
  /// The date when the provisioning template summary was created.
  final DateTime? creationDate;

  /// The description of the provisioning template.
  final String? description;

  /// True if the fleet provision template is enabled, otherwise false.
  final bool? enabled;

  /// The date when the provisioning template summary was last modified.
  final DateTime? lastModifiedDate;

  /// The ARN of the provisioning template.
  final String? templateArn;

  /// The name of the provisioning template.
  final String? templateName;

  /// The type you define in a provisioning template. You can create a template
  /// with only one type. You can't change the template type after its creation.
  /// The default value is <code>FLEET_PROVISIONING</code>. For more information
  /// about provisioning template, see: <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/provision-template.html">Provisioning
  /// template</a>.
  final TemplateType? type;

  ProvisioningTemplateSummary({
    this.creationDate,
    this.description,
    this.enabled,
    this.lastModifiedDate,
    this.templateArn,
    this.templateName,
    this.type,
  });

  factory ProvisioningTemplateSummary.fromJson(Map<String, dynamic> json) {
    return ProvisioningTemplateSummary(
      creationDate: timeStampFromJson(json['creationDate']),
      description: json['description'] as String?,
      enabled: json['enabled'] as bool?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      templateArn: json['templateArn'] as String?,
      templateName: json['templateName'] as String?,
      type: (json['type'] as String?)?.let(TemplateType.fromString),
    );
  }
}

/// A summary of information about a fleet provision template version.
class ProvisioningTemplateVersionSummary {
  /// The date when the provisioning template version was created
  final DateTime? creationDate;

  /// True if the provisioning template version is the default version, otherwise
  /// false.
  final bool? isDefaultVersion;

  /// The ID of the fleet provisioning template version.
  final int? versionId;

  ProvisioningTemplateVersionSummary({
    this.creationDate,
    this.isDefaultVersion,
    this.versionId,
  });

  factory ProvisioningTemplateVersionSummary.fromJson(
      Map<String, dynamic> json) {
    return ProvisioningTemplateVersionSummary(
      creationDate: timeStampFromJson(json['creationDate']),
      isDefaultVersion: json['isDefaultVersion'] as bool?,
      versionId: json['versionId'] as int?,
    );
  }
}

/// Parameters to define a mitigation action that publishes findings to Amazon
/// SNS. You can implement your own custom actions in response to the Amazon SNS
/// messages.
class PublishFindingToSnsParams {
  /// The ARN of the topic to which you want to publish the findings.
  final String topicArn;

  PublishFindingToSnsParams({
    required this.topicArn,
  });

  factory PublishFindingToSnsParams.fromJson(Map<String, dynamic> json) {
    return PublishFindingToSnsParams(
      topicArn: json['topicArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final topicArn = this.topicArn;
    return {
      'topicArn': topicArn,
    };
  }
}

/// An asset property value entry containing the following information.
class PutAssetPropertyValueEntry {
  /// A list of property values to insert that each contain timestamp, quality,
  /// and value (TQV) information.
  final List<AssetPropertyValue> propertyValues;

  /// The ID of the IoT SiteWise asset. You must specify either a
  /// <code>propertyAlias</code> or both an <code>aliasId</code> and a
  /// <code>propertyId</code>. Accepts substitution templates.
  final String? assetId;

  /// Optional. A unique identifier for this entry that you can define to better
  /// track which message caused an error in case of failure. Accepts substitution
  /// templates. Defaults to a new UUID.
  final String? entryId;

  /// The name of the property alias associated with your asset property. You must
  /// specify either a <code>propertyAlias</code> or both an <code>aliasId</code>
  /// and a <code>propertyId</code>. Accepts substitution templates.
  final String? propertyAlias;

  /// The ID of the asset's property. You must specify either a
  /// <code>propertyAlias</code> or both an <code>aliasId</code> and a
  /// <code>propertyId</code>. Accepts substitution templates.
  final String? propertyId;

  PutAssetPropertyValueEntry({
    required this.propertyValues,
    this.assetId,
    this.entryId,
    this.propertyAlias,
    this.propertyId,
  });

  factory PutAssetPropertyValueEntry.fromJson(Map<String, dynamic> json) {
    return PutAssetPropertyValueEntry(
      propertyValues: (json['propertyValues'] as List)
          .nonNulls
          .map((e) => AssetPropertyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      assetId: json['assetId'] as String?,
      entryId: json['entryId'] as String?,
      propertyAlias: json['propertyAlias'] as String?,
      propertyId: json['propertyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final propertyValues = this.propertyValues;
    final assetId = this.assetId;
    final entryId = this.entryId;
    final propertyAlias = this.propertyAlias;
    final propertyId = this.propertyId;
    return {
      'propertyValues': propertyValues,
      if (assetId != null) 'assetId': assetId,
      if (entryId != null) 'entryId': entryId,
      if (propertyAlias != null) 'propertyAlias': propertyAlias,
      if (propertyId != null) 'propertyId': propertyId,
    };
  }
}

/// The input for the DynamoActionVS action that specifies the DynamoDB table to
/// which the message data will be written.
class PutItemInput {
  /// The table where the message data will be written.
  final String tableName;

  PutItemInput({
    required this.tableName,
  });

  factory PutItemInput.fromJson(Map<String, dynamic> json) {
    return PutItemInput(
      tableName: json['tableName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final tableName = this.tableName;
    return {
      'tableName': tableName,
    };
  }
}

class PutVerificationStateOnViolationResponse {
  PutVerificationStateOnViolationResponse();

  factory PutVerificationStateOnViolationResponse.fromJson(
      Map<String, dynamic> _) {
    return PutVerificationStateOnViolationResponse();
  }
}

/// Allows you to define a criteria to initiate the increase in rate of rollout
/// for a job.
class RateIncreaseCriteria {
  /// The threshold for number of notified things that will initiate the increase
  /// in rate of rollout.
  final int? numberOfNotifiedThings;

  /// The threshold for number of succeeded things that will initiate the increase
  /// in rate of rollout.
  final int? numberOfSucceededThings;

  RateIncreaseCriteria({
    this.numberOfNotifiedThings,
    this.numberOfSucceededThings,
  });

  factory RateIncreaseCriteria.fromJson(Map<String, dynamic> json) {
    return RateIncreaseCriteria(
      numberOfNotifiedThings: json['numberOfNotifiedThings'] as int?,
      numberOfSucceededThings: json['numberOfSucceededThings'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfNotifiedThings = this.numberOfNotifiedThings;
    final numberOfSucceededThings = this.numberOfSucceededThings;
    return {
      if (numberOfNotifiedThings != null)
        'numberOfNotifiedThings': numberOfNotifiedThings,
      if (numberOfSucceededThings != null)
        'numberOfSucceededThings': numberOfSucceededThings,
    };
  }
}

/// The output from the RegisterCACertificateResponse operation.
class RegisterCACertificateResponse {
  /// The CA certificate ARN.
  final String? certificateArn;

  /// The CA certificate identifier.
  final String? certificateId;

  RegisterCACertificateResponse({
    this.certificateArn,
    this.certificateId,
  });

  factory RegisterCACertificateResponse.fromJson(Map<String, dynamic> json) {
    return RegisterCACertificateResponse(
      certificateArn: json['certificateArn'] as String?,
      certificateId: json['certificateId'] as String?,
    );
  }
}

/// The output from the RegisterCertificate operation.
class RegisterCertificateResponse {
  /// The certificate ARN.
  final String? certificateArn;

  /// The certificate identifier.
  final String? certificateId;

  RegisterCertificateResponse({
    this.certificateArn,
    this.certificateId,
  });

  factory RegisterCertificateResponse.fromJson(Map<String, dynamic> json) {
    return RegisterCertificateResponse(
      certificateArn: json['certificateArn'] as String?,
      certificateId: json['certificateId'] as String?,
    );
  }
}

class RegisterCertificateWithoutCAResponse {
  /// The Amazon Resource Name (ARN) of the registered certificate.
  final String? certificateArn;

  /// The ID of the registered certificate. (The last part of the certificate ARN
  /// contains the certificate ID.
  final String? certificateId;

  RegisterCertificateWithoutCAResponse({
    this.certificateArn,
    this.certificateId,
  });

  factory RegisterCertificateWithoutCAResponse.fromJson(
      Map<String, dynamic> json) {
    return RegisterCertificateWithoutCAResponse(
      certificateArn: json['certificateArn'] as String?,
      certificateId: json['certificateId'] as String?,
    );
  }
}

class RegisterThingResponse {
  /// The certificate data, in PEM format.
  final String? certificatePem;

  /// ARNs for the generated resources.
  final Map<String, String>? resourceArns;

  RegisterThingResponse({
    this.certificatePem,
    this.resourceArns,
  });

  factory RegisterThingResponse.fromJson(Map<String, dynamic> json) {
    return RegisterThingResponse(
      certificatePem: json['certificatePem'] as String?,
      resourceArns: (json['resourceArns'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

/// The registration configuration.
class RegistrationConfig {
  /// The ARN of the role.
  final String? roleArn;

  /// The template body.
  final String? templateBody;

  /// The name of the provisioning template.
  final String? templateName;

  RegistrationConfig({
    this.roleArn,
    this.templateBody,
    this.templateName,
  });

  factory RegistrationConfig.fromJson(Map<String, dynamic> json) {
    return RegistrationConfig(
      roleArn: json['roleArn'] as String?,
      templateBody: json['templateBody'] as String?,
      templateName: json['templateName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final templateBody = this.templateBody;
    final templateName = this.templateName;
    return {
      if (roleArn != null) 'roleArn': roleArn,
      if (templateBody != null) 'templateBody': templateBody,
      if (templateName != null) 'templateName': templateName,
    };
  }
}

/// Information about a related resource.
class RelatedResource {
  /// Other information about the resource.
  final Map<String, String>? additionalInfo;

  /// Information that identifies the resource.
  final ResourceIdentifier? resourceIdentifier;

  /// The type of resource.
  final ResourceType? resourceType;

  RelatedResource({
    this.additionalInfo,
    this.resourceIdentifier,
    this.resourceType,
  });

  factory RelatedResource.fromJson(Map<String, dynamic> json) {
    return RelatedResource(
      additionalInfo: (json['additionalInfo'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resourceIdentifier: json['resourceIdentifier'] != null
          ? ResourceIdentifier.fromJson(
              json['resourceIdentifier'] as Map<String, dynamic>)
          : null,
      resourceType:
          (json['resourceType'] as String?)?.let(ResourceType.fromString),
    );
  }
}

class RemoveThingFromBillingGroupResponse {
  RemoveThingFromBillingGroupResponse();

  factory RemoveThingFromBillingGroupResponse.fromJson(Map<String, dynamic> _) {
    return RemoveThingFromBillingGroupResponse();
  }
}

class RemoveThingFromThingGroupResponse {
  RemoveThingFromThingGroupResponse();

  factory RemoveThingFromThingGroupResponse.fromJson(Map<String, dynamic> _) {
    return RemoveThingFromThingGroupResponse();
  }
}

/// Parameters to define a mitigation action that adds a blank policy to
/// restrict permissions.
class ReplaceDefaultPolicyVersionParams {
  /// The name of the template to be applied. The only supported value is
  /// <code>BLANK_POLICY</code>.
  final PolicyTemplateName templateName;

  ReplaceDefaultPolicyVersionParams({
    required this.templateName,
  });

  factory ReplaceDefaultPolicyVersionParams.fromJson(
      Map<String, dynamic> json) {
    return ReplaceDefaultPolicyVersionParams(
      templateName:
          PolicyTemplateName.fromString((json['templateName'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final templateName = this.templateName;
    return {
      'templateName': templateName.value,
    };
  }
}

enum ReportType {
  errors('ERRORS'),
  results('RESULTS'),
  ;

  final String value;

  const ReportType(this.value);

  static ReportType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ReportType'));
}

/// Describes an action to republish to another topic.
class RepublishAction {
  /// The ARN of the IAM role that grants access.
  final String roleArn;

  /// The name of the MQTT topic.
  final String topic;

  /// MQTT Version 5.0 headers information. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/mqtt.html">
  /// MQTT</a> from the Amazon Web Services IoT Core Developer Guide.
  final MqttHeaders? headers;

  /// The Quality of Service (QoS) level to use when republishing messages. The
  /// default value is 0.
  final int? qos;

  RepublishAction({
    required this.roleArn,
    required this.topic,
    this.headers,
    this.qos,
  });

  factory RepublishAction.fromJson(Map<String, dynamic> json) {
    return RepublishAction(
      roleArn: json['roleArn'] as String,
      topic: json['topic'] as String,
      headers: json['headers'] != null
          ? MqttHeaders.fromJson(json['headers'] as Map<String, dynamic>)
          : null,
      qos: json['qos'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final topic = this.topic;
    final headers = this.headers;
    final qos = this.qos;
    return {
      'roleArn': roleArn,
      'topic': topic,
      if (headers != null) 'headers': headers,
      if (qos != null) 'qos': qos,
    };
  }
}

/// Information that identifies the noncompliant resource.
class ResourceIdentifier {
  /// The account with which the resource is associated.
  final String? account;

  /// The ID of the CA certificate used to authorize the certificate.
  final String? caCertificateId;

  /// The client ID.
  final String? clientId;

  /// The ID of the Amazon Cognito identity pool.
  final String? cognitoIdentityPoolId;

  /// The ARN of the identified device certificate.
  final String? deviceCertificateArn;

  /// The ID of the certificate attached to the resource.
  final String? deviceCertificateId;

  /// The ARN of the IAM role that has overly permissive actions.
  final String? iamRoleArn;

  /// The issuer certificate identifier.
  final IssuerCertificateIdentifier? issuerCertificateIdentifier;

  /// The version of the policy associated with the resource.
  final PolicyVersionIdentifier? policyVersionIdentifier;

  /// The ARN of the role alias that has overly permissive actions.
  final String? roleAliasArn;

  ResourceIdentifier({
    this.account,
    this.caCertificateId,
    this.clientId,
    this.cognitoIdentityPoolId,
    this.deviceCertificateArn,
    this.deviceCertificateId,
    this.iamRoleArn,
    this.issuerCertificateIdentifier,
    this.policyVersionIdentifier,
    this.roleAliasArn,
  });

  factory ResourceIdentifier.fromJson(Map<String, dynamic> json) {
    return ResourceIdentifier(
      account: json['account'] as String?,
      caCertificateId: json['caCertificateId'] as String?,
      clientId: json['clientId'] as String?,
      cognitoIdentityPoolId: json['cognitoIdentityPoolId'] as String?,
      deviceCertificateArn: json['deviceCertificateArn'] as String?,
      deviceCertificateId: json['deviceCertificateId'] as String?,
      iamRoleArn: json['iamRoleArn'] as String?,
      issuerCertificateIdentifier: json['issuerCertificateIdentifier'] != null
          ? IssuerCertificateIdentifier.fromJson(
              json['issuerCertificateIdentifier'] as Map<String, dynamic>)
          : null,
      policyVersionIdentifier: json['policyVersionIdentifier'] != null
          ? PolicyVersionIdentifier.fromJson(
              json['policyVersionIdentifier'] as Map<String, dynamic>)
          : null,
      roleAliasArn: json['roleAliasArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    final caCertificateId = this.caCertificateId;
    final clientId = this.clientId;
    final cognitoIdentityPoolId = this.cognitoIdentityPoolId;
    final deviceCertificateArn = this.deviceCertificateArn;
    final deviceCertificateId = this.deviceCertificateId;
    final iamRoleArn = this.iamRoleArn;
    final issuerCertificateIdentifier = this.issuerCertificateIdentifier;
    final policyVersionIdentifier = this.policyVersionIdentifier;
    final roleAliasArn = this.roleAliasArn;
    return {
      if (account != null) 'account': account,
      if (caCertificateId != null) 'caCertificateId': caCertificateId,
      if (clientId != null) 'clientId': clientId,
      if (cognitoIdentityPoolId != null)
        'cognitoIdentityPoolId': cognitoIdentityPoolId,
      if (deviceCertificateArn != null)
        'deviceCertificateArn': deviceCertificateArn,
      if (deviceCertificateId != null)
        'deviceCertificateId': deviceCertificateId,
      if (iamRoleArn != null) 'iamRoleArn': iamRoleArn,
      if (issuerCertificateIdentifier != null)
        'issuerCertificateIdentifier': issuerCertificateIdentifier,
      if (policyVersionIdentifier != null)
        'policyVersionIdentifier': policyVersionIdentifier,
      if (roleAliasArn != null) 'roleAliasArn': roleAliasArn,
    };
  }
}

enum ResourceType {
  deviceCertificate('DEVICE_CERTIFICATE'),
  caCertificate('CA_CERTIFICATE'),
  iotPolicy('IOT_POLICY'),
  cognitoIdentityPool('COGNITO_IDENTITY_POOL'),
  clientId('CLIENT_ID'),
  accountSettings('ACCOUNT_SETTINGS'),
  roleAlias('ROLE_ALIAS'),
  iamRole('IAM_ROLE'),
  issuerCertificate('ISSUER_CERTIFICATE'),
  ;

  final String value;

  const ResourceType(this.value);

  static ResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ResourceType'));
}

/// The criteria that determines how many retries are allowed for each failure
/// type for a job.
class RetryCriteria {
  /// The type of job execution failures that can initiate a job retry.
  final RetryableFailureType failureType;

  /// The number of retries allowed for a failure type for the job.
  final int numberOfRetries;

  RetryCriteria({
    required this.failureType,
    required this.numberOfRetries,
  });

  factory RetryCriteria.fromJson(Map<String, dynamic> json) {
    return RetryCriteria(
      failureType:
          RetryableFailureType.fromString((json['failureType'] as String)),
      numberOfRetries: json['numberOfRetries'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final failureType = this.failureType;
    final numberOfRetries = this.numberOfRetries;
    return {
      'failureType': failureType.value,
      'numberOfRetries': numberOfRetries,
    };
  }
}

enum RetryableFailureType {
  failed('FAILED'),
  timedOut('TIMED_OUT'),
  all('ALL'),
  ;

  final String value;

  const RetryableFailureType(this.value);

  static RetryableFailureType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum RetryableFailureType'));
}

/// Role alias description.
class RoleAliasDescription {
  /// The UNIX timestamp of when the role alias was created.
  final DateTime? creationDate;

  /// The number of seconds for which the credential is valid.
  final int? credentialDurationSeconds;

  /// The UNIX timestamp of when the role alias was last modified.
  final DateTime? lastModifiedDate;

  /// The role alias owner.
  final String? owner;

  /// The role alias.
  final String? roleAlias;

  /// The ARN of the role alias.
  final String? roleAliasArn;

  /// The role ARN.
  final String? roleArn;

  RoleAliasDescription({
    this.creationDate,
    this.credentialDurationSeconds,
    this.lastModifiedDate,
    this.owner,
    this.roleAlias,
    this.roleAliasArn,
    this.roleArn,
  });

  factory RoleAliasDescription.fromJson(Map<String, dynamic> json) {
    return RoleAliasDescription(
      creationDate: timeStampFromJson(json['creationDate']),
      credentialDurationSeconds: json['credentialDurationSeconds'] as int?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      owner: json['owner'] as String?,
      roleAlias: json['roleAlias'] as String?,
      roleAliasArn: json['roleAliasArn'] as String?,
      roleArn: json['roleArn'] as String?,
    );
  }
}

/// Describes an action to write data to an Amazon S3 bucket.
class S3Action {
  /// The Amazon S3 bucket.
  final String bucketName;

  /// The object key. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/list_amazons3.html">Actions,
  /// resources, and condition keys for Amazon S3</a>.
  final String key;

  /// The ARN of the IAM role that grants access.
  final String roleArn;

  /// The Amazon S3 canned ACL that controls access to the object identified by
  /// the object key. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl">S3
  /// canned ACLs</a>.
  final CannedAccessControlList? cannedAcl;

  S3Action({
    required this.bucketName,
    required this.key,
    required this.roleArn,
    this.cannedAcl,
  });

  factory S3Action.fromJson(Map<String, dynamic> json) {
    return S3Action(
      bucketName: json['bucketName'] as String,
      key: json['key'] as String,
      roleArn: json['roleArn'] as String,
      cannedAcl: (json['cannedAcl'] as String?)
          ?.let(CannedAccessControlList.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final key = this.key;
    final roleArn = this.roleArn;
    final cannedAcl = this.cannedAcl;
    return {
      'bucketName': bucketName,
      'key': key,
      'roleArn': roleArn,
      if (cannedAcl != null) 'cannedAcl': cannedAcl.value,
    };
  }
}

/// Describes the location of updated firmware in S3.
class S3Destination {
  /// The S3 bucket that contains the updated firmware.
  final String? bucket;

  /// The S3 prefix.
  final String? prefix;

  S3Destination({
    this.bucket,
    this.prefix,
  });

  factory S3Destination.fromJson(Map<String, dynamic> json) {
    return S3Destination(
      bucket: json['bucket'] as String?,
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final prefix = this.prefix;
    return {
      if (bucket != null) 'bucket': bucket,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// The S3 location.
class S3Location {
  /// The S3 bucket.
  final String? bucket;

  /// The S3 key.
  final String? key;

  /// The S3 bucket version.
  final String? version;

  S3Location({
    this.bucket,
    this.key,
    this.version,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      bucket: json['bucket'] as String?,
      key: json['key'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    final version = this.version;
    return {
      if (bucket != null) 'bucket': bucket,
      if (key != null) 'key': key,
      if (version != null) 'version': version,
    };
  }
}

/// Describes an action to write a message to a Salesforce IoT Cloud Input
/// Stream.
class SalesforceAction {
  /// The token used to authenticate access to the Salesforce IoT Cloud Input
  /// Stream. The token is available from the Salesforce IoT Cloud platform after
  /// creation of the Input Stream.
  final String token;

  /// The URL exposed by the Salesforce IoT Cloud Input Stream. The URL is
  /// available from the Salesforce IoT Cloud platform after creation of the Input
  /// Stream.
  final String url;

  SalesforceAction({
    required this.token,
    required this.url,
  });

  factory SalesforceAction.fromJson(Map<String, dynamic> json) {
    return SalesforceAction(
      token: json['token'] as String,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final token = this.token;
    final url = this.url;
    return {
      'token': token,
      'url': url,
    };
  }
}

/// Information about the scheduled audit.
class ScheduledAuditMetadata {
  /// The day of the month on which the scheduled audit is run (if the
  /// <code>frequency</code> is "MONTHLY"). If days 29-31 are specified, and the
  /// month does not have that many days, the audit takes place on the "LAST" day
  /// of the month.
  final String? dayOfMonth;

  /// The day of the week on which the scheduled audit is run (if the
  /// <code>frequency</code> is "WEEKLY" or "BIWEEKLY").
  final DayOfWeek? dayOfWeek;

  /// How often the scheduled audit occurs.
  final AuditFrequency? frequency;

  /// The ARN of the scheduled audit.
  final String? scheduledAuditArn;

  /// The name of the scheduled audit.
  final String? scheduledAuditName;

  ScheduledAuditMetadata({
    this.dayOfMonth,
    this.dayOfWeek,
    this.frequency,
    this.scheduledAuditArn,
    this.scheduledAuditName,
  });

  factory ScheduledAuditMetadata.fromJson(Map<String, dynamic> json) {
    return ScheduledAuditMetadata(
      dayOfMonth: json['dayOfMonth'] as String?,
      dayOfWeek: (json['dayOfWeek'] as String?)?.let(DayOfWeek.fromString),
      frequency: (json['frequency'] as String?)?.let(AuditFrequency.fromString),
      scheduledAuditArn: json['scheduledAuditArn'] as String?,
      scheduledAuditName: json['scheduledAuditName'] as String?,
    );
  }
}

/// Displays the next seven maintenance window occurrences and their start
/// times.
class ScheduledJobRollout {
  /// Displays the start times of the next seven maintenance window occurrences.
  final String? startTime;

  ScheduledJobRollout({
    this.startTime,
  });

  factory ScheduledJobRollout.fromJson(Map<String, dynamic> json) {
    return ScheduledJobRollout(
      startTime: json['startTime'] as String?,
    );
  }
}

/// Specifies the date and time that a job will begin the rollout of the job
/// document to all devices in the target group. Additionally, you can specify
/// the end behavior for each job execution when it reaches the scheduled end
/// time.
class SchedulingConfig {
  /// Specifies the end behavior for all job executions after a job reaches the
  /// selected <code>endTime</code>. If <code>endTime</code> is not selected when
  /// creating the job, then <code>endBehavior</code> does not apply.
  final JobEndBehavior? endBehavior;

  /// The time a job will stop rollout of the job document to all devices in the
  /// target group for a job. The <code>endTime</code> must take place no later
  /// than two years from the current time and be scheduled a minimum of thirty
  /// minutes from the current time. The minimum duration between
  /// <code>startTime</code> and <code>endTime</code> is thirty minutes. The
  /// maximum duration between <code>startTime</code> and <code>endTime</code> is
  /// two years. The date and time format for the <code>endTime</code> is
  /// YYYY-MM-DD for the date and HH:MM for the time.
  ///
  /// For more information on the syntax for <code>endTime</code> when using an
  /// API command or the Command Line Interface, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-types.html#parameter-type-timestamp">Timestamp</a>.
  final String? endTime;

  /// An optional configuration within the <code>SchedulingConfig</code> to setup
  /// a recurring maintenance window with a predetermined start time and duration
  /// for the rollout of a job document to all devices in a target group for a
  /// job.
  final List<MaintenanceWindow>? maintenanceWindows;

  /// The time a job will begin rollout of the job document to all devices in the
  /// target group for a job. The <code>startTime</code> can be scheduled up to a
  /// year in advance and must be scheduled a minimum of thirty minutes from the
  /// current time. The date and time format for the <code>startTime</code> is
  /// YYYY-MM-DD for the date and HH:MM for the time.
  ///
  /// For more information on the syntax for <code>startTime</code> when using an
  /// API command or the Command Line Interface, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-types.html#parameter-type-timestamp">Timestamp</a>.
  final String? startTime;

  SchedulingConfig({
    this.endBehavior,
    this.endTime,
    this.maintenanceWindows,
    this.startTime,
  });

  factory SchedulingConfig.fromJson(Map<String, dynamic> json) {
    return SchedulingConfig(
      endBehavior:
          (json['endBehavior'] as String?)?.let(JobEndBehavior.fromString),
      endTime: json['endTime'] as String?,
      maintenanceWindows: (json['maintenanceWindows'] as List?)
          ?.nonNulls
          .map((e) => MaintenanceWindow.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: json['startTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endBehavior = this.endBehavior;
    final endTime = this.endTime;
    final maintenanceWindows = this.maintenanceWindows;
    final startTime = this.startTime;
    return {
      if (endBehavior != null) 'endBehavior': endBehavior.value,
      if (endTime != null) 'endTime': endTime,
      if (maintenanceWindows != null) 'maintenanceWindows': maintenanceWindows,
      if (startTime != null) 'startTime': startTime,
    };
  }
}

class SearchIndexResponse {
  /// The token used to get the next set of results, or <code>null</code> if there
  /// are no additional results.
  final String? nextToken;

  /// The thing groups that match the search query.
  final List<ThingGroupDocument>? thingGroups;

  /// The things that match the search query.
  final List<ThingDocument>? things;

  SearchIndexResponse({
    this.nextToken,
    this.thingGroups,
    this.things,
  });

  factory SearchIndexResponse.fromJson(Map<String, dynamic> json) {
    return SearchIndexResponse(
      nextToken: json['nextToken'] as String?,
      thingGroups: (json['thingGroups'] as List?)
          ?.nonNulls
          .map((e) => ThingGroupDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      things: (json['things'] as List?)
          ?.nonNulls
          .map((e) => ThingDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Identifying information for a Device Defender security profile.
class SecurityProfileIdentifier {
  /// The ARN of the security profile.
  final String arn;

  /// The name you've given to the security profile.
  final String name;

  SecurityProfileIdentifier({
    required this.arn,
    required this.name,
  });

  factory SecurityProfileIdentifier.fromJson(Map<String, dynamic> json) {
    return SecurityProfileIdentifier(
      arn: json['arn'] as String,
      name: json['name'] as String,
    );
  }
}

/// A target to which an alert is sent when a security profile behavior is
/// violated.
class SecurityProfileTarget {
  /// The ARN of the security profile.
  final String arn;

  SecurityProfileTarget({
    required this.arn,
  });

  factory SecurityProfileTarget.fromJson(Map<String, dynamic> json) {
    return SecurityProfileTarget(
      arn: json['arn'] as String,
    );
  }
}

/// Information about a security profile and the target associated with it.
class SecurityProfileTargetMapping {
  /// Information that identifies the security profile.
  final SecurityProfileIdentifier? securityProfileIdentifier;

  /// Information about the target (thing group) associated with the security
  /// profile.
  final SecurityProfileTarget? target;

  SecurityProfileTargetMapping({
    this.securityProfileIdentifier,
    this.target,
  });

  factory SecurityProfileTargetMapping.fromJson(Map<String, dynamic> json) {
    return SecurityProfileTargetMapping(
      securityProfileIdentifier: json['securityProfileIdentifier'] != null
          ? SecurityProfileIdentifier.fromJson(
              json['securityProfileIdentifier'] as Map<String, dynamic>)
          : null,
      target: json['target'] != null
          ? SecurityProfileTarget.fromJson(
              json['target'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// The server certificate configuration.
class ServerCertificateConfig {
  /// A Boolean value that indicates whether Online Certificate Status Protocol
  /// (OCSP) server certificate check is enabled or not.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-custom-domain-ocsp-config.html">Configuring
  /// OCSP server-certificate stapling in domain configuration</a> from Amazon Web
  /// Services IoT Core Developer Guide.
  final bool? enableOCSPCheck;

  ServerCertificateConfig({
    this.enableOCSPCheck,
  });

  factory ServerCertificateConfig.fromJson(Map<String, dynamic> json) {
    return ServerCertificateConfig(
      enableOCSPCheck: json['enableOCSPCheck'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableOCSPCheck = this.enableOCSPCheck;
    return {
      if (enableOCSPCheck != null) 'enableOCSPCheck': enableOCSPCheck,
    };
  }
}

enum ServerCertificateStatus {
  invalid('INVALID'),
  valid('VALID'),
  ;

  final String value;

  const ServerCertificateStatus(this.value);

  static ServerCertificateStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ServerCertificateStatus'));
}

/// An object that contains information about a server certificate.
class ServerCertificateSummary {
  /// The ARN of the server certificate.
  final String? serverCertificateArn;

  /// The status of the server certificate.
  final ServerCertificateStatus? serverCertificateStatus;

  /// Details that explain the status of the server certificate.
  final String? serverCertificateStatusDetail;

  ServerCertificateSummary({
    this.serverCertificateArn,
    this.serverCertificateStatus,
    this.serverCertificateStatusDetail,
  });

  factory ServerCertificateSummary.fromJson(Map<String, dynamic> json) {
    return ServerCertificateSummary(
      serverCertificateArn: json['serverCertificateArn'] as String?,
      serverCertificateStatus: (json['serverCertificateStatus'] as String?)
          ?.let(ServerCertificateStatus.fromString),
      serverCertificateStatusDetail:
          json['serverCertificateStatusDetail'] as String?,
    );
  }
}

enum ServiceType {
  data('DATA'),
  credentialProvider('CREDENTIAL_PROVIDER'),
  jobs('JOBS'),
  ;

  final String value;

  const ServiceType(this.value);

  static ServiceType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ServiceType'));
}

class SetDefaultAuthorizerResponse {
  /// The authorizer ARN.
  final String? authorizerArn;

  /// The authorizer name.
  final String? authorizerName;

  SetDefaultAuthorizerResponse({
    this.authorizerArn,
    this.authorizerName,
  });

  factory SetDefaultAuthorizerResponse.fromJson(Map<String, dynamic> json) {
    return SetDefaultAuthorizerResponse(
      authorizerArn: json['authorizerArn'] as String?,
      authorizerName: json['authorizerName'] as String?,
    );
  }
}

/// For more information, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
/// Version 4 signing process</a>.
class SigV4Authorization {
  /// The ARN of the signing role.
  final String roleArn;

  /// The service name to use while signing with Sig V4.
  final String serviceName;

  /// The signing region.
  final String signingRegion;

  SigV4Authorization({
    required this.roleArn,
    required this.serviceName,
    required this.signingRegion,
  });

  factory SigV4Authorization.fromJson(Map<String, dynamic> json) {
    return SigV4Authorization(
      roleArn: json['roleArn'] as String,
      serviceName: json['serviceName'] as String,
      signingRegion: json['signingRegion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final serviceName = this.serviceName;
    final signingRegion = this.signingRegion;
    return {
      'roleArn': roleArn,
      'serviceName': serviceName,
      'signingRegion': signingRegion,
    };
  }
}

/// Describes the code-signing profile.
class SigningProfileParameter {
  /// Certificate ARN.
  final String? certificateArn;

  /// The location of the code-signing certificate on your device.
  final String? certificatePathOnDevice;

  /// The hardware platform of your device.
  final String? platform;

  SigningProfileParameter({
    this.certificateArn,
    this.certificatePathOnDevice,
    this.platform,
  });

  factory SigningProfileParameter.fromJson(Map<String, dynamic> json) {
    return SigningProfileParameter(
      certificateArn: json['certificateArn'] as String?,
      certificatePathOnDevice: json['certificatePathOnDevice'] as String?,
      platform: json['platform'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final certificatePathOnDevice = this.certificatePathOnDevice;
    final platform = this.platform;
    return {
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (certificatePathOnDevice != null)
        'certificatePathOnDevice': certificatePathOnDevice,
      if (platform != null) 'platform': platform,
    };
  }
}

/// Describes an action to publish to an Amazon SNS topic.
class SnsAction {
  /// The ARN of the IAM role that grants access.
  final String roleArn;

  /// The ARN of the SNS topic.
  final String targetArn;

  /// (Optional) The message format of the message to publish. Accepted values are
  /// "JSON" and "RAW". The default value of the attribute is "RAW". SNS uses this
  /// setting to determine if the payload should be parsed and relevant
  /// platform-specific bits of the payload should be extracted. To read more
  /// about SNS message formats, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/json-formats.html">https://docs.aws.amazon.com/sns/latest/dg/json-formats.html</a>
  /// refer to their official documentation.
  final MessageFormat? messageFormat;

  SnsAction({
    required this.roleArn,
    required this.targetArn,
    this.messageFormat,
  });

  factory SnsAction.fromJson(Map<String, dynamic> json) {
    return SnsAction(
      roleArn: json['roleArn'] as String,
      targetArn: json['targetArn'] as String,
      messageFormat:
          (json['messageFormat'] as String?)?.let(MessageFormat.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final targetArn = this.targetArn;
    final messageFormat = this.messageFormat;
    return {
      'roleArn': roleArn,
      'targetArn': targetArn,
      if (messageFormat != null) 'messageFormat': messageFormat.value,
    };
  }
}

/// Describes an action to publish data to an Amazon SQS queue.
class SqsAction {
  /// The URL of the Amazon SQS queue.
  final String queueUrl;

  /// The ARN of the IAM role that grants access.
  final String roleArn;

  /// Specifies whether to use Base64 encoding.
  final bool? useBase64;

  SqsAction({
    required this.queueUrl,
    required this.roleArn,
    this.useBase64,
  });

  factory SqsAction.fromJson(Map<String, dynamic> json) {
    return SqsAction(
      queueUrl: json['queueUrl'] as String,
      roleArn: json['roleArn'] as String,
      useBase64: json['useBase64'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final queueUrl = this.queueUrl;
    final roleArn = this.roleArn;
    final useBase64 = this.useBase64;
    return {
      'queueUrl': queueUrl,
      'roleArn': roleArn,
      if (useBase64 != null) 'useBase64': useBase64,
    };
  }
}

class StartAuditMitigationActionsTaskResponse {
  /// The unique identifier for the audit mitigation task. This matches the
  /// <code>taskId</code> that you specified in the request.
  final String? taskId;

  StartAuditMitigationActionsTaskResponse({
    this.taskId,
  });

  factory StartAuditMitigationActionsTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return StartAuditMitigationActionsTaskResponse(
      taskId: json['taskId'] as String?,
    );
  }
}

class StartDetectMitigationActionsTaskResponse {
  /// The unique identifier of the task.
  final String? taskId;

  StartDetectMitigationActionsTaskResponse({
    this.taskId,
  });

  factory StartDetectMitigationActionsTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return StartDetectMitigationActionsTaskResponse(
      taskId: json['taskId'] as String?,
    );
  }
}

class StartOnDemandAuditTaskResponse {
  /// The ID of the on-demand audit you started.
  final String? taskId;

  StartOnDemandAuditTaskResponse({
    this.taskId,
  });

  factory StartOnDemandAuditTaskResponse.fromJson(Map<String, dynamic> json) {
    return StartOnDemandAuditTaskResponse(
      taskId: json['taskId'] as String?,
    );
  }
}

/// Information required to start a signing job.
class StartSigningJobParameter {
  /// The location to write the code-signed file.
  final Destination? destination;

  /// The code-signing profile name.
  final String? signingProfileName;

  /// Describes the code-signing profile.
  final SigningProfileParameter? signingProfileParameter;

  StartSigningJobParameter({
    this.destination,
    this.signingProfileName,
    this.signingProfileParameter,
  });

  factory StartSigningJobParameter.fromJson(Map<String, dynamic> json) {
    return StartSigningJobParameter(
      destination: json['destination'] != null
          ? Destination.fromJson(json['destination'] as Map<String, dynamic>)
          : null,
      signingProfileName: json['signingProfileName'] as String?,
      signingProfileParameter: json['signingProfileParameter'] != null
          ? SigningProfileParameter.fromJson(
              json['signingProfileParameter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final signingProfileName = this.signingProfileName;
    final signingProfileParameter = this.signingProfileParameter;
    return {
      if (destination != null) 'destination': destination,
      if (signingProfileName != null) 'signingProfileName': signingProfileName,
      if (signingProfileParameter != null)
        'signingProfileParameter': signingProfileParameter,
    };
  }
}

class StartThingRegistrationTaskResponse {
  /// The bulk thing provisioning task ID.
  final String? taskId;

  StartThingRegistrationTaskResponse({
    this.taskId,
  });

  factory StartThingRegistrationTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return StartThingRegistrationTaskResponse(
      taskId: json['taskId'] as String?,
    );
  }
}

/// A statistical ranking (percentile) that indicates a threshold value by which
/// a behavior is determined to be in compliance or in violation of the
/// behavior.
class StatisticalThreshold {
  /// The percentile that resolves to a threshold value by which compliance with a
  /// behavior is determined. Metrics are collected over the specified period
  /// (<code>durationSeconds</code>) from all reporting devices in your account
  /// and statistical ranks are calculated. Then, the measurements from a device
  /// are collected over the same period. If the accumulated measurements from the
  /// device fall above or below (<code>comparisonOperator</code>) the value
  /// associated with the percentile specified, then the device is considered to
  /// be in compliance with the behavior, otherwise a violation occurs.
  final String? statistic;

  StatisticalThreshold({
    this.statistic,
  });

  factory StatisticalThreshold.fromJson(Map<String, dynamic> json) {
    return StatisticalThreshold(
      statistic: json['statistic'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statistic = this.statistic;
    return {
      if (statistic != null) 'statistic': statistic,
    };
  }
}

/// A map of key-value pairs for all supported statistics. For issues with
/// missing or unexpected values for this API, consult <a
/// href="https://docs.aws.amazon.com/iot/latest/developerguide/fleet-indexing-troubleshooting.html">
/// Fleet indexing troubleshooting guide</a>.
class Statistics {
  /// The average of the aggregated field values.
  final double? average;

  /// The count of things that match the query string criteria and contain a valid
  /// aggregation field value.
  final int? count;

  /// The maximum aggregated field value.
  final double? maximum;

  /// The minimum aggregated field value.
  final double? minimum;

  /// The standard deviation of the aggregated field values.
  final double? stdDeviation;

  /// The sum of the aggregated field values.
  final double? sum;

  /// The sum of the squares of the aggregated field values.
  final double? sumOfSquares;

  /// The variance of the aggregated field values.
  final double? variance;

  Statistics({
    this.average,
    this.count,
    this.maximum,
    this.minimum,
    this.stdDeviation,
    this.sum,
    this.sumOfSquares,
    this.variance,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      average: json['average'] as double?,
      count: json['count'] as int?,
      maximum: json['maximum'] as double?,
      minimum: json['minimum'] as double?,
      stdDeviation: json['stdDeviation'] as double?,
      sum: json['sum'] as double?,
      sumOfSquares: json['sumOfSquares'] as double?,
      variance: json['variance'] as double?,
    );
  }
}

enum Status {
  inProgress('InProgress'),
  completed('Completed'),
  failed('Failed'),
  cancelled('Cancelled'),
  cancelling('Cancelling'),
  ;

  final String value;

  const Status(this.value);

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Status'));
}

/// Starts execution of a Step Functions state machine.
class StepFunctionsAction {
  /// The ARN of the role that grants IoT permission to start execution of a state
  /// machine ("Action":"states:StartExecution").
  final String roleArn;

  /// The name of the Step Functions state machine whose execution will be
  /// started.
  final String stateMachineName;

  /// (Optional) A name will be given to the state machine execution consisting of
  /// this prefix followed by a UUID. Step Functions automatically creates a
  /// unique name for each state machine execution if one is not provided.
  final String? executionNamePrefix;

  StepFunctionsAction({
    required this.roleArn,
    required this.stateMachineName,
    this.executionNamePrefix,
  });

  factory StepFunctionsAction.fromJson(Map<String, dynamic> json) {
    return StepFunctionsAction(
      roleArn: json['roleArn'] as String,
      stateMachineName: json['stateMachineName'] as String,
      executionNamePrefix: json['executionNamePrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final stateMachineName = this.stateMachineName;
    final executionNamePrefix = this.executionNamePrefix;
    return {
      'roleArn': roleArn,
      'stateMachineName': stateMachineName,
      if (executionNamePrefix != null)
        'executionNamePrefix': executionNamePrefix,
    };
  }
}

class StopThingRegistrationTaskResponse {
  StopThingRegistrationTaskResponse();

  factory StopThingRegistrationTaskResponse.fromJson(Map<String, dynamic> _) {
    return StopThingRegistrationTaskResponse();
  }
}

/// Describes a group of files that can be streamed.
class Stream {
  /// The ID of a file associated with a stream.
  final int? fileId;

  /// The stream ID.
  final String? streamId;

  Stream({
    this.fileId,
    this.streamId,
  });

  factory Stream.fromJson(Map<String, dynamic> json) {
    return Stream(
      fileId: json['fileId'] as int?,
      streamId: json['streamId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileId = this.fileId;
    final streamId = this.streamId;
    return {
      if (fileId != null) 'fileId': fileId,
      if (streamId != null) 'streamId': streamId,
    };
  }
}

/// Represents a file to stream.
class StreamFile {
  /// The file ID.
  final int? fileId;

  /// The location of the file in S3.
  final S3Location? s3Location;

  StreamFile({
    this.fileId,
    this.s3Location,
  });

  factory StreamFile.fromJson(Map<String, dynamic> json) {
    return StreamFile(
      fileId: json['fileId'] as int?,
      s3Location: json['s3Location'] != null
          ? S3Location.fromJson(json['s3Location'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fileId = this.fileId;
    final s3Location = this.s3Location;
    return {
      if (fileId != null) 'fileId': fileId,
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

/// Information about a stream.
class StreamInfo {
  /// The date when the stream was created.
  final DateTime? createdAt;

  /// The description of the stream.
  final String? description;

  /// The files to stream.
  final List<StreamFile>? files;

  /// The date when the stream was last updated.
  final DateTime? lastUpdatedAt;

  /// An IAM role IoT assumes to access your S3 files.
  final String? roleArn;

  /// The stream ARN.
  final String? streamArn;

  /// The stream ID.
  final String? streamId;

  /// The stream version.
  final int? streamVersion;

  StreamInfo({
    this.createdAt,
    this.description,
    this.files,
    this.lastUpdatedAt,
    this.roleArn,
    this.streamArn,
    this.streamId,
    this.streamVersion,
  });

  factory StreamInfo.fromJson(Map<String, dynamic> json) {
    return StreamInfo(
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      files: (json['files'] as List?)
          ?.nonNulls
          .map((e) => StreamFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      roleArn: json['roleArn'] as String?,
      streamArn: json['streamArn'] as String?,
      streamId: json['streamId'] as String?,
      streamVersion: json['streamVersion'] as int?,
    );
  }
}

/// A summary of a stream.
class StreamSummary {
  /// A description of the stream.
  final String? description;

  /// The stream ARN.
  final String? streamArn;

  /// The stream ID.
  final String? streamId;

  /// The stream version.
  final int? streamVersion;

  StreamSummary({
    this.description,
    this.streamArn,
    this.streamId,
    this.streamVersion,
  });

  factory StreamSummary.fromJson(Map<String, dynamic> json) {
    return StreamSummary(
      description: json['description'] as String?,
      streamArn: json['streamArn'] as String?,
      streamId: json['streamId'] as String?,
      streamVersion: json['streamVersion'] as int?,
    );
  }
}

/// A set of key/value pairs that are used to manage the resource.
class Tag {
  /// The tag's key.
  final String key;

  /// The tag's value.
  final String? value;

  Tag({
    required this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }
}

enum TargetFieldOrder {
  latLon('LatLon'),
  lonLat('LonLat'),
  ;

  final String value;

  const TargetFieldOrder(this.value);

  static TargetFieldOrder fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum TargetFieldOrder'));
}

enum TargetSelection {
  continuous('CONTINUOUS'),
  snapshot('SNAPSHOT'),
  ;

  final String value;

  const TargetSelection(this.value);

  static TargetSelection fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum TargetSelection'));
}

/// Statistics for the checks performed during the audit.
class TaskStatistics {
  /// The number of checks that did not run because the audit was canceled.
  final int? canceledChecks;

  /// The number of checks that found compliant resources.
  final int? compliantChecks;

  /// The number of checks.
  final int? failedChecks;

  /// The number of checks in progress.
  final int? inProgressChecks;

  /// The number of checks that found noncompliant resources.
  final int? nonCompliantChecks;

  /// The number of checks in this audit.
  final int? totalChecks;

  /// The number of checks waiting for data collection.
  final int? waitingForDataCollectionChecks;

  TaskStatistics({
    this.canceledChecks,
    this.compliantChecks,
    this.failedChecks,
    this.inProgressChecks,
    this.nonCompliantChecks,
    this.totalChecks,
    this.waitingForDataCollectionChecks,
  });

  factory TaskStatistics.fromJson(Map<String, dynamic> json) {
    return TaskStatistics(
      canceledChecks: json['canceledChecks'] as int?,
      compliantChecks: json['compliantChecks'] as int?,
      failedChecks: json['failedChecks'] as int?,
      inProgressChecks: json['inProgressChecks'] as int?,
      nonCompliantChecks: json['nonCompliantChecks'] as int?,
      totalChecks: json['totalChecks'] as int?,
      waitingForDataCollectionChecks:
          json['waitingForDataCollectionChecks'] as int?,
    );
  }
}

/// Provides summary counts of how many tasks for findings are in a particular
/// state. This information is included in the response from
/// DescribeAuditMitigationActionsTask.
class TaskStatisticsForAuditCheck {
  /// The number of findings to which the mitigation action task was canceled when
  /// applied.
  final int? canceledFindingsCount;

  /// The number of findings for which at least one of the actions failed when
  /// applied.
  final int? failedFindingsCount;

  /// The number of findings skipped because of filter conditions provided in the
  /// parameters to the command.
  final int? skippedFindingsCount;

  /// The number of findings for which all mitigation actions succeeded when
  /// applied.
  final int? succeededFindingsCount;

  /// The total number of findings to which a task is being applied.
  final int? totalFindingsCount;

  TaskStatisticsForAuditCheck({
    this.canceledFindingsCount,
    this.failedFindingsCount,
    this.skippedFindingsCount,
    this.succeededFindingsCount,
    this.totalFindingsCount,
  });

  factory TaskStatisticsForAuditCheck.fromJson(Map<String, dynamic> json) {
    return TaskStatisticsForAuditCheck(
      canceledFindingsCount: json['canceledFindingsCount'] as int?,
      failedFindingsCount: json['failedFindingsCount'] as int?,
      skippedFindingsCount: json['skippedFindingsCount'] as int?,
      succeededFindingsCount: json['succeededFindingsCount'] as int?,
      totalFindingsCount: json['totalFindingsCount'] as int?,
    );
  }
}

enum TemplateType {
  fleetProvisioning('FLEET_PROVISIONING'),
  jitp('JITP'),
  ;

  final String value;

  const TemplateType(this.value);

  static TemplateType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum TemplateType'));
}

/// Performs an aggregation that will return a list of buckets. The list of
/// buckets is a ranked list of the number of occurrences of an aggregation
/// field value.
class TermsAggregation {
  /// The number of buckets to return in the response. Default to 10.
  final int? maxBuckets;

  TermsAggregation({
    this.maxBuckets,
  });

  Map<String, dynamic> toJson() {
    final maxBuckets = this.maxBuckets;
    return {
      if (maxBuckets != null) 'maxBuckets': maxBuckets,
    };
  }
}

class TestAuthorizationResponse {
  /// The authentication results.
  final List<AuthResult>? authResults;

  TestAuthorizationResponse({
    this.authResults,
  });

  factory TestAuthorizationResponse.fromJson(Map<String, dynamic> json) {
    return TestAuthorizationResponse(
      authResults: (json['authResults'] as List?)
          ?.nonNulls
          .map((e) => AuthResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class TestInvokeAuthorizerResponse {
  /// The number of seconds after which the connection is terminated.
  final int? disconnectAfterInSeconds;

  /// True if the token is authenticated, otherwise false.
  final bool? isAuthenticated;

  /// IAM policy documents.
  final List<String>? policyDocuments;

  /// The principal ID.
  final String? principalId;

  /// The number of seconds after which the temporary credentials are refreshed.
  final int? refreshAfterInSeconds;

  TestInvokeAuthorizerResponse({
    this.disconnectAfterInSeconds,
    this.isAuthenticated,
    this.policyDocuments,
    this.principalId,
    this.refreshAfterInSeconds,
  });

  factory TestInvokeAuthorizerResponse.fromJson(Map<String, dynamic> json) {
    return TestInvokeAuthorizerResponse(
      disconnectAfterInSeconds: json['disconnectAfterInSeconds'] as int?,
      isAuthenticated: json['isAuthenticated'] as bool?,
      policyDocuments: (json['policyDocuments'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      principalId: json['principalId'] as String?,
      refreshAfterInSeconds: json['refreshAfterInSeconds'] as int?,
    );
  }
}

/// The properties of the thing, including thing name, thing type name, and a
/// list of thing attributes.
class ThingAttribute {
  /// A list of thing attributes which are name-value pairs.
  final Map<String, String>? attributes;

  /// The thing ARN.
  final String? thingArn;

  /// The name of the thing.
  final String? thingName;

  /// The name of the thing type, if the thing has been associated with a type.
  final String? thingTypeName;

  /// The version of the thing record in the registry.
  final int? version;

  ThingAttribute({
    this.attributes,
    this.thingArn,
    this.thingName,
    this.thingTypeName,
    this.version,
  });

  factory ThingAttribute.fromJson(Map<String, dynamic> json) {
    return ThingAttribute(
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      thingArn: json['thingArn'] as String?,
      thingName: json['thingName'] as String?,
      thingTypeName: json['thingTypeName'] as String?,
      version: json['version'] as int?,
    );
  }
}

/// The connectivity status of the thing.
class ThingConnectivity {
  /// True if the thing is connected to the Amazon Web Services IoT Core service;
  /// false if it is not connected.
  final bool? connected;

  /// The reason why the client is disconnected. If the thing has been
  /// disconnected for approximately an hour, the <code>disconnectReason</code>
  /// value might be missing.
  final String? disconnectReason;

  /// The epoch time (in milliseconds) when the thing last connected or
  /// disconnected. If the thing has been disconnected for approximately an hour,
  /// the time value might be missing.
  final int? timestamp;

  ThingConnectivity({
    this.connected,
    this.disconnectReason,
    this.timestamp,
  });

  factory ThingConnectivity.fromJson(Map<String, dynamic> json) {
    return ThingConnectivity(
      connected: json['connected'] as bool?,
      disconnectReason: json['disconnectReason'] as String?,
      timestamp: json['timestamp'] as int?,
    );
  }
}

enum ThingConnectivityIndexingMode {
  off('OFF'),
  status('STATUS'),
  ;

  final String value;

  const ThingConnectivityIndexingMode(this.value);

  static ThingConnectivityIndexingMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ThingConnectivityIndexingMode'));
}

/// The thing search index document.
class ThingDocument {
  /// The attributes.
  final Map<String, String>? attributes;

  /// Indicates whether the thing is connected to the Amazon Web Services IoT Core
  /// service.
  final ThingConnectivity? connectivity;

  /// Contains Device Defender data.
  ///
  /// For more information about Device Defender, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/device-defender.html">Device
  /// Defender</a>.
  final String? deviceDefender;

  /// The unnamed shadow and named shadow.
  ///
  /// For more information about shadows, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-device-shadows.html">IoT
  /// Device Shadow service.</a>
  final String? shadow;

  /// Thing group names.
  final List<String>? thingGroupNames;

  /// The thing ID.
  final String? thingId;

  /// The thing name.
  final String? thingName;

  /// The thing type name.
  final String? thingTypeName;

  ThingDocument({
    this.attributes,
    this.connectivity,
    this.deviceDefender,
    this.shadow,
    this.thingGroupNames,
    this.thingId,
    this.thingName,
    this.thingTypeName,
  });

  factory ThingDocument.fromJson(Map<String, dynamic> json) {
    return ThingDocument(
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      connectivity: json['connectivity'] != null
          ? ThingConnectivity.fromJson(
              json['connectivity'] as Map<String, dynamic>)
          : null,
      deviceDefender: json['deviceDefender'] as String?,
      shadow: json['shadow'] as String?,
      thingGroupNames: (json['thingGroupNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      thingId: json['thingId'] as String?,
      thingName: json['thingName'] as String?,
      thingTypeName: json['thingTypeName'] as String?,
    );
  }
}

/// The thing group search index document.
class ThingGroupDocument {
  /// The thing group attributes.
  final Map<String, String>? attributes;

  /// Parent group names.
  final List<String>? parentGroupNames;

  /// The thing group description.
  final String? thingGroupDescription;

  /// The thing group ID.
  final String? thingGroupId;

  /// The thing group name.
  final String? thingGroupName;

  ThingGroupDocument({
    this.attributes,
    this.parentGroupNames,
    this.thingGroupDescription,
    this.thingGroupId,
    this.thingGroupName,
  });

  factory ThingGroupDocument.fromJson(Map<String, dynamic> json) {
    return ThingGroupDocument(
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      parentGroupNames: (json['parentGroupNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      thingGroupDescription: json['thingGroupDescription'] as String?,
      thingGroupId: json['thingGroupId'] as String?,
      thingGroupName: json['thingGroupName'] as String?,
    );
  }
}

/// Thing group indexing configuration.
class ThingGroupIndexingConfiguration {
  /// Thing group indexing mode.
  final ThingGroupIndexingMode thingGroupIndexingMode;

  /// A list of thing group fields to index. This list cannot contain any managed
  /// fields. Use the GetIndexingConfiguration API to get a list of managed
  /// fields.
  ///
  /// Contains custom field names and their data type.
  final List<Field>? customFields;

  /// Contains fields that are indexed and whose types are already known by the
  /// Fleet Indexing service. This is an optional field. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/managing-fleet-index.html#managed-field">Managed
  /// fields</a> in the <i>Amazon Web Services IoT Core Developer Guide</i>.
  /// <note>
  /// You can't modify managed fields by updating fleet indexing configuration.
  /// </note>
  final List<Field>? managedFields;

  ThingGroupIndexingConfiguration({
    required this.thingGroupIndexingMode,
    this.customFields,
    this.managedFields,
  });

  factory ThingGroupIndexingConfiguration.fromJson(Map<String, dynamic> json) {
    return ThingGroupIndexingConfiguration(
      thingGroupIndexingMode: ThingGroupIndexingMode.fromString(
          (json['thingGroupIndexingMode'] as String)),
      customFields: (json['customFields'] as List?)
          ?.nonNulls
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
      managedFields: (json['managedFields'] as List?)
          ?.nonNulls
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final thingGroupIndexingMode = this.thingGroupIndexingMode;
    final customFields = this.customFields;
    final managedFields = this.managedFields;
    return {
      'thingGroupIndexingMode': thingGroupIndexingMode.value,
      if (customFields != null) 'customFields': customFields,
      if (managedFields != null) 'managedFields': managedFields,
    };
  }
}

enum ThingGroupIndexingMode {
  off('OFF'),
  on('ON'),
  ;

  final String value;

  const ThingGroupIndexingMode(this.value);

  static ThingGroupIndexingMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ThingGroupIndexingMode'));
}

/// Thing group metadata.
class ThingGroupMetadata {
  /// The UNIX timestamp of when the thing group was created.
  final DateTime? creationDate;

  /// The parent thing group name.
  final String? parentGroupName;

  /// The root parent thing group.
  final List<GroupNameAndArn>? rootToParentThingGroups;

  ThingGroupMetadata({
    this.creationDate,
    this.parentGroupName,
    this.rootToParentThingGroups,
  });

  factory ThingGroupMetadata.fromJson(Map<String, dynamic> json) {
    return ThingGroupMetadata(
      creationDate: timeStampFromJson(json['creationDate']),
      parentGroupName: json['parentGroupName'] as String?,
      rootToParentThingGroups: (json['rootToParentThingGroups'] as List?)
          ?.nonNulls
          .map((e) => GroupNameAndArn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Thing group properties.
class ThingGroupProperties {
  /// The thing group attributes in JSON format.
  final AttributePayload? attributePayload;

  /// The thing group description.
  final String? thingGroupDescription;

  ThingGroupProperties({
    this.attributePayload,
    this.thingGroupDescription,
  });

  factory ThingGroupProperties.fromJson(Map<String, dynamic> json) {
    return ThingGroupProperties(
      attributePayload: json['attributePayload'] != null
          ? AttributePayload.fromJson(
              json['attributePayload'] as Map<String, dynamic>)
          : null,
      thingGroupDescription: json['thingGroupDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributePayload = this.attributePayload;
    final thingGroupDescription = this.thingGroupDescription;
    return {
      if (attributePayload != null) 'attributePayload': attributePayload,
      if (thingGroupDescription != null)
        'thingGroupDescription': thingGroupDescription,
    };
  }
}

/// The thing indexing configuration. For more information, see <a
/// href="https://docs.aws.amazon.com/iot/latest/developerguide/managing-index.html">Managing
/// Thing Indexing</a>.
class ThingIndexingConfiguration {
  /// Thing indexing mode. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// REGISTRY – Your thing index contains registry data only.
  /// </li>
  /// <li>
  /// REGISTRY_AND_SHADOW - Your thing index contains registry and shadow data.
  /// </li>
  /// <li>
  /// OFF - Thing indexing is disabled.
  /// </li>
  /// </ul>
  final ThingIndexingMode thingIndexingMode;

  /// Contains custom field names and their data type.
  final List<Field>? customFields;

  /// Device Defender indexing mode. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// VIOLATIONS – Your thing index contains Device Defender violations. To enable
  /// Device Defender indexing, <i>deviceDefenderIndexingMode</i> must not be set
  /// to OFF.
  /// </li>
  /// <li>
  /// OFF - Device Defender indexing is disabled.
  /// </li>
  /// </ul>
  /// For more information about Device Defender violations, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/device-defender-detect.html">Device
  /// Defender Detect.</a>
  final DeviceDefenderIndexingMode? deviceDefenderIndexingMode;

  /// Provides additional selections for named shadows and geolocation data.
  ///
  /// To add named shadows to your fleet indexing configuration, set
  /// <code>namedShadowIndexingMode</code> to be ON and specify your shadow names
  /// in <code>namedShadowNames</code> filter.
  ///
  /// To add geolocation data to your fleet indexing configuration:
  ///
  /// <ul>
  /// <li>
  /// If you store geolocation data in a class/unnamed shadow, set
  /// <code>thingIndexingMode</code> to be <code>REGISTRY_AND_SHADOW</code> and
  /// specify your geolocation data in <code>geoLocations</code> filter.
  /// </li>
  /// <li>
  /// If you store geolocation data in a named shadow, set
  /// <code>namedShadowIndexingMode</code> to be <code>ON</code>, add the shadow
  /// name in <code>namedShadowNames</code> filter, and specify your geolocation
  /// data in <code>geoLocations</code> filter. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/managing-fleet-index.html">Managing
  /// fleet indexing</a>.
  /// </li>
  /// </ul>
  final IndexingFilter? filter;

  /// Contains fields that are indexed and whose types are already known by the
  /// Fleet Indexing service. This is an optional field. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/managing-fleet-index.html#managed-field">Managed
  /// fields</a> in the <i>Amazon Web Services IoT Core Developer Guide</i>.
  /// <note>
  /// You can't modify managed fields by updating fleet indexing configuration.
  /// </note>
  final List<Field>? managedFields;

  /// Named shadow indexing mode. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// ON – Your thing index contains named shadow. To enable thing named shadow
  /// indexing, <i>namedShadowIndexingMode</i> must not be set to OFF.
  /// </li>
  /// <li>
  /// OFF - Named shadow indexing is disabled.
  /// </li>
  /// </ul>
  /// For more information about Shadows, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-device-shadows.html">IoT
  /// Device Shadow service.</a>
  final NamedShadowIndexingMode? namedShadowIndexingMode;

  /// Thing connectivity indexing mode. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// STATUS – Your thing index contains connectivity status. To enable thing
  /// connectivity indexing, <i>thingIndexMode</i> must not be set to OFF.
  /// </li>
  /// <li>
  /// OFF - Thing connectivity status indexing is disabled.
  /// </li>
  /// </ul>
  final ThingConnectivityIndexingMode? thingConnectivityIndexingMode;

  ThingIndexingConfiguration({
    required this.thingIndexingMode,
    this.customFields,
    this.deviceDefenderIndexingMode,
    this.filter,
    this.managedFields,
    this.namedShadowIndexingMode,
    this.thingConnectivityIndexingMode,
  });

  factory ThingIndexingConfiguration.fromJson(Map<String, dynamic> json) {
    return ThingIndexingConfiguration(
      thingIndexingMode:
          ThingIndexingMode.fromString((json['thingIndexingMode'] as String)),
      customFields: (json['customFields'] as List?)
          ?.nonNulls
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
      deviceDefenderIndexingMode:
          (json['deviceDefenderIndexingMode'] as String?)
              ?.let(DeviceDefenderIndexingMode.fromString),
      filter: json['filter'] != null
          ? IndexingFilter.fromJson(json['filter'] as Map<String, dynamic>)
          : null,
      managedFields: (json['managedFields'] as List?)
          ?.nonNulls
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
      namedShadowIndexingMode: (json['namedShadowIndexingMode'] as String?)
          ?.let(NamedShadowIndexingMode.fromString),
      thingConnectivityIndexingMode:
          (json['thingConnectivityIndexingMode'] as String?)
              ?.let(ThingConnectivityIndexingMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final thingIndexingMode = this.thingIndexingMode;
    final customFields = this.customFields;
    final deviceDefenderIndexingMode = this.deviceDefenderIndexingMode;
    final filter = this.filter;
    final managedFields = this.managedFields;
    final namedShadowIndexingMode = this.namedShadowIndexingMode;
    final thingConnectivityIndexingMode = this.thingConnectivityIndexingMode;
    return {
      'thingIndexingMode': thingIndexingMode.value,
      if (customFields != null) 'customFields': customFields,
      if (deviceDefenderIndexingMode != null)
        'deviceDefenderIndexingMode': deviceDefenderIndexingMode.value,
      if (filter != null) 'filter': filter,
      if (managedFields != null) 'managedFields': managedFields,
      if (namedShadowIndexingMode != null)
        'namedShadowIndexingMode': namedShadowIndexingMode.value,
      if (thingConnectivityIndexingMode != null)
        'thingConnectivityIndexingMode': thingConnectivityIndexingMode.value,
    };
  }
}

enum ThingIndexingMode {
  off('OFF'),
  registry('REGISTRY'),
  registryAndShadow('REGISTRY_AND_SHADOW'),
  ;

  final String value;

  const ThingIndexingMode(this.value);

  static ThingIndexingMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ThingIndexingMode'));
}

/// The definition of the thing type, including thing type name and description.
class ThingTypeDefinition {
  /// The thing type ARN.
  final String? thingTypeArn;

  /// The ThingTypeMetadata contains additional information about the thing type
  /// including: creation date and time, a value indicating whether the thing type
  /// is deprecated, and a date and time when it was deprecated.
  final ThingTypeMetadata? thingTypeMetadata;

  /// The name of the thing type.
  final String? thingTypeName;

  /// The ThingTypeProperties for the thing type.
  final ThingTypeProperties? thingTypeProperties;

  ThingTypeDefinition({
    this.thingTypeArn,
    this.thingTypeMetadata,
    this.thingTypeName,
    this.thingTypeProperties,
  });

  factory ThingTypeDefinition.fromJson(Map<String, dynamic> json) {
    return ThingTypeDefinition(
      thingTypeArn: json['thingTypeArn'] as String?,
      thingTypeMetadata: json['thingTypeMetadata'] != null
          ? ThingTypeMetadata.fromJson(
              json['thingTypeMetadata'] as Map<String, dynamic>)
          : null,
      thingTypeName: json['thingTypeName'] as String?,
      thingTypeProperties: json['thingTypeProperties'] != null
          ? ThingTypeProperties.fromJson(
              json['thingTypeProperties'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// The ThingTypeMetadata contains additional information about the thing type
/// including: creation date and time, a value indicating whether the thing type
/// is deprecated, and a date and time when time was deprecated.
class ThingTypeMetadata {
  /// The date and time when the thing type was created.
  final DateTime? creationDate;

  /// Whether the thing type is deprecated. If <b>true</b>, no new things could be
  /// associated with this type.
  final bool? deprecated;

  /// The date and time when the thing type was deprecated.
  final DateTime? deprecationDate;

  ThingTypeMetadata({
    this.creationDate,
    this.deprecated,
    this.deprecationDate,
  });

  factory ThingTypeMetadata.fromJson(Map<String, dynamic> json) {
    return ThingTypeMetadata(
      creationDate: timeStampFromJson(json['creationDate']),
      deprecated: json['deprecated'] as bool?,
      deprecationDate: timeStampFromJson(json['deprecationDate']),
    );
  }
}

/// The ThingTypeProperties contains information about the thing type including:
/// a thing type description, and a list of searchable thing attribute names.
class ThingTypeProperties {
  /// A list of searchable thing attribute names.
  final List<String>? searchableAttributes;

  /// The description of the thing type.
  final String? thingTypeDescription;

  ThingTypeProperties({
    this.searchableAttributes,
    this.thingTypeDescription,
  });

  factory ThingTypeProperties.fromJson(Map<String, dynamic> json) {
    return ThingTypeProperties(
      searchableAttributes: (json['searchableAttributes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      thingTypeDescription: json['thingTypeDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final searchableAttributes = this.searchableAttributes;
    final thingTypeDescription = this.thingTypeDescription;
    return {
      if (searchableAttributes != null)
        'searchableAttributes': searchableAttributes,
      if (thingTypeDescription != null)
        'thingTypeDescription': thingTypeDescription,
    };
  }
}

/// Specifies the amount of time each device has to finish its execution of the
/// job. A timer is started when the job execution status is set to
/// <code>IN_PROGRESS</code>. If the job execution status is not set to another
/// terminal state before the timer expires, it will be automatically set to
/// <code>TIMED_OUT</code>.
class TimeoutConfig {
  /// Specifies the amount of time, in minutes, this device has to finish
  /// execution of this job. The timeout interval can be anywhere between 1 minute
  /// and 7 days (1 to 10080 minutes). The in progress timer can't be updated and
  /// will apply to all job executions for the job. Whenever a job execution
  /// remains in the IN_PROGRESS status for longer than this interval, the job
  /// execution will fail and switch to the terminal <code>TIMED_OUT</code>
  /// status.
  final int? inProgressTimeoutInMinutes;

  TimeoutConfig({
    this.inProgressTimeoutInMinutes,
  });

  factory TimeoutConfig.fromJson(Map<String, dynamic> json) {
    return TimeoutConfig(
      inProgressTimeoutInMinutes: json['inProgressTimeoutInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final inProgressTimeoutInMinutes = this.inProgressTimeoutInMinutes;
    return {
      if (inProgressTimeoutInMinutes != null)
        'inProgressTimeoutInMinutes': inProgressTimeoutInMinutes,
    };
  }
}

/// The Timestream rule action writes attributes (measures) from an MQTT message
/// into an Amazon Timestream table. For more information, see the <a
/// href="https://docs.aws.amazon.com/iot/latest/developerguide/timestream-rule-action.html">Timestream</a>
/// topic rule action documentation.
class TimestreamAction {
  /// The name of an Amazon Timestream database.
  final String databaseName;

  /// Metadata attributes of the time series that are written in each measure
  /// record.
  final List<TimestreamDimension> dimensions;

  /// The ARN of the role that grants permission to write to the Amazon Timestream
  /// database table.
  final String roleArn;

  /// The name of the database table into which to write the measure records.
  final String tableName;

  /// Specifies an application-defined value to replace the default value assigned
  /// to the Timestream record's timestamp in the <code>time</code> column.
  ///
  /// You can use this property to specify the value and the precision of the
  /// Timestream record's timestamp. You can specify a value from the message
  /// payload or a value computed by a substitution template.
  ///
  /// If omitted, the topic rule action assigns the timestamp, in milliseconds, at
  /// the time it processed the rule.
  final TimestreamTimestamp? timestamp;

  TimestreamAction({
    required this.databaseName,
    required this.dimensions,
    required this.roleArn,
    required this.tableName,
    this.timestamp,
  });

  factory TimestreamAction.fromJson(Map<String, dynamic> json) {
    return TimestreamAction(
      databaseName: json['databaseName'] as String,
      dimensions: (json['dimensions'] as List)
          .nonNulls
          .map((e) => TimestreamDimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: json['roleArn'] as String,
      tableName: json['tableName'] as String,
      timestamp: json['timestamp'] != null
          ? TimestreamTimestamp.fromJson(
              json['timestamp'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final dimensions = this.dimensions;
    final roleArn = this.roleArn;
    final tableName = this.tableName;
    final timestamp = this.timestamp;
    return {
      'databaseName': databaseName,
      'dimensions': dimensions,
      'roleArn': roleArn,
      'tableName': tableName,
      if (timestamp != null) 'timestamp': timestamp,
    };
  }
}

/// Metadata attributes of the time series that are written in each measure
/// record.
class TimestreamDimension {
  /// The metadata dimension name. This is the name of the column in the Amazon
  /// Timestream database table record.
  ///
  /// Dimensions cannot be named: <code>measure_name</code>,
  /// <code>measure_value</code>, or <code>time</code>. These names are reserved.
  /// Dimension names cannot start with <code>ts_</code> or
  /// <code>measure_value</code> and they cannot contain the colon
  /// (<code>:</code>) character.
  final String name;

  /// The value to write in this column of the database record.
  final String value;

  TimestreamDimension({
    required this.name,
    required this.value,
  });

  factory TimestreamDimension.fromJson(Map<String, dynamic> json) {
    return TimestreamDimension(
      name: json['name'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

/// Describes how to interpret an application-defined timestamp value from an
/// MQTT message payload and the precision of that value.
class TimestreamTimestamp {
  /// The precision of the timestamp value that results from the expression
  /// described in <code>value</code>.
  ///
  /// Valid values: <code>SECONDS</code> | <code>MILLISECONDS</code> |
  /// <code>MICROSECONDS</code> | <code>NANOSECONDS</code>. The default is
  /// <code>MILLISECONDS</code>.
  final String unit;

  /// An expression that returns a long epoch time value.
  final String value;

  TimestreamTimestamp({
    required this.unit,
    required this.value,
  });

  factory TimestreamTimestamp.fromJson(Map<String, dynamic> json) {
    return TimestreamTimestamp(
      unit: json['unit'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      'unit': unit,
      'value': value,
    };
  }
}

/// An object that specifies the TLS configuration for a domain.
class TlsConfig {
  /// The security policy for a domain configuration. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/transport-security.html#tls-policy-table">Security
  /// policies </a> in the <i>Amazon Web Services IoT Core developer guide</i>.
  final String? securityPolicy;

  TlsConfig({
    this.securityPolicy,
  });

  factory TlsConfig.fromJson(Map<String, dynamic> json) {
    return TlsConfig(
      securityPolicy: json['securityPolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final securityPolicy = this.securityPolicy;
    return {
      if (securityPolicy != null) 'securityPolicy': securityPolicy,
    };
  }
}

/// Specifies the TLS context to use for the test authorizer request.
class TlsContext {
  /// The value of the <code>serverName</code> key in a TLS authorization request.
  final String? serverName;

  TlsContext({
    this.serverName,
  });

  Map<String, dynamic> toJson() {
    final serverName = this.serverName;
    return {
      if (serverName != null) 'serverName': serverName,
    };
  }
}

/// Describes a rule.
class TopicRule {
  /// The actions associated with the rule.
  final List<Action>? actions;

  /// The version of the SQL rules engine to use when evaluating the rule.
  final String? awsIotSqlVersion;

  /// The date and time the rule was created.
  final DateTime? createdAt;

  /// The description of the rule.
  final String? description;

  /// The action to perform when an error occurs.
  final Action? errorAction;

  /// Specifies whether the rule is disabled.
  final bool? ruleDisabled;

  /// The name of the rule.
  final String? ruleName;

  /// The SQL statement used to query the topic. When using a SQL query with
  /// multiple lines, be sure to escape the newline characters.
  final String? sql;

  TopicRule({
    this.actions,
    this.awsIotSqlVersion,
    this.createdAt,
    this.description,
    this.errorAction,
    this.ruleDisabled,
    this.ruleName,
    this.sql,
  });

  factory TopicRule.fromJson(Map<String, dynamic> json) {
    return TopicRule(
      actions: (json['actions'] as List?)
          ?.nonNulls
          .map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      awsIotSqlVersion: json['awsIotSqlVersion'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      errorAction: json['errorAction'] != null
          ? Action.fromJson(json['errorAction'] as Map<String, dynamic>)
          : null,
      ruleDisabled: json['ruleDisabled'] as bool?,
      ruleName: json['ruleName'] as String?,
      sql: json['sql'] as String?,
    );
  }
}

/// A topic rule destination.
class TopicRuleDestination {
  /// The topic rule destination URL.
  final String? arn;

  /// The date and time when the topic rule destination was created.
  final DateTime? createdAt;

  /// Properties of the HTTP URL.
  final HttpUrlDestinationProperties? httpUrlProperties;

  /// The date and time when the topic rule destination was last updated.
  final DateTime? lastUpdatedAt;

  /// The status of the topic rule destination. Valid values are:
  /// <dl> <dt>IN_PROGRESS</dt> <dd>
  /// A topic rule destination was created but has not been confirmed. You can set
  /// <code>status</code> to <code>IN_PROGRESS</code> by calling
  /// <code>UpdateTopicRuleDestination</code>. Calling
  /// <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge
  /// to be sent to your confirmation endpoint.
  /// </dd> <dt>ENABLED</dt> <dd>
  /// Confirmation was completed, and traffic to this destination is allowed. You
  /// can set <code>status</code> to <code>DISABLED</code> by calling
  /// <code>UpdateTopicRuleDestination</code>.
  /// </dd> <dt>DISABLED</dt> <dd>
  /// Confirmation was completed, and traffic to this destination is not allowed.
  /// You can set <code>status</code> to <code>ENABLED</code> by calling
  /// <code>UpdateTopicRuleDestination</code>.
  /// </dd> <dt>ERROR</dt> <dd>
  /// Confirmation could not be completed, for example if the confirmation timed
  /// out. You can call <code>GetTopicRuleDestination</code> for details about the
  /// error. You can set <code>status</code> to <code>IN_PROGRESS</code> by
  /// calling <code>UpdateTopicRuleDestination</code>. Calling
  /// <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge
  /// to be sent to your confirmation endpoint.
  /// </dd> </dl>
  final TopicRuleDestinationStatus? status;

  /// Additional details or reason why the topic rule destination is in the
  /// current status.
  final String? statusReason;

  /// Properties of the virtual private cloud (VPC) connection.
  final VpcDestinationProperties? vpcProperties;

  TopicRuleDestination({
    this.arn,
    this.createdAt,
    this.httpUrlProperties,
    this.lastUpdatedAt,
    this.status,
    this.statusReason,
    this.vpcProperties,
  });

  factory TopicRuleDestination.fromJson(Map<String, dynamic> json) {
    return TopicRuleDestination(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      httpUrlProperties: json['httpUrlProperties'] != null
          ? HttpUrlDestinationProperties.fromJson(
              json['httpUrlProperties'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      status: (json['status'] as String?)
          ?.let(TopicRuleDestinationStatus.fromString),
      statusReason: json['statusReason'] as String?,
      vpcProperties: json['vpcProperties'] != null
          ? VpcDestinationProperties.fromJson(
              json['vpcProperties'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Configuration of the topic rule destination.
class TopicRuleDestinationConfiguration {
  /// Configuration of the HTTP URL.
  final HttpUrlDestinationConfiguration? httpUrlConfiguration;

  /// Configuration of the virtual private cloud (VPC) connection.
  final VpcDestinationConfiguration? vpcConfiguration;

  TopicRuleDestinationConfiguration({
    this.httpUrlConfiguration,
    this.vpcConfiguration,
  });

  Map<String, dynamic> toJson() {
    final httpUrlConfiguration = this.httpUrlConfiguration;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      if (httpUrlConfiguration != null)
        'httpUrlConfiguration': httpUrlConfiguration,
      if (vpcConfiguration != null) 'vpcConfiguration': vpcConfiguration,
    };
  }
}

enum TopicRuleDestinationStatus {
  enabled('ENABLED'),
  inProgress('IN_PROGRESS'),
  disabled('DISABLED'),
  error('ERROR'),
  deleting('DELETING'),
  ;

  final String value;

  const TopicRuleDestinationStatus(this.value);

  static TopicRuleDestinationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum TopicRuleDestinationStatus'));
}

/// Information about the topic rule destination.
class TopicRuleDestinationSummary {
  /// The topic rule destination ARN.
  final String? arn;

  /// The date and time when the topic rule destination was created.
  final DateTime? createdAt;

  /// Information about the HTTP URL.
  final HttpUrlDestinationSummary? httpUrlSummary;

  /// The date and time when the topic rule destination was last updated.
  final DateTime? lastUpdatedAt;

  /// The status of the topic rule destination. Valid values are:
  /// <dl> <dt>IN_PROGRESS</dt> <dd>
  /// A topic rule destination was created but has not been confirmed. You can set
  /// <code>status</code> to <code>IN_PROGRESS</code> by calling
  /// <code>UpdateTopicRuleDestination</code>. Calling
  /// <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge
  /// to be sent to your confirmation endpoint.
  /// </dd> <dt>ENABLED</dt> <dd>
  /// Confirmation was completed, and traffic to this destination is allowed. You
  /// can set <code>status</code> to <code>DISABLED</code> by calling
  /// <code>UpdateTopicRuleDestination</code>.
  /// </dd> <dt>DISABLED</dt> <dd>
  /// Confirmation was completed, and traffic to this destination is not allowed.
  /// You can set <code>status</code> to <code>ENABLED</code> by calling
  /// <code>UpdateTopicRuleDestination</code>.
  /// </dd> <dt>ERROR</dt> <dd>
  /// Confirmation could not be completed, for example if the confirmation timed
  /// out. You can call <code>GetTopicRuleDestination</code> for details about the
  /// error. You can set <code>status</code> to <code>IN_PROGRESS</code> by
  /// calling <code>UpdateTopicRuleDestination</code>. Calling
  /// <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge
  /// to be sent to your confirmation endpoint.
  /// </dd> </dl>
  final TopicRuleDestinationStatus? status;

  /// The reason the topic rule destination is in the current status.
  final String? statusReason;

  /// Information about the virtual private cloud (VPC) connection.
  final VpcDestinationSummary? vpcDestinationSummary;

  TopicRuleDestinationSummary({
    this.arn,
    this.createdAt,
    this.httpUrlSummary,
    this.lastUpdatedAt,
    this.status,
    this.statusReason,
    this.vpcDestinationSummary,
  });

  factory TopicRuleDestinationSummary.fromJson(Map<String, dynamic> json) {
    return TopicRuleDestinationSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      httpUrlSummary: json['httpUrlSummary'] != null
          ? HttpUrlDestinationSummary.fromJson(
              json['httpUrlSummary'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      status: (json['status'] as String?)
          ?.let(TopicRuleDestinationStatus.fromString),
      statusReason: json['statusReason'] as String?,
      vpcDestinationSummary: json['vpcDestinationSummary'] != null
          ? VpcDestinationSummary.fromJson(
              json['vpcDestinationSummary'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Describes a rule.
class TopicRuleListItem {
  /// The date and time the rule was created.
  final DateTime? createdAt;

  /// The rule ARN.
  final String? ruleArn;

  /// Specifies whether the rule is disabled.
  final bool? ruleDisabled;

  /// The name of the rule.
  final String? ruleName;

  /// The pattern for the topic names that apply.
  final String? topicPattern;

  TopicRuleListItem({
    this.createdAt,
    this.ruleArn,
    this.ruleDisabled,
    this.ruleName,
    this.topicPattern,
  });

  factory TopicRuleListItem.fromJson(Map<String, dynamic> json) {
    return TopicRuleListItem(
      createdAt: timeStampFromJson(json['createdAt']),
      ruleArn: json['ruleArn'] as String?,
      ruleDisabled: json['ruleDisabled'] as bool?,
      ruleName: json['ruleName'] as String?,
      topicPattern: json['topicPattern'] as String?,
    );
  }
}

/// Describes a rule.
class TopicRulePayload {
  /// The actions associated with the rule.
  final List<Action> actions;

  /// The SQL statement used to query the topic. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-sql-reference.html">IoT
  /// SQL Reference</a> in the <i>IoT Developer Guide</i>.
  final String sql;

  /// The version of the SQL rules engine to use when evaluating the rule.
  final String? awsIotSqlVersion;

  /// The description of the rule.
  final String? description;

  /// The action to take when an error occurs.
  final Action? errorAction;

  /// Specifies whether the rule is disabled.
  final bool? ruleDisabled;

  TopicRulePayload({
    required this.actions,
    required this.sql,
    this.awsIotSqlVersion,
    this.description,
    this.errorAction,
    this.ruleDisabled,
  });

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final sql = this.sql;
    final awsIotSqlVersion = this.awsIotSqlVersion;
    final description = this.description;
    final errorAction = this.errorAction;
    final ruleDisabled = this.ruleDisabled;
    return {
      'actions': actions,
      'sql': sql,
      if (awsIotSqlVersion != null) 'awsIotSqlVersion': awsIotSqlVersion,
      if (description != null) 'description': description,
      if (errorAction != null) 'errorAction': errorAction,
      if (ruleDisabled != null) 'ruleDisabled': ruleDisabled,
    };
  }
}

/// The output from the TransferCertificate operation.
class TransferCertificateResponse {
  /// The ARN of the certificate.
  final String? transferredCertificateArn;

  TransferCertificateResponse({
    this.transferredCertificateArn,
  });

  factory TransferCertificateResponse.fromJson(Map<String, dynamic> json) {
    return TransferCertificateResponse(
      transferredCertificateArn: json['transferredCertificateArn'] as String?,
    );
  }
}

/// Data used to transfer a certificate to an Amazon Web Services account.
class TransferData {
  /// The date the transfer was accepted.
  final DateTime? acceptDate;

  /// The date the transfer was rejected.
  final DateTime? rejectDate;

  /// The reason why the transfer was rejected.
  final String? rejectReason;

  /// The date the transfer took place.
  final DateTime? transferDate;

  /// The transfer message.
  final String? transferMessage;

  TransferData({
    this.acceptDate,
    this.rejectDate,
    this.rejectReason,
    this.transferDate,
    this.transferMessage,
  });

  factory TransferData.fromJson(Map<String, dynamic> json) {
    return TransferData(
      acceptDate: timeStampFromJson(json['acceptDate']),
      rejectDate: timeStampFromJson(json['rejectDate']),
      rejectReason: json['rejectReason'] as String?,
      transferDate: timeStampFromJson(json['transferDate']),
      transferMessage: json['transferMessage'] as String?,
    );
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }
}

class UpdateAccountAuditConfigurationResponse {
  UpdateAccountAuditConfigurationResponse();

  factory UpdateAccountAuditConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateAccountAuditConfigurationResponse();
  }
}

class UpdateAuditSuppressionResponse {
  UpdateAuditSuppressionResponse();

  factory UpdateAuditSuppressionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateAuditSuppressionResponse();
  }
}

class UpdateAuthorizerResponse {
  /// The authorizer ARN.
  final String? authorizerArn;

  /// The authorizer name.
  final String? authorizerName;

  UpdateAuthorizerResponse({
    this.authorizerArn,
    this.authorizerName,
  });

  factory UpdateAuthorizerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAuthorizerResponse(
      authorizerArn: json['authorizerArn'] as String?,
      authorizerName: json['authorizerName'] as String?,
    );
  }
}

class UpdateBillingGroupResponse {
  /// The latest version of the billing group.
  final int? version;

  UpdateBillingGroupResponse({
    this.version,
  });

  factory UpdateBillingGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBillingGroupResponse(
      version: json['version'] as int?,
    );
  }
}

/// Parameters to define a mitigation action that changes the state of the CA
/// certificate to inactive.
class UpdateCACertificateParams {
  /// The action that you want to apply to the CA certificate. The only supported
  /// value is <code>DEACTIVATE</code>.
  final CACertificateUpdateAction action;

  UpdateCACertificateParams({
    required this.action,
  });

  factory UpdateCACertificateParams.fromJson(Map<String, dynamic> json) {
    return UpdateCACertificateParams(
      action: CACertificateUpdateAction.fromString((json['action'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    return {
      'action': action.value,
    };
  }
}

class UpdateCertificateProviderResponse {
  /// The ARN of the certificate provider.
  final String? certificateProviderArn;

  /// The name of the certificate provider.
  final String? certificateProviderName;

  UpdateCertificateProviderResponse({
    this.certificateProviderArn,
    this.certificateProviderName,
  });

  factory UpdateCertificateProviderResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateCertificateProviderResponse(
      certificateProviderArn: json['certificateProviderArn'] as String?,
      certificateProviderName: json['certificateProviderName'] as String?,
    );
  }
}

class UpdateCustomMetricResponse {
  /// The creation date of the custom metric in milliseconds since epoch.
  final DateTime? creationDate;

  /// A friendly name in the console for the custom metric
  final String? displayName;

  /// The time the custom metric was last modified in milliseconds since epoch.
  final DateTime? lastModifiedDate;

  /// The Amazon Resource Number (ARN) of the custom metric.
  final String? metricArn;

  /// The name of the custom metric.
  final String? metricName;

  /// The type of the custom metric.
  /// <important>
  /// The type <code>number</code> only takes a single metric value as an input,
  /// but while submitting the metrics value in the DeviceMetrics report, it must
  /// be passed as an array with a single value.
  /// </important>
  final CustomMetricType? metricType;

  UpdateCustomMetricResponse({
    this.creationDate,
    this.displayName,
    this.lastModifiedDate,
    this.metricArn,
    this.metricName,
    this.metricType,
  });

  factory UpdateCustomMetricResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCustomMetricResponse(
      creationDate: timeStampFromJson(json['creationDate']),
      displayName: json['displayName'] as String?,
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      metricArn: json['metricArn'] as String?,
      metricName: json['metricName'] as String?,
      metricType:
          (json['metricType'] as String?)?.let(CustomMetricType.fromString),
    );
  }
}

/// Parameters to define a mitigation action that changes the state of the
/// device certificate to inactive.
class UpdateDeviceCertificateParams {
  /// The action that you want to apply to the device certificate. The only
  /// supported value is <code>DEACTIVATE</code>.
  final DeviceCertificateUpdateAction action;

  UpdateDeviceCertificateParams({
    required this.action,
  });

  factory UpdateDeviceCertificateParams.fromJson(Map<String, dynamic> json) {
    return UpdateDeviceCertificateParams(
      action:
          DeviceCertificateUpdateAction.fromString((json['action'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    return {
      'action': action.value,
    };
  }
}

class UpdateDimensionResponse {
  /// The Amazon Resource Name (ARN)of the created dimension.
  final String? arn;

  /// The date and time, in milliseconds since epoch, when the dimension was
  /// initially created.
  final DateTime? creationDate;

  /// The date and time, in milliseconds since epoch, when the dimension was most
  /// recently updated.
  final DateTime? lastModifiedDate;

  /// A unique identifier for the dimension.
  final String? name;

  /// The value or list of values used to scope the dimension. For example, for
  /// topic filters, this is the pattern used to match the MQTT topic name.
  final List<String>? stringValues;

  /// The type of the dimension.
  final DimensionType? type;

  UpdateDimensionResponse({
    this.arn,
    this.creationDate,
    this.lastModifiedDate,
    this.name,
    this.stringValues,
    this.type,
  });

  factory UpdateDimensionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDimensionResponse(
      arn: json['arn'] as String?,
      creationDate: timeStampFromJson(json['creationDate']),
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      name: json['name'] as String?,
      stringValues: (json['stringValues'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      type: (json['type'] as String?)?.let(DimensionType.fromString),
    );
  }
}

class UpdateDomainConfigurationResponse {
  /// The ARN of the domain configuration that was updated.
  final String? domainConfigurationArn;

  /// The name of the domain configuration that was updated.
  final String? domainConfigurationName;

  UpdateDomainConfigurationResponse({
    this.domainConfigurationArn,
    this.domainConfigurationName,
  });

  factory UpdateDomainConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateDomainConfigurationResponse(
      domainConfigurationArn: json['domainConfigurationArn'] as String?,
      domainConfigurationName: json['domainConfigurationName'] as String?,
    );
  }
}

class UpdateDynamicThingGroupResponse {
  /// The dynamic thing group version.
  final int? version;

  UpdateDynamicThingGroupResponse({
    this.version,
  });

  factory UpdateDynamicThingGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDynamicThingGroupResponse(
      version: json['version'] as int?,
    );
  }
}

class UpdateEventConfigurationsResponse {
  UpdateEventConfigurationsResponse();

  factory UpdateEventConfigurationsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateEventConfigurationsResponse();
  }
}

class UpdateIndexingConfigurationResponse {
  UpdateIndexingConfigurationResponse();

  factory UpdateIndexingConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateIndexingConfigurationResponse();
  }
}

class UpdateMitigationActionResponse {
  /// The ARN for the new mitigation action.
  final String? actionArn;

  /// A unique identifier for the mitigation action.
  final String? actionId;

  UpdateMitigationActionResponse({
    this.actionArn,
    this.actionId,
  });

  factory UpdateMitigationActionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMitigationActionResponse(
      actionArn: json['actionArn'] as String?,
      actionId: json['actionId'] as String?,
    );
  }
}

class UpdatePackageConfigurationResponse {
  UpdatePackageConfigurationResponse();

  factory UpdatePackageConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return UpdatePackageConfigurationResponse();
  }
}

class UpdatePackageResponse {
  UpdatePackageResponse();

  factory UpdatePackageResponse.fromJson(Map<String, dynamic> _) {
    return UpdatePackageResponse();
  }
}

class UpdatePackageVersionResponse {
  UpdatePackageVersionResponse();

  factory UpdatePackageVersionResponse.fromJson(Map<String, dynamic> _) {
    return UpdatePackageVersionResponse();
  }
}

class UpdateProvisioningTemplateResponse {
  UpdateProvisioningTemplateResponse();

  factory UpdateProvisioningTemplateResponse.fromJson(Map<String, dynamic> _) {
    return UpdateProvisioningTemplateResponse();
  }
}

class UpdateRoleAliasResponse {
  /// The role alias.
  final String? roleAlias;

  /// The role alias ARN.
  final String? roleAliasArn;

  UpdateRoleAliasResponse({
    this.roleAlias,
    this.roleAliasArn,
  });

  factory UpdateRoleAliasResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRoleAliasResponse(
      roleAlias: json['roleAlias'] as String?,
      roleAliasArn: json['roleAliasArn'] as String?,
    );
  }
}

class UpdateScheduledAuditResponse {
  /// The ARN of the scheduled audit.
  final String? scheduledAuditArn;

  UpdateScheduledAuditResponse({
    this.scheduledAuditArn,
  });

  factory UpdateScheduledAuditResponse.fromJson(Map<String, dynamic> json) {
    return UpdateScheduledAuditResponse(
      scheduledAuditArn: json['scheduledAuditArn'] as String?,
    );
  }
}

class UpdateSecurityProfileResponse {
  /// <i>Please use
  /// <a>UpdateSecurityProfileResponse$additionalMetricsToRetainV2</a>
  /// instead.</i>
  ///
  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the security profile's
  /// <code>behaviors</code>, but it is also retained for any metric specified
  /// here.
  final List<String>? additionalMetricsToRetain;

  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the profile's behaviors, but it is also
  /// retained for any metric specified here. Can be used with custom metrics;
  /// cannot be used with dimensions.
  final List<MetricToRetain>? additionalMetricsToRetainV2;

  /// Where the alerts are sent. (Alerts are always sent to the console.)
  final Map<AlertTargetType, AlertTarget>? alertTargets;

  /// Specifies the behaviors that, when violated by a device (thing), cause an
  /// alert.
  final List<Behavior>? behaviors;

  /// The time the security profile was created.
  final DateTime? creationDate;

  /// The time the security profile was last modified.
  final DateTime? lastModifiedDate;

  /// Specifies the MQTT topic and role ARN required for metric export.
  final MetricsExportConfig? metricsExportConfig;

  /// The ARN of the security profile that was updated.
  final String? securityProfileArn;

  /// The description of the security profile.
  final String? securityProfileDescription;

  /// The name of the security profile that was updated.
  final String? securityProfileName;

  /// The updated version of the security profile.
  final int? version;

  UpdateSecurityProfileResponse({
    this.additionalMetricsToRetain,
    this.additionalMetricsToRetainV2,
    this.alertTargets,
    this.behaviors,
    this.creationDate,
    this.lastModifiedDate,
    this.metricsExportConfig,
    this.securityProfileArn,
    this.securityProfileDescription,
    this.securityProfileName,
    this.version,
  });

  factory UpdateSecurityProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSecurityProfileResponse(
      additionalMetricsToRetain: (json['additionalMetricsToRetain'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      additionalMetricsToRetainV2:
          (json['additionalMetricsToRetainV2'] as List?)
              ?.nonNulls
              .map((e) => MetricToRetain.fromJson(e as Map<String, dynamic>))
              .toList(),
      alertTargets: (json['alertTargets'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(AlertTargetType.fromString(k),
              AlertTarget.fromJson(e as Map<String, dynamic>))),
      behaviors: (json['behaviors'] as List?)
          ?.nonNulls
          .map((e) => Behavior.fromJson(e as Map<String, dynamic>))
          .toList(),
      creationDate: timeStampFromJson(json['creationDate']),
      lastModifiedDate: timeStampFromJson(json['lastModifiedDate']),
      metricsExportConfig: json['metricsExportConfig'] != null
          ? MetricsExportConfig.fromJson(
              json['metricsExportConfig'] as Map<String, dynamic>)
          : null,
      securityProfileArn: json['securityProfileArn'] as String?,
      securityProfileDescription: json['securityProfileDescription'] as String?,
      securityProfileName: json['securityProfileName'] as String?,
      version: json['version'] as int?,
    );
  }
}

class UpdateStreamResponse {
  /// A description of the stream.
  final String? description;

  /// The stream ARN.
  final String? streamArn;

  /// The stream ID.
  final String? streamId;

  /// The stream version.
  final int? streamVersion;

  UpdateStreamResponse({
    this.description,
    this.streamArn,
    this.streamId,
    this.streamVersion,
  });

  factory UpdateStreamResponse.fromJson(Map<String, dynamic> json) {
    return UpdateStreamResponse(
      description: json['description'] as String?,
      streamArn: json['streamArn'] as String?,
      streamId: json['streamId'] as String?,
      streamVersion: json['streamVersion'] as int?,
    );
  }
}

class UpdateThingGroupResponse {
  /// The version of the updated thing group.
  final int? version;

  UpdateThingGroupResponse({
    this.version,
  });

  factory UpdateThingGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateThingGroupResponse(
      version: json['version'] as int?,
    );
  }
}

class UpdateThingGroupsForThingResponse {
  UpdateThingGroupsForThingResponse();

  factory UpdateThingGroupsForThingResponse.fromJson(Map<String, dynamic> _) {
    return UpdateThingGroupsForThingResponse();
  }
}

/// The output from the UpdateThing operation.
class UpdateThingResponse {
  UpdateThingResponse();

  factory UpdateThingResponse.fromJson(Map<String, dynamic> _) {
    return UpdateThingResponse();
  }
}

class UpdateTopicRuleDestinationResponse {
  UpdateTopicRuleDestinationResponse();

  factory UpdateTopicRuleDestinationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTopicRuleDestinationResponse();
  }
}

/// A key-value pair that you define in the header. Both the key and the value
/// are either literal strings or valid <a
/// href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-substitution-templates.html">substitution
/// templates</a>.
class UserProperty {
  /// A key to be specified in <code>UserProperty</code>.
  final String key;

  /// A value to be specified in <code>UserProperty</code>.
  final String value;

  UserProperty({
    required this.key,
    required this.value,
  });

  factory UserProperty.fromJson(Map<String, dynamic> json) {
    return UserProperty(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

class ValidateSecurityProfileBehaviorsResponse {
  /// True if the behaviors were valid.
  final bool? valid;

  /// The list of any errors found in the behaviors.
  final List<ValidationError>? validationErrors;

  ValidateSecurityProfileBehaviorsResponse({
    this.valid,
    this.validationErrors,
  });

  factory ValidateSecurityProfileBehaviorsResponse.fromJson(
      Map<String, dynamic> json) {
    return ValidateSecurityProfileBehaviorsResponse(
      valid: json['valid'] as bool?,
      validationErrors: (json['validationErrors'] as List?)
          ?.nonNulls
          .map((e) => ValidationError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Information about an error found in a behavior specification.
class ValidationError {
  /// The description of an error found in the behaviors.
  final String? errorMessage;

  ValidationError({
    this.errorMessage,
  });

  factory ValidationError.fromJson(Map<String, dynamic> json) {
    return ValidationError(
      errorMessage: json['errorMessage'] as String?,
    );
  }
}

enum VerificationState {
  falsePositive('FALSE_POSITIVE'),
  benignPositive('BENIGN_POSITIVE'),
  truePositive('TRUE_POSITIVE'),
  unknown('UNKNOWN'),
  ;

  final String value;

  const VerificationState(this.value);

  static VerificationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum VerificationState'));
}

/// Configuration to manage IoT Job's package version reporting. If configured,
/// Jobs updates the thing's reserved named shadow with the package version
/// information up on successful job completion.
///
/// <b>Note:</b> For each job, the destinationPackageVersions attribute has to
/// be set with the correct data for Jobs to report to the thing shadow.
class VersionUpdateByJobsConfig {
  /// Indicates whether the Job is enabled or not.
  final bool? enabled;

  /// The Amazon Resource Name (ARN) of the role that grants permission to the IoT
  /// jobs service to update the reserved named shadow when the job successfully
  /// completes.
  final String? roleArn;

  VersionUpdateByJobsConfig({
    this.enabled,
    this.roleArn,
  });

  factory VersionUpdateByJobsConfig.fromJson(Map<String, dynamic> json) {
    return VersionUpdateByJobsConfig(
      enabled: json['enabled'] as bool?,
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final roleArn = this.roleArn;
    return {
      if (enabled != null) 'enabled': enabled,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// Information about a Device Defender security profile behavior violation.
class ViolationEvent {
  /// The behavior that was violated.
  final Behavior? behavior;

  /// The value of the metric (the measurement).
  final MetricValue? metricValue;

  /// The name of the security profile whose behavior was violated.
  final String? securityProfileName;

  /// The name of the thing responsible for the violation event.
  final String? thingName;

  /// The verification state of the violation (detect alarm).
  final VerificationState? verificationState;

  /// The description of the verification state of the violation.
  final String? verificationStateDescription;

  /// The details of a violation event.
  final ViolationEventAdditionalInfo? violationEventAdditionalInfo;

  /// The time the violation event occurred.
  final DateTime? violationEventTime;

  /// The type of violation event.
  final ViolationEventType? violationEventType;

  /// The ID of the violation event.
  final String? violationId;

  ViolationEvent({
    this.behavior,
    this.metricValue,
    this.securityProfileName,
    this.thingName,
    this.verificationState,
    this.verificationStateDescription,
    this.violationEventAdditionalInfo,
    this.violationEventTime,
    this.violationEventType,
    this.violationId,
  });

  factory ViolationEvent.fromJson(Map<String, dynamic> json) {
    return ViolationEvent(
      behavior: json['behavior'] != null
          ? Behavior.fromJson(json['behavior'] as Map<String, dynamic>)
          : null,
      metricValue: json['metricValue'] != null
          ? MetricValue.fromJson(json['metricValue'] as Map<String, dynamic>)
          : null,
      securityProfileName: json['securityProfileName'] as String?,
      thingName: json['thingName'] as String?,
      verificationState: (json['verificationState'] as String?)
          ?.let(VerificationState.fromString),
      verificationStateDescription:
          json['verificationStateDescription'] as String?,
      violationEventAdditionalInfo: json['violationEventAdditionalInfo'] != null
          ? ViolationEventAdditionalInfo.fromJson(
              json['violationEventAdditionalInfo'] as Map<String, dynamic>)
          : null,
      violationEventTime: timeStampFromJson(json['violationEventTime']),
      violationEventType: (json['violationEventType'] as String?)
          ?.let(ViolationEventType.fromString),
      violationId: json['violationId'] as String?,
    );
  }
}

/// The details of a violation event.
class ViolationEventAdditionalInfo {
  /// The sensitivity of anomalous behavior evaluation. Can be <code>Low</code>,
  /// <code>Medium</code>, or <code>High</code>.
  final ConfidenceLevel? confidenceLevel;

  ViolationEventAdditionalInfo({
    this.confidenceLevel,
  });

  factory ViolationEventAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return ViolationEventAdditionalInfo(
      confidenceLevel:
          (json['confidenceLevel'] as String?)?.let(ConfidenceLevel.fromString),
    );
  }
}

/// Specifies the time period of which violation events occurred between.
class ViolationEventOccurrenceRange {
  /// The end date and time of a time period in which violation events occurred.
  final DateTime endTime;

  /// The start date and time of a time period in which violation events occurred.
  final DateTime startTime;

  ViolationEventOccurrenceRange({
    required this.endTime,
    required this.startTime,
  });

  factory ViolationEventOccurrenceRange.fromJson(Map<String, dynamic> json) {
    return ViolationEventOccurrenceRange(
      endTime: nonNullableTimeStampFromJson(json['endTime'] as Object),
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'endTime': unixTimestampToJson(endTime),
      'startTime': unixTimestampToJson(startTime),
    };
  }
}

enum ViolationEventType {
  inAlarm('in-alarm'),
  alarmCleared('alarm-cleared'),
  alarmInvalidated('alarm-invalidated'),
  ;

  final String value;

  const ViolationEventType(this.value);

  static ViolationEventType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ViolationEventType'));
}

/// The configuration information for a virtual private cloud (VPC) destination.
class VpcDestinationConfiguration {
  /// The ARN of a role that has permission to create and attach to elastic
  /// network interfaces (ENIs).
  final String roleArn;

  /// The subnet IDs of the VPC destination.
  final List<String> subnetIds;

  /// The ID of the VPC.
  final String vpcId;

  /// The security groups of the VPC destination.
  final List<String>? securityGroups;

  VpcDestinationConfiguration({
    required this.roleArn,
    required this.subnetIds,
    required this.vpcId,
    this.securityGroups,
  });

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    final securityGroups = this.securityGroups;
    return {
      'roleArn': roleArn,
      'subnetIds': subnetIds,
      'vpcId': vpcId,
      if (securityGroups != null) 'securityGroups': securityGroups,
    };
  }
}

/// The properties of a virtual private cloud (VPC) destination.
class VpcDestinationProperties {
  /// The ARN of a role that has permission to create and attach to elastic
  /// network interfaces (ENIs).
  final String? roleArn;

  /// The security groups of the VPC destination.
  final List<String>? securityGroups;

  /// The subnet IDs of the VPC destination.
  final List<String>? subnetIds;

  /// The ID of the VPC.
  final String? vpcId;

  VpcDestinationProperties({
    this.roleArn,
    this.securityGroups,
    this.subnetIds,
    this.vpcId,
  });

  factory VpcDestinationProperties.fromJson(Map<String, dynamic> json) {
    return VpcDestinationProperties(
      roleArn: json['roleArn'] as String?,
      securityGroups: (json['securityGroups'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String?,
    );
  }
}

/// The summary of a virtual private cloud (VPC) destination.
class VpcDestinationSummary {
  /// The ARN of a role that has permission to create and attach to elastic
  /// network interfaces (ENIs).
  final String? roleArn;

  /// The security groups of the VPC destination.
  final List<String>? securityGroups;

  /// The subnet IDs of the VPC destination.
  final List<String>? subnetIds;

  /// The ID of the VPC.
  final String? vpcId;

  VpcDestinationSummary({
    this.roleArn,
    this.securityGroups,
    this.subnetIds,
    this.vpcId,
  });

  factory VpcDestinationSummary.fromJson(Map<String, dynamic> json) {
    return VpcDestinationSummary(
      roleArn: json['roleArn'] as String?,
      securityGroups: (json['securityGroups'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String?,
    );
  }
}

class CertificateConflictException extends _s.GenericAwsException {
  CertificateConflictException({String? type, String? message})
      : super(
            type: type, code: 'CertificateConflictException', message: message);
}

class CertificateStateException extends _s.GenericAwsException {
  CertificateStateException({String? type, String? message})
      : super(type: type, code: 'CertificateStateException', message: message);
}

class CertificateValidationException extends _s.GenericAwsException {
  CertificateValidationException({String? type, String? message})
      : super(
            type: type,
            code: 'CertificateValidationException',
            message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ConflictingResourceUpdateException extends _s.GenericAwsException {
  ConflictingResourceUpdateException({String? type, String? message})
      : super(
            type: type,
            code: 'ConflictingResourceUpdateException',
            message: message);
}

class DeleteConflictException extends _s.GenericAwsException {
  DeleteConflictException({String? type, String? message})
      : super(type: type, code: 'DeleteConflictException', message: message);
}

class IndexNotReadyException extends _s.GenericAwsException {
  IndexNotReadyException({String? type, String? message})
      : super(type: type, code: 'IndexNotReadyException', message: message);
}

class InternalException extends _s.GenericAwsException {
  InternalException({String? type, String? message})
      : super(type: type, code: 'InternalException', message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidAggregationException extends _s.GenericAwsException {
  InvalidAggregationException({String? type, String? message})
      : super(
            type: type, code: 'InvalidAggregationException', message: message);
}

class InvalidQueryException extends _s.GenericAwsException {
  InvalidQueryException({String? type, String? message})
      : super(type: type, code: 'InvalidQueryException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class InvalidResponseException extends _s.GenericAwsException {
  InvalidResponseException({String? type, String? message})
      : super(type: type, code: 'InvalidResponseException', message: message);
}

class InvalidStateTransitionException extends _s.GenericAwsException {
  InvalidStateTransitionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidStateTransitionException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MalformedPolicyException extends _s.GenericAwsException {
  MalformedPolicyException({String? type, String? message})
      : super(type: type, code: 'MalformedPolicyException', message: message);
}

class NotConfiguredException extends _s.GenericAwsException {
  NotConfiguredException({String? type, String? message})
      : super(type: type, code: 'NotConfiguredException', message: message);
}

class RegistrationCodeValidationException extends _s.GenericAwsException {
  RegistrationCodeValidationException({String? type, String? message})
      : super(
            type: type,
            code: 'RegistrationCodeValidationException',
            message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceRegistrationFailureException extends _s.GenericAwsException {
  ResourceRegistrationFailureException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceRegistrationFailureException',
            message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class SqlParseException extends _s.GenericAwsException {
  SqlParseException({String? type, String? message})
      : super(type: type, code: 'SqlParseException', message: message);
}

class TaskAlreadyExistsException extends _s.GenericAwsException {
  TaskAlreadyExistsException({String? type, String? message})
      : super(type: type, code: 'TaskAlreadyExistsException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TransferAlreadyCompletedException extends _s.GenericAwsException {
  TransferAlreadyCompletedException({String? type, String? message})
      : super(
            type: type,
            code: 'TransferAlreadyCompletedException',
            message: message);
}

class TransferConflictException extends _s.GenericAwsException {
  TransferConflictException({String? type, String? message})
      : super(type: type, code: 'TransferConflictException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

class VersionConflictException extends _s.GenericAwsException {
  VersionConflictException({String? type, String? message})
      : super(type: type, code: 'VersionConflictException', message: message);
}

class VersionsLimitExceededException extends _s.GenericAwsException {
  VersionsLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'VersionsLimitExceededException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CertificateConflictException': (type, message) =>
      CertificateConflictException(type: type, message: message),
  'CertificateStateException': (type, message) =>
      CertificateStateException(type: type, message: message),
  'CertificateValidationException': (type, message) =>
      CertificateValidationException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ConflictingResourceUpdateException': (type, message) =>
      ConflictingResourceUpdateException(type: type, message: message),
  'DeleteConflictException': (type, message) =>
      DeleteConflictException(type: type, message: message),
  'IndexNotReadyException': (type, message) =>
      IndexNotReadyException(type: type, message: message),
  'InternalException': (type, message) =>
      InternalException(type: type, message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidAggregationException': (type, message) =>
      InvalidAggregationException(type: type, message: message),
  'InvalidQueryException': (type, message) =>
      InvalidQueryException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'InvalidResponseException': (type, message) =>
      InvalidResponseException(type: type, message: message),
  'InvalidStateTransitionException': (type, message) =>
      InvalidStateTransitionException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MalformedPolicyException': (type, message) =>
      MalformedPolicyException(type: type, message: message),
  'NotConfiguredException': (type, message) =>
      NotConfiguredException(type: type, message: message),
  'RegistrationCodeValidationException': (type, message) =>
      RegistrationCodeValidationException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceRegistrationFailureException': (type, message) =>
      ResourceRegistrationFailureException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'SqlParseException': (type, message) =>
      SqlParseException(type: type, message: message),
  'TaskAlreadyExistsException': (type, message) =>
      TaskAlreadyExistsException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TransferAlreadyCompletedException': (type, message) =>
      TransferAlreadyCompletedException(type: type, message: message),
  'TransferConflictException': (type, message) =>
      TransferConflictException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
  'VersionConflictException': (type, message) =>
      VersionConflictException(type: type, message: message),
  'VersionsLimitExceededException': (type, message) =>
      VersionsLimitExceededException(type: type, message: message),
};
