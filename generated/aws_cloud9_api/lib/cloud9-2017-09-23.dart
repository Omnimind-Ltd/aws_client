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

/// Cloud9 is a collection of tools that you can use to code, build, run, test,
/// debug, and release software in the cloud.
class Cloud9 {
  final _s.JsonProtocol _protocol;
  Cloud9({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cloud9',
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

  /// Creates an Cloud9 development environment, launches an Amazon Elastic
  /// Compute Cloud (Amazon EC2) instance, and then connects from the instance
  /// to the environment.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [imageId] :
  /// The identifier for the Amazon Machine Image (AMI) that's used to create
  /// the EC2 instance. To choose an AMI for the instance, you must specify a
  /// valid AMI alias or a valid Amazon EC2 Systems Manager (SSM) path.
  ///
  /// From December 04, 2023, you will be required to include the
  /// <code>imageId</code> parameter for the <code>CreateEnvironmentEC2</code>
  /// action. This change will be reflected across all direct methods of
  /// communicating with the API, such as Amazon Web Services SDK, Amazon Web
  /// Services CLI and Amazon Web Services CloudFormation. This change will only
  /// affect direct API consumers, and not Cloud9 console users.
  ///
  /// We recommend using Amazon Linux 2023 as the AMI to create your environment
  /// as it is fully supported.
  ///
  /// Since Ubuntu 18.04 has ended standard support as of May 31, 2023, we
  /// recommend you choose Ubuntu 22.04.
  ///
  /// <b>AMI aliases </b>
  ///
  /// <ul>
  /// <li>
  /// Amazon Linux 2: <code>amazonlinux-2-x86_64</code>
  /// </li>
  /// <li>
  /// Amazon Linux 2023 (recommended): <code>amazonlinux-2023-x86_64</code>
  /// </li>
  /// <li>
  /// Ubuntu 18.04: <code>ubuntu-18.04-x86_64</code>
  /// </li>
  /// <li>
  /// Ubuntu 22.04: <code>ubuntu-22.04-x86_64</code>
  /// </li>
  /// </ul>
  /// <b>SSM paths</b>
  ///
  /// <ul>
  /// <li>
  /// Amazon Linux 2:
  /// <code>resolve:ssm:/aws/service/cloud9/amis/amazonlinux-2-x86_64</code>
  /// </li>
  /// <li>
  /// Amazon Linux 2023 (recommended):
  /// <code>resolve:ssm:/aws/service/cloud9/amis/amazonlinux-2023-x86_64</code>
  /// </li>
  /// <li>
  /// Ubuntu 18.04:
  /// <code>resolve:ssm:/aws/service/cloud9/amis/ubuntu-18.04-x86_64</code>
  /// </li>
  /// <li>
  /// Ubuntu 22.04:
  /// <code>resolve:ssm:/aws/service/cloud9/amis/ubuntu-22.04-x86_64</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [instanceType] :
  /// The type of instance to connect to the environment (for example,
  /// <code>t2.micro</code>).
  ///
  /// Parameter [name] :
  /// The name of the environment to create.
  ///
  /// This name is visible to other IAM users in the same Amazon Web Services
  /// account.
  ///
  /// Parameter [automaticStopTimeMinutes] :
  /// The number of minutes until the running instance is shut down after the
  /// environment has last been used.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive string that helps Cloud9 to ensure this operation
  /// completes no more than one time.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Client
  /// Tokens</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [connectionType] :
  /// The connection type used for connecting to an Amazon EC2 environment.
  /// Valid values are <code>CONNECT_SSH</code> (default) and
  /// <code>CONNECT_SSM</code> (connected through Amazon EC2 Systems Manager).
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cloud9/latest/user-guide/ec2-ssm.html">Accessing
  /// no-ingress EC2 instances with Amazon EC2 Systems Manager</a> in the
  /// <i>Cloud9 User Guide</i>.
  ///
  /// Parameter [description] :
  /// The description of the environment to create.
  ///
  /// Parameter [dryRun] :
  /// Checks whether you have the required permissions for the action, without
  /// actually making the request, and provides an error response. If you have
  /// the required permissions, the error response is
  /// <code>DryRunOperation</code>. Otherwise, it is
  /// <code>UnauthorizedOperation</code>.
  ///
  /// Parameter [ownerArn] :
  /// The Amazon Resource Name (ARN) of the environment owner. This ARN can be
  /// the ARN of any IAM principal. If this value is not specified, the ARN
  /// defaults to this environment's creator.
  ///
  /// Parameter [subnetId] :
  /// The ID of the subnet in Amazon VPC that Cloud9 will use to communicate
  /// with the Amazon EC2 instance.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs that will be associated with the new Cloud9
  /// development environment.
  Future<CreateEnvironmentEC2Result> createEnvironmentEC2({
    required String imageId,
    required String instanceType,
    required String name,
    int? automaticStopTimeMinutes,
    String? clientRequestToken,
    ConnectionType? connectionType,
    String? description,
    bool? dryRun,
    String? ownerArn,
    String? subnetId,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'automaticStopTimeMinutes',
      automaticStopTimeMinutes,
      0,
      20160,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCloud9WorkspaceManagementService.CreateEnvironmentEC2'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'imageId': imageId,
        'instanceType': instanceType,
        'name': name,
        if (automaticStopTimeMinutes != null)
          'automaticStopTimeMinutes': automaticStopTimeMinutes,
        if (clientRequestToken != null)
          'clientRequestToken': clientRequestToken,
        if (connectionType != null) 'connectionType': connectionType.value,
        if (description != null) 'description': description,
        if (dryRun != null) 'dryRun': dryRun,
        if (ownerArn != null) 'ownerArn': ownerArn,
        if (subnetId != null) 'subnetId': subnetId,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateEnvironmentEC2Result.fromJson(jsonResponse.body);
  }

  /// Adds an environment member to an Cloud9 development environment.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment that contains the environment member you want to
  /// add.
  ///
  /// Parameter [permissions] :
  /// The type of environment member permissions you want to associate with this
  /// environment member. Available values include:
  ///
  /// <ul>
  /// <li>
  /// <code>read-only</code>: Has read-only access to the environment.
  /// </li>
  /// <li>
  /// <code>read-write</code>: Has read-write access to the environment.
  /// </li>
  /// </ul>
  ///
  /// Parameter [userArn] :
  /// The Amazon Resource Name (ARN) of the environment member you want to add.
  Future<CreateEnvironmentMembershipResult> createEnvironmentMembership({
    required String environmentId,
    required MemberPermissions permissions,
    required String userArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCloud9WorkspaceManagementService.CreateEnvironmentMembership'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentId': environmentId,
        'permissions': permissions.value,
        'userArn': userArn,
      },
    );

    return CreateEnvironmentMembershipResult.fromJson(jsonResponse.body);
  }

  /// Deletes an Cloud9 development environment. If an Amazon EC2 instance is
  /// connected to the environment, also terminates the instance.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment to delete.
  Future<void> deleteEnvironment({
    required String environmentId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCloud9WorkspaceManagementService.DeleteEnvironment'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentId': environmentId,
      },
    );
  }

  /// Deletes an environment member from a development environment.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment to delete the environment member from.
  ///
  /// Parameter [userArn] :
  /// The Amazon Resource Name (ARN) of the environment member to delete from
  /// the environment.
  Future<void> deleteEnvironmentMembership({
    required String environmentId,
    required String userArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCloud9WorkspaceManagementService.DeleteEnvironmentMembership'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentId': environmentId,
        'userArn': userArn,
      },
    );
  }

  /// Gets information about environment members for an Cloud9 development
  /// environment.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment to get environment member information about.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of environment members to get information about.
  ///
  /// Parameter [nextToken] :
  /// During a previous call, if there are more than 25 items in the list, only
  /// the first 25 items are returned, along with a unique string called a
  /// <i>next token</i>. To get the next batch of items in the list, call this
  /// operation again, adding the next token to the call. To get all of the
  /// items in the list, keep calling this operation with each subsequent next
  /// token that is returned, until no more next tokens are returned.
  ///
  /// Parameter [permissions] :
  /// The type of environment member permissions to get information about.
  /// Available values include:
  ///
  /// <ul>
  /// <li>
  /// <code>owner</code>: Owns the environment.
  /// </li>
  /// <li>
  /// <code>read-only</code>: Has read-only access to the environment.
  /// </li>
  /// <li>
  /// <code>read-write</code>: Has read-write access to the environment.
  /// </li>
  /// </ul>
  /// If no value is specified, information about all environment members are
  /// returned.
  ///
  /// Parameter [userArn] :
  /// The Amazon Resource Name (ARN) of an individual environment member to get
  /// information about. If no value is specified, information about all
  /// environment members are returned.
  Future<DescribeEnvironmentMembershipsResult> describeEnvironmentMemberships({
    String? environmentId,
    int? maxResults,
    String? nextToken,
    List<Permissions>? permissions,
    String? userArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCloud9WorkspaceManagementService.DescribeEnvironmentMemberships'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (environmentId != null) 'environmentId': environmentId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (permissions != null)
          'permissions': permissions.map((e) => e.value).toList(),
        if (userArn != null) 'userArn': userArn,
      },
    );

    return DescribeEnvironmentMembershipsResult.fromJson(jsonResponse.body);
  }

  /// Gets status information for an Cloud9 development environment.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment to get status information about.
  Future<DescribeEnvironmentStatusResult> describeEnvironmentStatus({
    required String environmentId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCloud9WorkspaceManagementService.DescribeEnvironmentStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentId': environmentId,
      },
    );

    return DescribeEnvironmentStatusResult.fromJson(jsonResponse.body);
  }

  /// Gets information about Cloud9 development environments.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [environmentIds] :
  /// The IDs of individual environments to get information about.
  Future<DescribeEnvironmentsResult> describeEnvironments({
    required List<String> environmentIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCloud9WorkspaceManagementService.DescribeEnvironments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentIds': environmentIds,
      },
    );

    return DescribeEnvironmentsResult.fromJson(jsonResponse.body);
  }

  /// Gets a list of Cloud9 development environment identifiers.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of environments to get identifiers for.
  ///
  /// Parameter [nextToken] :
  /// During a previous call, if there are more than 25 items in the list, only
  /// the first 25 items are returned, along with a unique string called a
  /// <i>next token</i>. To get the next batch of items in the list, call this
  /// operation again, adding the next token to the call. To get all of the
  /// items in the list, keep calling this operation with each subsequent next
  /// token that is returned, until no more next tokens are returned.
  Future<ListEnvironmentsResult> listEnvironments({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCloud9WorkspaceManagementService.ListEnvironments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListEnvironmentsResult.fromJson(jsonResponse.body);
  }

  /// Gets a list of the tags associated with an Cloud9 development environment.
  ///
  /// May throw [NotFoundException].
  /// May throw [InternalServerErrorException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the Cloud9 development environment to
  /// get the tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCloud9WorkspaceManagementService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Adds tags to an Cloud9 development environment.
  /// <important>
  /// Tags that you add to an Cloud9 environment by using this method will NOT
  /// be automatically propagated to underlying resources.
  /// </important>
  ///
  /// May throw [NotFoundException].
  /// May throw [InternalServerErrorException].
  /// May throw [BadRequestException].
  /// May throw [ConcurrentAccessException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the Cloud9 development environment to
  /// add tags to.
  ///
  /// Parameter [tags] :
  /// The list of tags to add to the given Cloud9 development environment.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCloud9WorkspaceManagementService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// Removes tags from an Cloud9 development environment.
  ///
  /// May throw [NotFoundException].
  /// May throw [InternalServerErrorException].
  /// May throw [BadRequestException].
  /// May throw [ConcurrentAccessException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the Cloud9 development environment to
  /// remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// The tag names of the tags to remove from the given Cloud9 development
  /// environment.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCloud9WorkspaceManagementService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Changes the settings of an existing Cloud9 development environment.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment to change settings.
  ///
  /// Parameter [description] :
  /// Any new or replacement description for the environment.
  ///
  /// Parameter [managedCredentialsAction] :
  /// Allows the environment owner to turn on or turn off the Amazon Web
  /// Services managed temporary credentials for an Cloud9 environment by using
  /// one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLE</code>
  /// </li>
  /// <li>
  /// <code>DISABLE</code>
  /// </li>
  /// </ul> <note>
  /// Only the environment owner can change the status of managed temporary
  /// credentials. An <code>AccessDeniedException</code> is thrown if an attempt
  /// to turn on or turn off managed temporary credentials is made by an account
  /// that's not the environment owner.
  /// </note>
  ///
  /// Parameter [name] :
  /// A replacement name for the environment.
  Future<void> updateEnvironment({
    required String environmentId,
    String? description,
    ManagedCredentialsAction? managedCredentialsAction,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCloud9WorkspaceManagementService.UpdateEnvironment'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentId': environmentId,
        if (description != null) 'description': description,
        if (managedCredentialsAction != null)
          'managedCredentialsAction': managedCredentialsAction.value,
        if (name != null) 'name': name,
      },
    );
  }

  /// Changes the settings of an existing environment member for an Cloud9
  /// development environment.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [environmentId] :
  /// The ID of the environment for the environment member whose settings you
  /// want to change.
  ///
  /// Parameter [permissions] :
  /// The replacement type of environment member permissions you want to
  /// associate with this environment member. Available values include:
  ///
  /// <ul>
  /// <li>
  /// <code>read-only</code>: Has read-only access to the environment.
  /// </li>
  /// <li>
  /// <code>read-write</code>: Has read-write access to the environment.
  /// </li>
  /// </ul>
  ///
  /// Parameter [userArn] :
  /// The Amazon Resource Name (ARN) of the environment member whose settings
  /// you want to change.
  Future<UpdateEnvironmentMembershipResult> updateEnvironmentMembership({
    required String environmentId,
    required MemberPermissions permissions,
    required String userArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCloud9WorkspaceManagementService.UpdateEnvironmentMembership'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentId': environmentId,
        'permissions': permissions.value,
        'userArn': userArn,
      },
    );

    return UpdateEnvironmentMembershipResult.fromJson(jsonResponse.body);
  }
}

enum ConnectionType {
  connectSsh('CONNECT_SSH'),
  connectSsm('CONNECT_SSM'),
  ;

  final String value;

  const ConnectionType(this.value);

  static ConnectionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ConnectionType'));
}

class CreateEnvironmentEC2Result {
  /// The ID of the environment that was created.
  final String? environmentId;

  CreateEnvironmentEC2Result({
    this.environmentId,
  });

  factory CreateEnvironmentEC2Result.fromJson(Map<String, dynamic> json) {
    return CreateEnvironmentEC2Result(
      environmentId: json['environmentId'] as String?,
    );
  }
}

class CreateEnvironmentMembershipResult {
  /// Information about the environment member that was added.
  final EnvironmentMember membership;

  CreateEnvironmentMembershipResult({
    required this.membership,
  });

  factory CreateEnvironmentMembershipResult.fromJson(
      Map<String, dynamic> json) {
    return CreateEnvironmentMembershipResult(
      membership: EnvironmentMember.fromJson(
          json['membership'] as Map<String, dynamic>),
    );
  }
}

class DeleteEnvironmentMembershipResult {
  DeleteEnvironmentMembershipResult();

  factory DeleteEnvironmentMembershipResult.fromJson(Map<String, dynamic> _) {
    return DeleteEnvironmentMembershipResult();
  }
}

class DeleteEnvironmentResult {
  DeleteEnvironmentResult();

  factory DeleteEnvironmentResult.fromJson(Map<String, dynamic> _) {
    return DeleteEnvironmentResult();
  }
}

class DescribeEnvironmentMembershipsResult {
  /// Information about the environment members for the environment.
  final List<EnvironmentMember>? memberships;

  /// If there are more than 25 items in the list, only the first 25 items are
  /// returned, along with a unique string called a <i>next token</i>. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call.
  final String? nextToken;

  DescribeEnvironmentMembershipsResult({
    this.memberships,
    this.nextToken,
  });

  factory DescribeEnvironmentMembershipsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeEnvironmentMembershipsResult(
      memberships: (json['memberships'] as List?)
          ?.nonNulls
          .map((e) => EnvironmentMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class DescribeEnvironmentStatusResult {
  /// Any informational message about the status of the environment.
  final String message;

  /// The status of the environment. Available values include:
  ///
  /// <ul>
  /// <li>
  /// <code>connecting</code>: The environment is connecting.
  /// </li>
  /// <li>
  /// <code>creating</code>: The environment is being created.
  /// </li>
  /// <li>
  /// <code>deleting</code>: The environment is being deleted.
  /// </li>
  /// <li>
  /// <code>error</code>: The environment is in an error state.
  /// </li>
  /// <li>
  /// <code>ready</code>: The environment is ready.
  /// </li>
  /// <li>
  /// <code>stopped</code>: The environment is stopped.
  /// </li>
  /// <li>
  /// <code>stopping</code>: The environment is stopping.
  /// </li>
  /// </ul>
  final EnvironmentStatus status;

  DescribeEnvironmentStatusResult({
    required this.message,
    required this.status,
  });

  factory DescribeEnvironmentStatusResult.fromJson(Map<String, dynamic> json) {
    return DescribeEnvironmentStatusResult(
      message: json['message'] as String,
      status: EnvironmentStatus.fromString((json['status'] as String)),
    );
  }
}

class DescribeEnvironmentsResult {
  /// Information about the environments that are returned.
  final List<Environment>? environments;

  DescribeEnvironmentsResult({
    this.environments,
  });

  factory DescribeEnvironmentsResult.fromJson(Map<String, dynamic> json) {
    return DescribeEnvironmentsResult(
      environments: (json['environments'] as List?)
          ?.nonNulls
          .map((e) => Environment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Information about an Cloud9 development environment.
class Environment {
  /// The Amazon Resource Name (ARN) of the environment.
  final String arn;

  /// The Amazon Resource Name (ARN) of the environment owner.
  final String ownerArn;

  /// The type of environment. Valid values include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ec2</code>: An Amazon Elastic Compute Cloud (Amazon EC2) instance
  /// connects to the environment.
  /// </li>
  /// <li>
  /// <code>ssh</code>: Your own server connects to the environment.
  /// </li>
  /// </ul>
  final EnvironmentType type;

  /// The connection type used for connecting to an Amazon EC2 environment.
  /// <code>CONNECT_SSH</code> is selected by default.
  final ConnectionType? connectionType;

  /// The description for the environment.
  final String? description;

  /// The ID of the environment.
  final String? id;

  /// The state of the environment in its creation or deletion lifecycle.
  final EnvironmentLifecycle? lifecycle;

  /// Describes the status of Amazon Web Services managed temporary credentials
  /// for the Cloud9 environment. Available values are:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED_ON_CREATE</code>
  /// </li>
  /// <li>
  /// <code>ENABLED_BY_OWNER</code>
  /// </li>
  /// <li>
  /// <code>DISABLED_BY_DEFAULT</code>
  /// </li>
  /// <li>
  /// <code>DISABLED_BY_OWNER</code>
  /// </li>
  /// <li>
  /// <code>DISABLED_BY_COLLABORATOR</code>
  /// </li>
  /// <li>
  /// <code>PENDING_REMOVAL_BY_COLLABORATOR</code>
  /// </li>
  /// <li>
  /// <code>PENDING_REMOVAL_BY_OWNER</code>
  /// </li>
  /// <li>
  /// <code>FAILED_REMOVAL_BY_COLLABORATOR</code>
  /// </li>
  /// <li>
  /// <code>ENABLED_BY_OWNER</code>
  /// </li>
  /// <li>
  /// <code>DISABLED_BY_DEFAULT</code>
  /// </li>
  /// </ul>
  final ManagedCredentialsStatus? managedCredentialsStatus;

  /// The name of the environment.
  final String? name;

  Environment({
    required this.arn,
    required this.ownerArn,
    required this.type,
    this.connectionType,
    this.description,
    this.id,
    this.lifecycle,
    this.managedCredentialsStatus,
    this.name,
  });

  factory Environment.fromJson(Map<String, dynamic> json) {
    return Environment(
      arn: json['arn'] as String,
      ownerArn: json['ownerArn'] as String,
      type: EnvironmentType.fromString((json['type'] as String)),
      connectionType:
          (json['connectionType'] as String?)?.let(ConnectionType.fromString),
      description: json['description'] as String?,
      id: json['id'] as String?,
      lifecycle: json['lifecycle'] != null
          ? EnvironmentLifecycle.fromJson(
              json['lifecycle'] as Map<String, dynamic>)
          : null,
      managedCredentialsStatus: (json['managedCredentialsStatus'] as String?)
          ?.let(ManagedCredentialsStatus.fromString),
      name: json['name'] as String?,
    );
  }
}

/// Information about the current creation or deletion lifecycle state of an
/// Cloud9 development environment.
class EnvironmentLifecycle {
  /// If the environment failed to delete, the Amazon Resource Name (ARN) of the
  /// related Amazon Web Services resource.
  final String? failureResource;

  /// Any informational message about the lifecycle state of the environment.
  final String? reason;

  /// The current creation or deletion lifecycle state of the environment.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code>: The environment is in the process of being created.
  /// </li>
  /// <li>
  /// <code>CREATED</code>: The environment was successfully created.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code>: The environment failed to be created.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: The environment is in the process of being deleted.
  /// </li>
  /// <li>
  /// <code>DELETE_FAILED</code>: The environment failed to delete.
  /// </li>
  /// </ul>
  final EnvironmentLifecycleStatus? status;

  EnvironmentLifecycle({
    this.failureResource,
    this.reason,
    this.status,
  });

  factory EnvironmentLifecycle.fromJson(Map<String, dynamic> json) {
    return EnvironmentLifecycle(
      failureResource: json['failureResource'] as String?,
      reason: json['reason'] as String?,
      status: (json['status'] as String?)
          ?.let(EnvironmentLifecycleStatus.fromString),
    );
  }
}

enum EnvironmentLifecycleStatus {
  creating('CREATING'),
  created('CREATED'),
  createFailed('CREATE_FAILED'),
  deleting('DELETING'),
  deleteFailed('DELETE_FAILED'),
  ;

  final String value;

  const EnvironmentLifecycleStatus(this.value);

  static EnvironmentLifecycleStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum EnvironmentLifecycleStatus'));
}

/// Information about an environment member for an Cloud9 development
/// environment.
class EnvironmentMember {
  /// The ID of the environment for the environment member.
  final String environmentId;

  /// The type of environment member permissions associated with this environment
  /// member. Available values include:
  ///
  /// <ul>
  /// <li>
  /// <code>owner</code>: Owns the environment.
  /// </li>
  /// <li>
  /// <code>read-only</code>: Has read-only access to the environment.
  /// </li>
  /// <li>
  /// <code>read-write</code>: Has read-write access to the environment.
  /// </li>
  /// </ul>
  final Permissions permissions;

  /// The Amazon Resource Name (ARN) of the environment member.
  final String userArn;

  /// The user ID in Identity and Access Management (IAM) of the environment
  /// member.
  final String userId;

  /// The time, expressed in epoch time format, when the environment member last
  /// opened the environment.
  final DateTime? lastAccess;

  EnvironmentMember({
    required this.environmentId,
    required this.permissions,
    required this.userArn,
    required this.userId,
    this.lastAccess,
  });

  factory EnvironmentMember.fromJson(Map<String, dynamic> json) {
    return EnvironmentMember(
      environmentId: json['environmentId'] as String,
      permissions: Permissions.fromString((json['permissions'] as String)),
      userArn: json['userArn'] as String,
      userId: json['userId'] as String,
      lastAccess: timeStampFromJson(json['lastAccess']),
    );
  }
}

enum EnvironmentStatus {
  error('error'),
  creating('creating'),
  connecting('connecting'),
  ready('ready'),
  stopping('stopping'),
  stopped('stopped'),
  deleting('deleting'),
  ;

  final String value;

  const EnvironmentStatus(this.value);

  static EnvironmentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum EnvironmentStatus'));
}

enum EnvironmentType {
  ssh('ssh'),
  ec2('ec2'),
  ;

  final String value;

  const EnvironmentType(this.value);

  static EnvironmentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum EnvironmentType'));
}

class ListEnvironmentsResult {
  /// The list of environment identifiers.
  final List<String>? environmentIds;

  /// If there are more than 25 items in the list, only the first 25 items are
  /// returned, along with a unique string called a <i>next token</i>. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call.
  final String? nextToken;

  ListEnvironmentsResult({
    this.environmentIds,
    this.nextToken,
  });

  factory ListEnvironmentsResult.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentsResult(
      environmentIds: (json['environmentIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListTagsForResourceResponse {
  /// The list of tags associated with the Cloud9 development environment.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum ManagedCredentialsAction {
  enable('ENABLE'),
  disable('DISABLE'),
  ;

  final String value;

  const ManagedCredentialsAction(this.value);

  static ManagedCredentialsAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ManagedCredentialsAction'));
}

enum ManagedCredentialsStatus {
  enabledOnCreate('ENABLED_ON_CREATE'),
  enabledByOwner('ENABLED_BY_OWNER'),
  disabledByDefault('DISABLED_BY_DEFAULT'),
  disabledByOwner('DISABLED_BY_OWNER'),
  disabledByCollaborator('DISABLED_BY_COLLABORATOR'),
  pendingRemovalByCollaborator('PENDING_REMOVAL_BY_COLLABORATOR'),
  pendingStartRemovalByCollaborator('PENDING_START_REMOVAL_BY_COLLABORATOR'),
  pendingRemovalByOwner('PENDING_REMOVAL_BY_OWNER'),
  pendingStartRemovalByOwner('PENDING_START_REMOVAL_BY_OWNER'),
  failedRemovalByCollaborator('FAILED_REMOVAL_BY_COLLABORATOR'),
  failedRemovalByOwner('FAILED_REMOVAL_BY_OWNER'),
  ;

  final String value;

  const ManagedCredentialsStatus(this.value);

  static ManagedCredentialsStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ManagedCredentialsStatus'));
}

enum MemberPermissions {
  readWrite('read-write'),
  readOnly('read-only'),
  ;

  final String value;

  const MemberPermissions(this.value);

  static MemberPermissions fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum MemberPermissions'));
}

enum Permissions {
  owner('owner'),
  readWrite('read-write'),
  readOnly('read-only'),
  ;

  final String value;

  const Permissions(this.value);

  static Permissions fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum Permissions'));
}

/// Metadata that is associated with Amazon Web Services resources. In
/// particular, a name-value pair that can be associated with an Cloud9
/// development environment. There are two types of tags: <i>user tags</i> and
/// <i>system tags</i>. A user tag is created by the user. A system tag is
/// automatically created by Amazon Web Services services. A system tag is
/// prefixed with <code>"aws:"</code> and cannot be modified by the user.
class Tag {
  /// The <b>name</b> part of a tag.
  final String key;

  /// The <b>value</b> part of a tag.
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }
}

class UpdateEnvironmentMembershipResult {
  /// Information about the environment member whose settings were changed.
  final EnvironmentMember? membership;

  UpdateEnvironmentMembershipResult({
    this.membership,
  });

  factory UpdateEnvironmentMembershipResult.fromJson(
      Map<String, dynamic> json) {
    return UpdateEnvironmentMembershipResult(
      membership: json['membership'] != null
          ? EnvironmentMember.fromJson(
              json['membership'] as Map<String, dynamic>)
          : null,
    );
  }
}

class UpdateEnvironmentResult {
  UpdateEnvironmentResult();

  factory UpdateEnvironmentResult.fromJson(Map<String, dynamic> _) {
    return UpdateEnvironmentResult();
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConcurrentAccessException extends _s.GenericAwsException {
  ConcurrentAccessException({String? type, String? message})
      : super(type: type, code: 'ConcurrentAccessException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConcurrentAccessException': (type, message) =>
      ConcurrentAccessException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
