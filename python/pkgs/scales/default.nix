{
  lib,
  buildPythonPackage,
  fetchPypi,
  fetchpatch2,
  six,
  setuptools_80,
}:

buildPythonPackage rec {
  pname = "scales";
  version = "1.0.9";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-i2kw99S/EVGSKQtEx1evXiVOP8/Ldf+aUfXJakBOJ1M=";
  };

  patches = [
    (fetchpatch2 {
      url = "https://github.com/Cue/scales/commit/ee69d45f1a7f928f7b241702e9be06007444115e.patch?full_index=1";
      hash = "sha256-xBlgkh1mf+3J7GtNI0zGb7Sum8UYbTpUmM12sxK/fSU=";
    })
  ];

  build-system = [ setuptools_80 ];

  dependencies = [ six ];

  doCheck = false;

  meta = {
    description = "Stats for Python processes";
    homepage = "https://www.github.com/Cue/scales";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
