{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  pyproject-hooks,
}:

buildPythonPackage rec {
  pname = "pyproject-hooks";
  version = "1.2.0";
  pyproject = true;

  src = fetchPypi {
    pname = "pyproject_hooks";
    inherit version;
    hash = "sha256-HoWb1cQPrpRIZC3Yca30WeXiCEGG6NLCp5qCTJcNofg=";
  };

  nativeBuildInputs = [ flit-core ];

  # We need to disable tests because this package is part of the bootstrap chain
  # and its test dependencies cannot be built yet when this is being built.
  doCheck = false;

  pythonImportsCheck = [ "pyproject_hooks" ];

  meta = {
    description = "Low-level library for calling build-backends in `pyproject.toml`-based project";
    homepage = "https://github.com/pypa/pyproject-hooks";
    license = lib.licenses.mit;
  };
}
