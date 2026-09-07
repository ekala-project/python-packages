{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  boto3,
  langchain-core,
  numpy,
  pydantic,

  # tests
  langchain,

  # optional-dependencies
  anthropic,
  langchain-anthropic,

  # tests

  # passthru
  gitUpdater,
}:

buildPythonPackage (finalAttrs: {
  pname = "langchain-aws";
  version = "1.7.5";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langchain-aws";
    tag = "langchain-aws==${finalAttrs.version}";
    hash = "sha256-NEiad+vxqkks26C++GCfpGbu0Xv3Xc/9IMxHrU2JVEI=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "--snapshot-warn-unused" ""
  '';

  sourceRoot = "${finalAttrs.src.name}/libs/aws";

  build-system = [ hatchling ];

  dependencies = [
    boto3
    langchain-core
    numpy
    pydantic
  ];

  pythonRelaxDeps = [
    # Boto3 spec has outstripped the version requirement
    "boto3"
    # langchain-core>=1.6.0 required but we have 1.4.9
    "langchain-core"
  ];

  optional-dependencies = {
    anthropic = anthropic.optional-dependencies.bedrock ++ [
      langchain-anthropic
    ];
  };
  pythonImportsCheck = [ "langchain_aws" ];

  passthru = {
    # python updater script sets the wrong tag
    skipBulkUpdate = true;
    updateScript = gitUpdater {
      rev-prefix = "langchain-aws==";
      ignoredVersions = "a|b|dev|rc";
    };
  };

  meta = {
    description = "Build LangChain application on AWS";
    homepage = "https://github.com/langchain-ai/langchain-aws/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
