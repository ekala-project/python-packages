{ buildPythonPackage
, fetchFromGitHub
, lib
, cryptography
, defusedxml
, lxml
, python-dateutil
, setuptools
, signxml
,
}:

buildPythonPackage rec {
  pname = "python-pskc";
  version = "1.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "arthurdejong";
    repo = "python-pskc";
    tag = version;
    hash = "sha256-WBpS0EJA4arAn7O47ZHq3sBOd9D4tjYZKIi24xX5Hvs=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    cryptography
    python-dateutil
  ];

  optional-dependencies = {
    defuse = [ defusedxml ];
    lxml = [ lxml ];
    signature = [ signxml ];
  };

  pythonImportsCheck = [ "pskc" ];

  meta = {
    description = "Python module for handling PSKC files";
    homepage = "https://github.com/arthurdejong/python-pskc";
    license = lib.licenses.lgpl21Plus;
    maintainers = [ ];
  };
}
