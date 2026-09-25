{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pyasn1,
  pycryptodome,
  pytestCheckHook,
  setuptools,
}:

buildPythonPackage rec {
  pname = "aiowmi";
  version = "1.1.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cesbit";
    repo = "aiowmi";
    tag = "v${version}";
    hash = "sha256-5pXMNufMdlB2FAQwsODA7S8PL/OhPFzFzpU9KB+Jtgc=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pyasn1
    pycryptodome
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "aiowmi" ];

  meta = {
    description = "Python WMI Queries";
    homepage = "https://github.com/cesbit/aiowmi";
    license = lib.licenses.gpl3Only;
  };
}
