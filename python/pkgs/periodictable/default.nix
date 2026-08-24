{ lib
, fetchFromGitHub
, buildPythonPackage
, setuptools
, numpy
, pyparsing
,
}:

buildPythonPackage rec {
  pname = "periodictable";
  version = "2.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-periodictable";
    repo = "periodictable";
    tag = "v${version}";
    hash = "sha256-nI6hiLnqmVXT06pPkHCBEMTxZhfnZJqSImW3V9mJ4+8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    numpy
    pyparsing
  ];

  pythonImportsCheck = [ "periodictable" ];

  meta = {
    description = "Extensible periodic table of the elements";
    homepage = "https://github.com/pkienzle/periodictable";
    license = lib.licenses.publicDomain;
    maintainers = [ ];
  };
}
