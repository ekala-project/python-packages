{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
}:

buildPythonPackage rec {
  pname = "pathspec";
  version = "1.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-F9tezVJBBKEg4XOBTJA2epapjQfEWy4QwvORn/+Rv1o=";
  };

  nativeBuildInputs = [ flit-core ];

  pythonImportsCheck = [ "pathspec" ];
  meta = {
    description = "Utility library for gitignore-style pattern matching of file paths";
    homepage = "https://github.com/cpburnz/python-path-specification";
    license = lib.licenses.mpl20;
    maintainers = [ ];
  };
}
