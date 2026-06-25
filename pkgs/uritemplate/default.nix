{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "uritemplate";
  version = "4.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-SAwu0YCHiVWGMyPuoxsO3maHld4YJhf++cbKCebsnQ4=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "uritemplate" ];

  meta = {
    description = "Implementation of RFC 6570 URI templates";
    homepage = "https://github.com/python-hyper/uritemplate";
    license = with lib.licenses; [
      asl20
      bsd3
    ];
  };
}
