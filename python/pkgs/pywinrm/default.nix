{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  requests,
  requests-ntlm,
  xmltodict,
}:

buildPythonPackage rec {
  pname = "pywinrm";
  version = "0.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-VCjrHklK95VFRs1P8Vye8aMKdeBbJaOf1gbO8iIB6fE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    requests-ntlm
    xmltodict
  ];

  pythonImportsCheck = [ "winrm" ];

  meta = {
    description = "Python library for Windows Remote Management";
    homepage = "https://github.com/diyan/pywinrm";
    license = lib.licenses.mit;
  };
}
