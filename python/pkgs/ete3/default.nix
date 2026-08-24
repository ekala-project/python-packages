{ lib
, buildPythonPackage
, fetchPypi
, numpy
, six
, setuptools
, legacy-cgi
,
}:

buildPythonPackage rec {
  pname = "ete3";
  version = "3.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BqO3+o7ZAYewdqjbvlsbYqzulCAdPG6CL1X0SWAe9vI=";
  };

  build-system = [
    setuptools
  ];

  pythonImportsCheck = [ "ete3" ];

  dependencies = [
    six
    numpy
    legacy-cgi
  ];
  meta = {
    description = "Python framework for the analysis and visualization of trees";
    mainProgram = "ete3";
    homepage = "http://etetoolkit.org/";
    license = lib.licenses.gpl3Only;
    maintainers = [ ];
  };
}
