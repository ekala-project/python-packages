{
  lib,
  antlr4-python3-runtime,
  aws-xray-sdk,
  boto3,
  botocore,
  buildPythonPackage,
  cfn-lint,
  crc32c,
  cryptography,
  docker,
  fetchFromGitHub,
  flask-cors,
  flask,
  freezegun,
  graphql-core,
  jinja2,
  joserfc,
  jsonpath-ng,
  jsonschema,
  multipart,
  openapi-spec-validator,
  py-partiql-parser,
  pyotp,
  pyparsing,
  pytest-order,
  pytest-xdist,
  python-dateutil,
  pyyaml,
  requests,
  responses,
  setuptools,
  werkzeug,
  xmltodict,
}:

buildPythonPackage rec {
  pname = "moto";
  version = "5.2.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "getmoto";
    repo = "moto";
    tag = version;
    hash = "sha256-edMV/EDSVxbQfTjl81y4aM490qtt5NnHSFOvO5o015I=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    boto3
    botocore
    cryptography
    requests
    xmltodict
    werkzeug
    python-dateutil
    responses
    jinja2
  ];

  optional-dependencies = {
    all = [
      antlr4-python3-runtime
      joserfc
      jsonpath-ng
      docker
      graphql-core
      pyyaml
      cfn-lint
      jsonschema
      openapi-spec-validator
      pyparsing
      py-partiql-parser
      aws-xray-sdk
      setuptools
      multipart
    ];
    proxy = [
      antlr4-python3-runtime
      joserfc
      jsonpath-ng
      docker
      graphql-core
      pyyaml
      cfn-lint
      openapi-spec-validator
      pyparsing
      py-partiql-parser
      aws-xray-sdk
      setuptools
      multipart
    ];
    server = [
      antlr4-python3-runtime
      joserfc
      jsonpath-ng
      docker
      graphql-core
      pyyaml
      cfn-lint
      openapi-spec-validator
      pyparsing
      py-partiql-parser
      aws-xray-sdk
      setuptools
      flask
      flask-cors
    ];
    acm = [ ];
    acmpca = [ ];
    amp = [ ];
    apigateway = [
      pyyaml
      joserfc
      openapi-spec-validator
    ];
    apigatewayv2 = [
      pyyaml
      openapi-spec-validator
    ];
    applicationautoscaling = [ ];
    appsync = [
      graphql-core
    ];
    athena = [ ];
    autoscaling = [ ];
    awslambda = [
      docker
    ];
    awslambda_simple = [ ];
    backup = [ ];
    batch = [
      docker
    ];
    batch_simple = [ ];
    budgets = [ ];
    ce = [ ];
    cloudformation = [
      joserfc
      docker
      graphql-core
      pyyaml
      cfn-lint
      openapi-spec-validator
      pyparsing
      py-partiql-parser
      aws-xray-sdk
      setuptools
    ];
    cloudfront = [ ];
    cloudtrail = [ ];
    cloudwatch = [ ];
    codebuild = [ ];
    codecommit = [ ];
    codepipeline = [ ];
    cognitoidentity = [ ];
    cognitoidp = [
      joserfc
    ];
    comprehend = [ ];
    config = [ ];
    databrew = [ ];
    datapipeline = [ ];
    datasync = [ ];
    dax = [ ];
    dms = [ ];
    ds = [ ];
    dynamodb = [
      docker
      py-partiql-parser
    ];
    dynamodbstreams = [
      docker
      py-partiql-parser
    ];
    ebs = [ ];
    ec2 = [ ];
    ec2instanceconnect = [ ];
    ecr = [ ];
    ecs = [ ];
    efs = [ ];
    eks = [ ];
    elasticache = [ ];
    elasticbeanstalk = [ ];
    elastictranscoder = [ ];
    elb = [ ];
    elbv2 = [ ];
    emr = [ ];
    emrcontainers = [ ];
    emrserverless = [ ];
    es = [ ];
    events = [
      jsonpath-ng
    ];
    firehose = [ ];
    forecast = [ ];
    glacier = [ ];
    glue = [
      pyparsing
    ];
    greengrass = [ ];
    guardduty = [ ];
    iam = [ ];
    inspector2 = [ ];
    iot = [ ];
    iotdata = [ ];
    ivs = [ ];
    kinesis = [ ];
    kinesisvideo = [ ];
    kinesisvideoarchivedmedia = [ ];
    kms = [ ];
    logs = [ ];
    managedblockchain = [ ];
    mediaconnect = [ ];
    medialive = [ ];
    mediapackage = [ ];
    mediastore = [ ];
    mediastoredata = [ ];
    meteringmarketplace = [ ];
    mq = [ ];
    opsworks = [ ];
    organizations = [ ];
    panorama = [ ];
    personalize = [ ];
    pinpoint = [ ];
    polly = [ ];
    quicksight = [
      jsonschema
    ];
    ram = [ ];
    rds = [ ];
    redshift = [ ];
    redshiftdata = [ ];
    rekognition = [ ];
    resourcegroups = [ ];
    resourcegroupstaggingapi = [
      joserfc
      docker
      graphql-core
      pyyaml
      cfn-lint
      openapi-spec-validator
      pyparsing
      py-partiql-parser
    ];
    route53 = [ ];
    route53resolver = [ ];
    s3 = [
      pyyaml
      py-partiql-parser
    ];
    s3crc32c = [
      pyyaml
      py-partiql-parser
      crc32c
    ];
    s3control = [ ];
    sagemaker = [ ];
    sdb = [ ];
    scheduler = [ ];
    secretsmanager = [ ];
    servicediscovery = [ ];
    servicequotas = [ ];
    ses = [ ];
    signer = [ ];
    sns = [ ];
    sqs = [ ];
    ssm = [
      pyyaml
    ];
    ssoadmin = [ ];
    stepfunctions = [
      antlr4-python3-runtime
      jsonpath-ng
    ];
    sts = [ ];
    support = [ ];
    swf = [ ];
    textract = [ ];
    timestreamwrite = [ ];
    transcribe = [ ];
    wafv2 = [ ];
    xray = [
      aws-xray-sdk
      setuptools
    ];
  };
  # Some tests depend on AWS credentials environment variables to be set.
  env.AWS_ACCESS_KEY_ID = "ak";
  env.AWS_SECRET_ACCESS_KEY = "sk";
  disabledTestMarks = [
    "network"
    "requires_docker"
  ];
  meta = {
    description = "Allows your tests to easily mock out AWS Services";
    homepage = "https://github.com/getmoto/moto";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
