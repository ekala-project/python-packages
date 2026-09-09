{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "types-awscrt";
  version = "0.36.2";
  pyproject = true;

  src = fetchPypi {
    pname = "types_awscrt";
    inherit (finalAttrs) version;
    hash = "sha256-m9ZpldIQrLjpKnDg0QeHUrCDOja8pz8Ih0K8P9ims2M=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "awscrt-stubs" ];

  meta = {
    description = "Type annotations and code completion for awscrt";
    homepage = "https://github.com/youtype/types-awscrt";
    license = lib.licenses.mit;
  };
})
