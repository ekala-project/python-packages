{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "inversion";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ObDZnaeSS8sh/D6W7yrIXcgzRkYfdN1qdY7K/zx1u44=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "inversion" ];

  meta = {
    description = "Flexible version handling";
    homepage = "https://github.com/jimporter/inversion";
    license = with lib.licenses; [
      bsd3
      asl20
    ];
  };
})
