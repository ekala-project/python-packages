{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  numpy,
  pyparsing,
}:

buildPythonPackage rec {
  pname = "periodictable";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-periodictable";
    repo = "periodictable";
    tag = "v${version}";
    hash = "sha256-5Ydsntz/VnRwktnBEMfO23Malpv5u1ycBiATsxBODdc=";
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
