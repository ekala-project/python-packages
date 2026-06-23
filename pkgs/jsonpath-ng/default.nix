{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  ply,
  setuptools,
}:

buildPythonPackage rec {
  pname = "jsonpath-ng";
  version = "1.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "h2non";
    repo = "jsonpath-ng";
    tag = "v${version}";
    hash = "sha256-sfIqEc5SsNQYxK+Ur00fFdVoC0ysOkHrx4Cq/3SpGHw=";
  };

  build-system = [ setuptools ];

  dependencies = [ ply ];

  pythonImportsCheck = [ "jsonpath_ng" ];

  meta = {
    description = "JSONPath implementation";
    homepage = "https://github.com/h2non/jsonpath-ng";
    license = lib.licenses.asl20;
    mainProgram = "jsonpath_ng";
  };
}
