{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, poetry-core
, cython
,
}:

buildPythonPackage rec {
  pname = "python-constraint";
  version = "2.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-constraint";
    repo = "python-constraint";
    tag = version;
    sha256 = "sha256-VTecK82VSDoUOkPnuC+PnQYPjPBsaPeWCqm2st6Wwvg=";
  };

  build-system = [
    setuptools
    poetry-core
    cython
  ];

  meta = {
    description = "Constraint Solving Problem resolver for Python";
    homepage = "https://labix.org/doc/constraint/";
    downloadPage = "https://github.com/python-constraint/python-constraint/releases";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
