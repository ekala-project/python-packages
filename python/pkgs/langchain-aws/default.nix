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
  version = "1.6.3";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langchain-aws";
    tag = "langchain-aws==${finalAttrs.version}";
    hash = "sha256-BSq8b5hNfBRp2PkLXSJRpGqJ5+T48x0zQUYlgzzcz7E=";
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
