{ lib
, buildPythonPackage
, fetchPypi
, # build-system
  setuptools
, setuptools-scm9
, # dependencies
  attrdict
, pyyaml
, svgwrite
, six
,
}:

buildPythonPackage (finalAttrs: {
  pname = "wavedrom";
  version = "2.0.3.post3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-MntNXcpZPIElfCAv6lFvepCHR/sRUnw1nwNPW3r39Hs=";
  };

  build-system = [
    setuptools
    setuptools-scm9
  ];

  dependencies = [
    attrdict
    pyyaml
    svgwrite
    six
  ];

  pythonImportsCheck = [ "wavedrom" ];

  meta = {
    description = "WaveDrom compatible Python command line";
    mainProgram = "wavedrompy";
    homepage = "https://github.com/wallento/wavedrompy";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
