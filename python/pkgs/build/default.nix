{
  lib,
  build,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  packaging,
  pyproject-hooks,
}:

buildPythonPackage rec {
  pname = "build";
  version = "1.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pypa";
    repo = "build";
    tag = version;
    hash = "sha256-vm47wuSEKfU4CjonokylTyGe62jGS/5m2dhLKhY5TPc=";
  };

  build-system = [ flit-core ];

  pythonRemoveDeps = [ "importlib-metadata" ];

  dependencies = [
    packaging
    pyproject-hooks
  ];

  # We need to disable tests because this package is part of the bootstrap chain
  # and its test dependencies cannot be built yet when this is being built.
  doCheck = false;

  pythonImportsCheck = [ "build" ];

  meta = {
    mainProgram = "pyproject-build";
    description = "Simple, correct PEP517 package builder";
    longDescription = ''
      build will invoke the PEP 517 hooks to build a distribution package. It
      is a simple build tool and does not perform any dependency management.
    '';
    homepage = "https://github.com/pypa/build";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
