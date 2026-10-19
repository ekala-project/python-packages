{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  mock,
  parameterized,
  pytestCheckHook,
  requests,
  responses,
}:

buildPythonPackage rec {
  pname = "nuheat";
  version = "1.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "broox";
    repo = "python-nuheat";
    tag = version;
    hash = "sha256-EsPuwILfKc1Bpvu0Qos7yooC3dBaqf46lWhiSZdu3sc=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  nativeCheckInputs = [
    mock
    parameterized
    pytestCheckHook
    responses
  ];

  pythonImportsCheck = [ "nuheat" ];

  meta = {
    description = "Library to interact with NuHeat Signature and Mapei Mapeheat radiant floor thermostats";
    homepage = "https://github.com/broox/python-nuheat";
    license = lib.licenses.mit;
  };
}
