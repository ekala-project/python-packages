{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "asn1";
  version = "3.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "andrivet";
    repo = "python-asn1";
    tag = "v${version}";
    hash = "sha256-gqFW+akhWwvtqJQb4LqcgjyJb6bcInl0gT6f2CMTtA0=";
  };

  build-system = [ setuptools ];

  pythonRemoveDeps = [ "enum-compat" ];

  nativeCheckInputs = [ pytestCheckHook ];

  enabledTestPaths = [ "tests/test_asn1.py" ];

  pythonImportsCheck = [ "asn1" ];

  meta = {
    description = "Python ASN.1 encoder and decoder";
    homepage = "https://github.com/andrivet/python-asn1";
    license = lib.licenses.mit;
  };
}
