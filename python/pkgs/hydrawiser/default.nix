{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytest-asyncio,
  pytest-cov-stub,
  pytestCheckHook,
  requests,
  requests-mock,
}:

buildPythonPackage rec {
  pname = "hydrawiser";
  version = "0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ptcryan";
    repo = "hydrawiser";
    tag = "v${version}";
    sha256 = "161hazlpvd71xcl2ja86560wm5lnrjv210ki3ji37l6c6gwmhjdj";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  nativeCheckInputs = [
    pytest-asyncio
    pytest-cov-stub
    pytestCheckHook
    requests
    requests-mock
  ];

  pythonImportsCheck = [ "hydrawiser" ];

  meta = {
    description = "Python library for Hydrawise API";
    homepage = "https://github.com/ptcryan/hydrawiser";
    license = lib.licenses.mit;
  };
}
