{ buildPythonPackage
, fetchPypi
, setuptools
, cryptography
, python-dateutil
, pbr
,
}:

buildPythonPackage rec {
  pname = "pyghmi";
  version = "1.6.18";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-lPDS72TvAALtI+D6YoT2rIvxj7J3FMSIw2t8SxZWslw=";
  };

  build-system = [
    pbr
    setuptools
  ];

  dependencies = [
    cryptography
    python-dateutil
  ];

  pythonImportsCheck = [ "pyghmi" ];

}
