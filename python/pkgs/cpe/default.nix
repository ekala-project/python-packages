{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytestCheckHook,
  setuptools,
}:

buildPythonPackage rec {
  pname = "cpe";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nilp0inter";
    repo = "cpe";
    tag = "v${version}";
    hash = "sha256-QI5XHy2TDSUqK6BZBoFWViBcOKfo+zg0ulzEzF4eg4w=";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "cpe" ];

  meta = {
    description = "Common platform enumeration for python";
    homepage = "https://github.com/nilp0inter/cpe";
    license = lib.licenses.lgpl3Plus;
    maintainers = [ ];
  };
}
