{
  lib,
  buildPythonPackage,
  fetchPypi,
  uv-build,
}:

buildPythonPackage (finalAttrs: {
  pname = "bidict";
  version = "0.24.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-TcpsF/CwFwDp8kNZ2qXrq/e+Ai2Z9MsqJXtq8qUHbIg=";
  };

  build-system = [ uv-build ];

  pythonImportsCheck = [ "bidict" ];

  meta = {
    description = "Bidirectional mapping library for Python";
    homepage = "https://bidict.readthedocs.io";
    license = lib.licenses.mpl20;
  };
})
