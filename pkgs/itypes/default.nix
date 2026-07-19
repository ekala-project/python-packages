{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "itypes";
  version = "1.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tomchristie";
    repo = "itypes";
    tag = version;
    hash = "sha256-omQmXzO0rk2Zh26idAPosdMW/r0bFQ2v2HkxddOVUNI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "itypes" ];

  meta = {
    description = "Simple immutable types for python";
    homepage = "https://github.com/tomchristie/itypes";
    license = lib.licenses.bsd3;
  };
}
