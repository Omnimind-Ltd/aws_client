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

/// transferring large amounts of data between the AWS cloud and portable
/// storage devices that you mail to us. AWS Import/Export transfers data
/// directly onto and off of your storage devices using Amazon's high-speed
/// internal network and bypassing the Internet. For large data sets, AWS
/// Import/Export is often faster than Internet transfer and more cost effective
/// than upgrading your connectivity.
class ImportExport {
  final _s.QueryProtocol _protocol;

  ImportExport({
    String? region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'importexport',
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

  /// This operation cancels a specified job. Only the job owner can cancel it.
  /// The operation fails if the job has already started or is complete.
  ///
  /// May throw [InvalidJobIdException].
  /// May throw [ExpiredJobIdException].
  /// May throw [CanceledJobIdException].
  /// May throw [UnableToCancelJobIdException].
  /// May throw [InvalidAccessKeyIdException].
  /// May throw [InvalidVersionException].
  Future<CancelJobOutput> cancelJob({
    required String jobId,
    String? aPIVersion,
  }) async {
    final $request = <String, String>{
      'JobId': jobId,
      if (aPIVersion != null) 'APIVersion': aPIVersion,
    };
    final $result = await _protocol.send(
      $request,
      action: 'CancelJob',
      version: '2010-06-01',
      method: 'POST',
      requestUri: '/?Operation=CancelJob',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CancelJobResult',
    );
    return CancelJobOutput.fromXml($result);
  }

  /// This operation initiates the process of scheduling an upload or download
  /// of your data. You include in the request a manifest that describes the
  /// data transfer specifics. The response to the request includes a job ID,
  /// which you can use in other operations, a signature that you use to
  /// identify your storage device, and the address where you should ship your
  /// storage device.
  ///
  /// May throw [MissingParameterException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidAccessKeyIdException].
  /// May throw [InvalidAddressException].
  /// May throw [InvalidManifestFieldException].
  /// May throw [MissingManifestFieldException].
  /// May throw [NoSuchBucketException].
  /// May throw [MissingCustomsException].
  /// May throw [InvalidCustomsException].
  /// May throw [InvalidFileSystemException].
  /// May throw [MultipleRegionsException].
  /// May throw [BucketPermissionException].
  /// May throw [MalformedManifestException].
  /// May throw [CreateJobQuotaExceededException].
  /// May throw [InvalidJobIdException].
  /// May throw [InvalidVersionException].
  Future<CreateJobOutput> createJob({
    required JobType jobType,
    required String manifest,
    required bool validateOnly,
    String? aPIVersion,
    String? manifestAddendum,
  }) async {
    final $request = <String, String>{
      'JobType': jobType.value,
      'Manifest': manifest,
      'ValidateOnly': validateOnly.toString(),
      if (aPIVersion != null) 'APIVersion': aPIVersion,
      if (manifestAddendum != null) 'ManifestAddendum': manifestAddendum,
    };
    final $result = await _protocol.send(
      $request,
      action: 'CreateJob',
      version: '2010-06-01',
      method: 'POST',
      requestUri: '/?Operation=CreateJob',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'CreateJobResult',
    );
    return CreateJobOutput.fromXml($result);
  }

  /// This operation generates a pre-paid UPS shipping label that you will use
  /// to ship your device to AWS for processing.
  ///
  /// May throw [InvalidJobIdException].
  /// May throw [ExpiredJobIdException].
  /// May throw [CanceledJobIdException].
  /// May throw [InvalidAccessKeyIdException].
  /// May throw [InvalidAddressException].
  /// May throw [InvalidVersionException].
  /// May throw [InvalidParameterException].
  Future<GetShippingLabelOutput> getShippingLabel({
    required List<String> jobIds,
    String? aPIVersion,
    String? city,
    String? company,
    String? country,
    String? name,
    String? phoneNumber,
    String? postalCode,
    String? stateOrProvince,
    String? street1,
    String? street2,
    String? street3,
  }) async {
    final $request = <String, String>{
      if (jobIds.isEmpty)
        'jobIds': ''
      else
        for (var i1 = 0; i1 < jobIds.length; i1++)
          'jobIds.member.${i1 + 1}': jobIds[i1],
      if (aPIVersion != null) 'APIVersion': aPIVersion,
      if (city != null) 'city': city,
      if (company != null) 'company': company,
      if (country != null) 'country': country,
      if (name != null) 'name': name,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (postalCode != null) 'postalCode': postalCode,
      if (stateOrProvince != null) 'stateOrProvince': stateOrProvince,
      if (street1 != null) 'street1': street1,
      if (street2 != null) 'street2': street2,
      if (street3 != null) 'street3': street3,
    };
    final $result = await _protocol.send(
      $request,
      action: 'GetShippingLabel',
      version: '2010-06-01',
      method: 'POST',
      requestUri: '/?Operation=GetShippingLabel',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'GetShippingLabelResult',
    );
    return GetShippingLabelOutput.fromXml($result);
  }

  /// This operation returns information about a job, including where the job is
  /// in the processing pipeline, the status of the results, and the signature
  /// value associated with the job. You can only return information about jobs
  /// you own.
  ///
  /// May throw [InvalidJobIdException].
  /// May throw [ExpiredJobIdException].
  /// May throw [CanceledJobIdException].
  /// May throw [InvalidAccessKeyIdException].
  /// May throw [InvalidVersionException].
  Future<GetStatusOutput> getStatus({
    required String jobId,
    String? aPIVersion,
  }) async {
    final $request = <String, String>{
      'JobId': jobId,
      if (aPIVersion != null) 'APIVersion': aPIVersion,
    };
    final $result = await _protocol.send(
      $request,
      action: 'GetStatus',
      version: '2010-06-01',
      method: 'POST',
      requestUri: '/?Operation=GetStatus',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'GetStatusResult',
    );
    return GetStatusOutput.fromXml($result);
  }

  /// This operation returns the jobs associated with the requester. AWS
  /// Import/Export lists the jobs in reverse chronological order based on the
  /// date of creation. For example if Job Test1 was created 2009Dec30 and Test2
  /// was created 2010Feb05, the ListJobs operation would return Test2 followed
  /// by Test1.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidAccessKeyIdException].
  /// May throw [InvalidVersionException].
  Future<ListJobsOutput> listJobs({
    String? aPIVersion,
    String? marker,
    int? maxJobs,
  }) async {
    final $request = <String, String>{
      if (aPIVersion != null) 'APIVersion': aPIVersion,
      if (marker != null) 'Marker': marker,
      if (maxJobs != null) 'MaxJobs': maxJobs.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'ListJobs',
      version: '2010-06-01',
      method: 'POST',
      requestUri: '/?Operation=ListJobs',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'ListJobsResult',
    );
    return ListJobsOutput.fromXml($result);
  }

  /// You use this operation to change the parameters specified in the original
  /// manifest file by supplying a new manifest file. The manifest file attached
  /// to this request replaces the original manifest file. You can only use the
  /// operation after a CreateJob request but before the data transfer starts
  /// and you can only use it on jobs you own.
  ///
  /// May throw [MissingParameterException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidAccessKeyIdException].
  /// May throw [InvalidAddressException].
  /// May throw [InvalidManifestFieldException].
  /// May throw [InvalidJobIdException].
  /// May throw [MissingManifestFieldException].
  /// May throw [NoSuchBucketException].
  /// May throw [ExpiredJobIdException].
  /// May throw [CanceledJobIdException].
  /// May throw [MissingCustomsException].
  /// May throw [InvalidCustomsException].
  /// May throw [InvalidFileSystemException].
  /// May throw [MultipleRegionsException].
  /// May throw [BucketPermissionException].
  /// May throw [MalformedManifestException].
  /// May throw [UnableToUpdateJobIdException].
  /// May throw [InvalidVersionException].
  Future<UpdateJobOutput> updateJob({
    required String jobId,
    required JobType jobType,
    required String manifest,
    required bool validateOnly,
    String? aPIVersion,
  }) async {
    final $request = <String, String>{
      'JobId': jobId,
      'JobType': jobType.value,
      'Manifest': manifest,
      'ValidateOnly': validateOnly.toString(),
      if (aPIVersion != null) 'APIVersion': aPIVersion,
    };
    final $result = await _protocol.send(
      $request,
      action: 'UpdateJob',
      version: '2010-06-01',
      method: 'POST',
      requestUri: '/?Operation=UpdateJob',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'UpdateJobResult',
    );
    return UpdateJobOutput.fromXml($result);
  }
}

/// A discrete item that contains the description and URL of an artifact (such
/// as a PDF).
class Artifact {
  final String? description;
  final String? url;

  Artifact({
    this.description,
    this.url,
  });
  factory Artifact.fromXml(_s.XmlElement elem) {
    return Artifact(
      description: _s.extractXmlStringValue(elem, 'Description'),
      url: _s.extractXmlStringValue(elem, 'URL'),
    );
  }
}

/// The account specified does not have the appropriate bucket permissions.
class BucketPermissionException implements _s.AwsException {
  final String? message;

  BucketPermissionException({
    this.message,
  });
  factory BucketPermissionException.fromXml(_s.XmlElement elem) {
    return BucketPermissionException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// Output structure for the CancelJob operation.
class CancelJobOutput {
  final bool? success;

  CancelJobOutput({
    this.success,
  });
  factory CancelJobOutput.fromXml(_s.XmlElement elem) {
    return CancelJobOutput(
      success: _s.extractXmlBoolValue(elem, 'Success'),
    );
  }
}

/// The specified job ID has been canceled and is no longer valid.
class CanceledJobIdException implements _s.AwsException {
  final String? message;

  CanceledJobIdException({
    this.message,
  });
  factory CanceledJobIdException.fromXml(_s.XmlElement elem) {
    return CanceledJobIdException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// Output structure for the CreateJob operation.
class CreateJobOutput {
  final List<Artifact>? artifactList;
  final String? jobId;
  final JobType? jobType;
  final String? signature;
  final String? signatureFileContents;
  final String? warningMessage;

  CreateJobOutput({
    this.artifactList,
    this.jobId,
    this.jobType,
    this.signature,
    this.signatureFileContents,
    this.warningMessage,
  });
  factory CreateJobOutput.fromXml(_s.XmlElement elem) {
    return CreateJobOutput(
      artifactList: _s.extractXmlChild(elem, 'ArtifactList')?.let(
          (elem) => elem.findElements('member').map(Artifact.fromXml).toList()),
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
      jobType:
          _s.extractXmlStringValue(elem, 'JobType')?.let(JobType.fromString),
      signature: _s.extractXmlStringValue(elem, 'Signature'),
      signatureFileContents:
          _s.extractXmlStringValue(elem, 'SignatureFileContents'),
      warningMessage: _s.extractXmlStringValue(elem, 'WarningMessage'),
    );
  }
}

/// Each account can create only a certain number of jobs per day. If you need
/// to create more than this, please contact awsimportexport@amazon.com to
/// explain your particular use case.
class CreateJobQuotaExceededException implements _s.AwsException {
  final String? message;

  CreateJobQuotaExceededException({
    this.message,
  });
  factory CreateJobQuotaExceededException.fromXml(_s.XmlElement elem) {
    return CreateJobQuotaExceededException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// Indicates that the specified job has expired out of the system.
class ExpiredJobIdException implements _s.AwsException {
  final String? message;

  ExpiredJobIdException({
    this.message,
  });
  factory ExpiredJobIdException.fromXml(_s.XmlElement elem) {
    return ExpiredJobIdException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

class GetShippingLabelOutput {
  final String? shippingLabelURL;
  final String? warning;

  GetShippingLabelOutput({
    this.shippingLabelURL,
    this.warning,
  });
  factory GetShippingLabelOutput.fromXml(_s.XmlElement elem) {
    return GetShippingLabelOutput(
      shippingLabelURL: _s.extractXmlStringValue(elem, 'ShippingLabelURL'),
      warning: _s.extractXmlStringValue(elem, 'Warning'),
    );
  }
}

/// Output structure for the GetStatus operation.
class GetStatusOutput {
  final List<Artifact>? artifactList;
  final String? carrier;
  final DateTime? creationDate;
  final String? currentManifest;
  final int? errorCount;
  final String? jobId;
  final JobType? jobType;
  final String? locationCode;
  final String? locationMessage;
  final String? logBucket;
  final String? logKey;
  final String? progressCode;
  final String? progressMessage;
  final String? signature;
  final String? signatureFileContents;
  final String? trackingNumber;

  GetStatusOutput({
    this.artifactList,
    this.carrier,
    this.creationDate,
    this.currentManifest,
    this.errorCount,
    this.jobId,
    this.jobType,
    this.locationCode,
    this.locationMessage,
    this.logBucket,
    this.logKey,
    this.progressCode,
    this.progressMessage,
    this.signature,
    this.signatureFileContents,
    this.trackingNumber,
  });
  factory GetStatusOutput.fromXml(_s.XmlElement elem) {
    return GetStatusOutput(
      artifactList: _s.extractXmlChild(elem, 'ArtifactList')?.let(
          (elem) => elem.findElements('member').map(Artifact.fromXml).toList()),
      carrier: _s.extractXmlStringValue(elem, 'Carrier'),
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate'),
      currentManifest: _s.extractXmlStringValue(elem, 'CurrentManifest'),
      errorCount: _s.extractXmlIntValue(elem, 'ErrorCount'),
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
      jobType:
          _s.extractXmlStringValue(elem, 'JobType')?.let(JobType.fromString),
      locationCode: _s.extractXmlStringValue(elem, 'LocationCode'),
      locationMessage: _s.extractXmlStringValue(elem, 'LocationMessage'),
      logBucket: _s.extractXmlStringValue(elem, 'LogBucket'),
      logKey: _s.extractXmlStringValue(elem, 'LogKey'),
      progressCode: _s.extractXmlStringValue(elem, 'ProgressCode'),
      progressMessage: _s.extractXmlStringValue(elem, 'ProgressMessage'),
      signature: _s.extractXmlStringValue(elem, 'Signature'),
      signatureFileContents:
          _s.extractXmlStringValue(elem, 'SignatureFileContents'),
      trackingNumber: _s.extractXmlStringValue(elem, 'TrackingNumber'),
    );
  }
}

/// The AWS Access Key ID specified in the request did not match the manifest's
/// accessKeyId value. The manifest and the request authentication must use the
/// same AWS Access Key ID.
class InvalidAccessKeyIdException implements _s.AwsException {
  final String? message;

  InvalidAccessKeyIdException({
    this.message,
  });
  factory InvalidAccessKeyIdException.fromXml(_s.XmlElement elem) {
    return InvalidAccessKeyIdException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// The address specified in the manifest is invalid.
class InvalidAddressException implements _s.AwsException {
  final String? message;

  InvalidAddressException({
    this.message,
  });
  factory InvalidAddressException.fromXml(_s.XmlElement elem) {
    return InvalidAddressException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// One or more customs parameters was invalid. Please correct and resubmit.
class InvalidCustomsException implements _s.AwsException {
  final String? message;

  InvalidCustomsException({
    this.message,
  });
  factory InvalidCustomsException.fromXml(_s.XmlElement elem) {
    return InvalidCustomsException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// File system specified in export manifest is invalid.
class InvalidFileSystemException implements _s.AwsException {
  final String? message;

  InvalidFileSystemException({
    this.message,
  });
  factory InvalidFileSystemException.fromXml(_s.XmlElement elem) {
    return InvalidFileSystemException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// The JOBID was missing, not found, or not associated with the AWS account.
class InvalidJobIdException implements _s.AwsException {
  final String? message;

  InvalidJobIdException({
    this.message,
  });
  factory InvalidJobIdException.fromXml(_s.XmlElement elem) {
    return InvalidJobIdException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// One or more manifest fields was invalid. Please correct and resubmit.
class InvalidManifestFieldException implements _s.AwsException {
  final String? message;

  InvalidManifestFieldException({
    this.message,
  });
  factory InvalidManifestFieldException.fromXml(_s.XmlElement elem) {
    return InvalidManifestFieldException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// One or more parameters had an invalid value.
class InvalidParameterException implements _s.AwsException {
  final String? message;

  InvalidParameterException({
    this.message,
  });
  factory InvalidParameterException.fromXml(_s.XmlElement elem) {
    return InvalidParameterException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// The client tool version is invalid.
class InvalidVersionException implements _s.AwsException {
  final String? message;

  InvalidVersionException({
    this.message,
  });
  factory InvalidVersionException.fromXml(_s.XmlElement elem) {
    return InvalidVersionException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// Representation of a job returned by the ListJobs operation.
class Job {
  final DateTime? creationDate;
  final bool? isCanceled;
  final String? jobId;
  final JobType? jobType;

  Job({
    this.creationDate,
    this.isCanceled,
    this.jobId,
    this.jobType,
  });
  factory Job.fromXml(_s.XmlElement elem) {
    return Job(
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate'),
      isCanceled: _s.extractXmlBoolValue(elem, 'IsCanceled'),
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
      jobType:
          _s.extractXmlStringValue(elem, 'JobType')?.let(JobType.fromString),
    );
  }
}

/// Specifies whether the job to initiate is an import or export job.
enum JobType {
  import('Import'),
  export('Export'),
  ;

  final String value;

  const JobType(this.value);

  static JobType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum JobType'));
}

/// Output structure for the ListJobs operation.
class ListJobsOutput {
  final bool? isTruncated;
  final List<Job>? jobs;

  ListJobsOutput({
    this.isTruncated,
    this.jobs,
  });
  factory ListJobsOutput.fromXml(_s.XmlElement elem) {
    return ListJobsOutput(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      jobs: _s.extractXmlChild(elem, 'Jobs')?.let(
          (elem) => elem.findElements('member').map(Job.fromXml).toList()),
    );
  }
}

/// Your manifest is not well-formed.
class MalformedManifestException implements _s.AwsException {
  final String? message;

  MalformedManifestException({
    this.message,
  });
  factory MalformedManifestException.fromXml(_s.XmlElement elem) {
    return MalformedManifestException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// One or more required customs parameters was missing from the manifest.
class MissingCustomsException implements _s.AwsException {
  final String? message;

  MissingCustomsException({
    this.message,
  });
  factory MissingCustomsException.fromXml(_s.XmlElement elem) {
    return MissingCustomsException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// One or more required fields were missing from the manifest file. Please
/// correct and resubmit.
class MissingManifestFieldException implements _s.AwsException {
  final String? message;

  MissingManifestFieldException({
    this.message,
  });
  factory MissingManifestFieldException.fromXml(_s.XmlElement elem) {
    return MissingManifestFieldException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// One or more required parameters was missing from the request.
class MissingParameterException implements _s.AwsException {
  final String? message;

  MissingParameterException({
    this.message,
  });
  factory MissingParameterException.fromXml(_s.XmlElement elem) {
    return MissingParameterException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// Your manifest file contained buckets from multiple regions. A job is
/// restricted to buckets from one region. Please correct and resubmit.
class MultipleRegionsException implements _s.AwsException {
  final String? message;

  MultipleRegionsException({
    this.message,
  });
  factory MultipleRegionsException.fromXml(_s.XmlElement elem) {
    return MultipleRegionsException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// The specified bucket does not exist. Create the specified bucket or change
/// the manifest's bucket, exportBucket, or logBucket field to a bucket that the
/// account, as specified by the manifest's Access Key ID, has write permissions
/// to.
class NoSuchBucketException implements _s.AwsException {
  final String? message;

  NoSuchBucketException({
    this.message,
  });
  factory NoSuchBucketException.fromXml(_s.XmlElement elem) {
    return NoSuchBucketException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// AWS Import/Export cannot cancel the job
class UnableToCancelJobIdException implements _s.AwsException {
  final String? message;

  UnableToCancelJobIdException({
    this.message,
  });
  factory UnableToCancelJobIdException.fromXml(_s.XmlElement elem) {
    return UnableToCancelJobIdException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// AWS Import/Export cannot update the job
class UnableToUpdateJobIdException implements _s.AwsException {
  final String? message;

  UnableToUpdateJobIdException({
    this.message,
  });
  factory UnableToUpdateJobIdException.fromXml(_s.XmlElement elem) {
    return UnableToUpdateJobIdException(
      message: _s.extractXmlStringValue(elem, 'message'),
    );
  }
}

/// Output structure for the UpateJob operation.
class UpdateJobOutput {
  final List<Artifact>? artifactList;
  final bool? success;
  final String? warningMessage;

  UpdateJobOutput({
    this.artifactList,
    this.success,
    this.warningMessage,
  });
  factory UpdateJobOutput.fromXml(_s.XmlElement elem) {
    return UpdateJobOutput(
      artifactList: _s.extractXmlChild(elem, 'ArtifactList')?.let(
          (elem) => elem.findElements('member').map(Artifact.fromXml).toList()),
      success: _s.extractXmlBoolValue(elem, 'Success'),
      warningMessage: _s.extractXmlStringValue(elem, 'WarningMessage'),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BucketPermissionException': (type, message) =>
      BucketPermissionException(message: message),
  'CanceledJobIdException': (type, message) =>
      CanceledJobIdException(message: message),
  'CreateJobQuotaExceededException': (type, message) =>
      CreateJobQuotaExceededException(message: message),
  'ExpiredJobIdException': (type, message) =>
      ExpiredJobIdException(message: message),
  'InvalidAccessKeyIdException': (type, message) =>
      InvalidAccessKeyIdException(message: message),
  'InvalidAddressException': (type, message) =>
      InvalidAddressException(message: message),
  'InvalidCustomsException': (type, message) =>
      InvalidCustomsException(message: message),
  'InvalidFileSystemException': (type, message) =>
      InvalidFileSystemException(message: message),
  'InvalidJobIdException': (type, message) =>
      InvalidJobIdException(message: message),
  'InvalidManifestFieldException': (type, message) =>
      InvalidManifestFieldException(message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(message: message),
  'InvalidVersionException': (type, message) =>
      InvalidVersionException(message: message),
  'MalformedManifestException': (type, message) =>
      MalformedManifestException(message: message),
  'MissingCustomsException': (type, message) =>
      MissingCustomsException(message: message),
  'MissingManifestFieldException': (type, message) =>
      MissingManifestFieldException(message: message),
  'MissingParameterException': (type, message) =>
      MissingParameterException(message: message),
  'MultipleRegionsException': (type, message) =>
      MultipleRegionsException(message: message),
  'NoSuchBucketException': (type, message) =>
      NoSuchBucketException(message: message),
  'UnableToCancelJobIdException': (type, message) =>
      UnableToCancelJobIdException(message: message),
  'UnableToUpdateJobIdException': (type, message) =>
      UnableToUpdateJobIdException(message: message),
};
