{ lib
, stdenv
, buildPythonPackage
, docutils
, fetchPypi
, manuel
, setuptools
, zope-testrunner
,
}:

buildPythonPackage rec {
  pname = "zconfig";
  version = "4.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-RyIz5RX6Kb5shz54uKK0UMLNJdATPLRZYIN/M/GrT+M=";
  };

  patches = lib.optional stdenv.hostPlatform.isMusl ./remove-setlocale-test.patch;

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools >= 78.1.1,< 81" setuptools
  '';

  build-system = [ setuptools ];

  buildInputs = [
    docutils
    manuel
  ];

  dependencies = [ zope-testrunner ];

  pythonImportsCheck = [ "ZConfig" ];

  meta = {
    description = "Structured Configuration Library";
    homepage = "https://github.com/zopefoundation/ZConfig";
    license = lib.licenses.zpl21;
    maintainers = [ ];
  };
}
